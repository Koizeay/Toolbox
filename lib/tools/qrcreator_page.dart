
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
          numChannels: 1,
          bytes: result.data!.buffer,
        );
        _codeImageBytes = Uint8List.fromList(
          imglib.encodePng(image),
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
            fileName: "qr_code_$cleanedText.png",
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
          [XFile.fromData(data, name: "qr_code.png", mimeType: "image/png")],
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.qrcreator.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Input Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.qr_code_2, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "QR Code Settings",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _textController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: t.tools.qrcreator.enter_text_or_url,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.text_fields, color: colorScheme.onSurfaceVariant),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownMenu<int>(
                          label: Text(t.tools.qrcreator.error_correction_level),
                          width: MediaQuery.of(context).size.width - 64,
                          initialSelection: _codeSelectedEccLevel.index,
                          dropdownMenuEntries: codeEccLevelDropdownItems,
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onSelected: (value) {
                            if (value != null) {
                              setState(() {
                                _codeSelectedEccLevel = EccLevel.values[value];
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.create),
                            label: Text(t.tools.qrcreator.create),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              createCode();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_codeImageBytes != null) ...[
                  const SizedBox(height: 16),
                  // QR Code Display Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.qr_code_scanner, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                "Generated QR Code",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.memory(
                              _codeImageBytes ?? Uint8List(0),
                              width: 280,
                              height: 280,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: FilledButton.icon(
                                  icon: const Icon(Icons.save_alt),
                                  label: Text(t.tools.qrcreator.save),
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await saveQrCodeToFile();
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.share),
                                  label: Text(t.tools.qrcreator.share),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await shareQrCode();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}