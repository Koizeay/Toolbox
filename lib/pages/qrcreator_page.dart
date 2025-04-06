
import 'package:flutter/foundation.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:image/image.dart' as imglib;
import 'package:share_plus/share_plus.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class QrCreatorPage extends StatefulWidget {
  const QrCreatorPage({super.key});

  @override
  State<QrCreatorPage> createState() => _QrCreatorPage();
}

class _QrCreatorPage extends State<QrCreatorPage> {
  final TextEditingController _textController = TextEditingController();
  final List<DropdownMenuEntry<int>> _codeEccLevelDropdownItems = [];
  EccLevel _codeSelectedEccLevel = EccLevel.low;
  Uint8List? _codeImageBytes;

  List<DropdownMenuEntry<int>> get codeEccLevelDropdownItems {
    if (_codeEccLevelDropdownItems.isEmpty) {
      _codeEccLevelDropdownItems.addAll([
        DropdownMenuEntry(
          label: t.tools.qrcreator.ecc_low,
          value: EccLevel.low.index,
        ),
        DropdownMenuEntry(
          label: t.tools.qrcreator.ecc_medium,
          value: EccLevel.medium.index,
        ),
        DropdownMenuEntry(
          label: t.tools.qrcreator.ecc_quartile,
          value: EccLevel.quartile.index,
        ),
        DropdownMenuEntry(
          label: t.tools.qrcreator.ecc_high,
          value: EccLevel.high.index,
        ),
      ]);
    }
    return _codeEccLevelDropdownItems;
  }

  @override
  void initState() {
    super.initState();
  }

  void createCode() {
    final result = zx.encodeBarcode(
        contents: _textController.text,
        params: EncodeParams(
          format: Format.qrCode,
          width: 1200,
          height: 1200,
          margin: 100,
          eccLevel: _codeSelectedEccLevel,
        )
    );
    if (result.isValid && result.data != null) {
      try {
        final imglib.Image image = imglib.Image.fromBytes(
          width: 1200,
          height: 1200,
          bytes: result.data!.buffer,
          numChannels: 4,
        );
        _codeImageBytes = Uint8List.fromList(
          imglib.encodeJpg(image),
        );
      } catch (e) {
        if (kDebugMode) {
          print("Error creating QR code: $e");
        }
        showOkTextDialog(
            context,
            t.generic.error,
            t.tools.qrcreator.error.failed_to_create_qr_code
        );
        _codeImageBytes = null;
      }
    } else {
      _codeImageBytes = null;
    }
    setState(() {});
  }

  Future<void> saveQrCodeToFile() async {
    if (_codeImageBytes != null) {
      Uint8List data = _codeImageBytes ?? Uint8List(0);
      String cleanedText = _textController.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      final result = await FlutterFileDialog.saveFile(
          params: SaveFileDialogParams(
            fileName: "qr_code_$cleanedText.jpg",
            data: data,
          )
      );
      if (result != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.qrcreator.saved_successfully),
          ),
        );
      }
    }
  }

  Future<void> shareQrCode() async {
    if (_codeImageBytes != null) {
      Uint8List data = _codeImageBytes ?? Uint8List(0);
      final result = await Share.shareXFiles(
          [XFile.fromData(data, name: "qr_code.jpg", mimeType: "image/jpeg")],
          sharePositionOrigin: Rect.fromLTWH(MediaQuery
              .of(context)
              .size
              .width - 100, 0, 100, 100)
      );
      if (result.status == ShareResultStatus.success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.qrcreator.shared_successfully),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.qrcreator.title),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: t.tools.qrcreator.enter_text_or_url,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownMenu<int>(
                        label: Text(t.tools.qrcreator.error_correction_level),
                        width: double.infinity,
                        initialSelection: _codeSelectedEccLevel.index,
                        dropdownMenuEntries: codeEccLevelDropdownItems,
                        onSelected: (value) {
                          if (value != null) {
                            setState(() {
                              _codeSelectedEccLevel = EccLevel.values[value];
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            createCode();
                          },
                          child: Text(t.tools.qrcreator.create)
                      ),
                    ),
                    const SizedBox(height: 4),
                    _codeImageBytes != null
                        ? Column(
                      children: [
                        Image.memory(
                          _codeImageBytes ?? Uint8List(0),
                          width: 300,
                          height: 300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await saveQrCodeToFile();
                              },
                              icon: const Icon(Icons.save_alt_outlined),
                              tooltip: t.tools.qrcreator.save,
                            ),
                            IconButton(
                                onPressed: () async {
                                  await shareQrCode();
                                },
                                icon: const Icon(Icons.share_outlined),
                                tooltip: t.tools.qrcreator.share
                            ),
                          ],
                        )
                      ],
                    ) : Container(),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}