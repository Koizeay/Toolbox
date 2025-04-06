
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class QrReaderPage extends StatefulWidget {
  const QrReaderPage({ super.key });
  @override
  State<QrReaderPage> createState() => _QrReaderPage();
}

class _QrReaderPage extends State<QrReaderPage> {
  bool isResultDialogOpen = false;

  @override
  void dispose() {
    zx.stopCameraProcessing();
    super.dispose();
  }

  void onScanned(Code capture, { bool showErrorIfNoResult = false }) {
    if (isResultDialogOpen) {
      return;
    }
    String? value = capture.text;
    if (value == null || value.isEmpty) {
      if (showErrorIfNoResult) {
        showOkTextDialog(
          context,
          t.tools.qrreader.error.no_qr_code,
          t.tools.qrreader.error.error_no_result,
        );
      }
      return;
    }

    if (value.startsWith("http://") || value.startsWith("https://")) {
      List<TextButton> buttons = [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              isResultDialogOpen = false;
              Clipboard.setData(ClipboardData(text: value)).then((value) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(t.tools.qrreader.copied_to_clipboard),
                    duration: const Duration(seconds: 2),
                  ));
                }
              });
            },
            child: Text(t.tools.qrreader.copy)
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              isResultDialogOpen = false;
              launchUrlInBrowser(value);
            },
            child: Text(t.tools.qrreader.openurl)
        ),
        TextButton(
            onPressed: () {
              isResultDialogOpen = false;
              Navigator.pop(context);
            },
            child: Text(t.generic.ok)
        ),
      ];
      showCustomButtonsTextDialog(
          context,
          t.tools.qrreader.scanned,
          value,
          buttons,
          barrierDismissible: false
      );
      isResultDialogOpen = true;
      return;
    } else if (value.startsWith("WIFI:")) {
      String ssid = "";
      String password = "";
      List<String> parts = value.split(";");
      for (String part in parts) {
        if (part.startsWith("S:")) {
          ssid = part.substring(2);
        } else if (part.startsWith("P:")) {
          password = part.substring(2);
        }
      }
      List<TextButton> buttons = [
        TextButton(
            onPressed: () {
              isResultDialogOpen = false;
              Clipboard.setData(ClipboardData(text: password)).then((value) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(t.tools.qrreader.copied_to_clipboard),
                    duration: const Duration(seconds: 2),
                  ));
                }
              });
            },
            child: Text(t.tools.qrreader.copy_password)
        ),
        TextButton(
            onPressed: () {
              isResultDialogOpen = false;
              Navigator.pop(context);
            },
            child: Text(t.generic.ok)
        ),
      ];
      showCustomButtonsTextDialog(
        context,
        "${t.tools.qrreader.scanned} (${t.tools.qrreader.wifi})",
        "${t.tools.qrreader.wifi_ssid}\n$ssid\n\n${t.tools.qrreader.wifi_password}\n$password",
        buttons,
        barrierDismissible: false,
      );
      isResultDialogOpen = true;
    } else {
      List<TextButton> buttons = [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              isResultDialogOpen = false;
              Clipboard.setData(ClipboardData(text: value)).then((value) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(t.tools.qrreader.copied_to_clipboard),
                    duration: const Duration(seconds: 2),
                  ));
                }
              });
            },
            child: Text(t.tools.qrreader.copy)
        ),
        TextButton(
            onPressed: () {
              isResultDialogOpen = false;
              Navigator.pop(context);
            },
            child: Text(t.generic.ok)
        ),
      ];
      showCustomButtonsTextDialog(
        context,
        t.tools.qrreader.scanned,
        value,
        buttons,
        barrierDismissible: false,
      );
      isResultDialogOpen = true;
    }
  }

  Future<void> searchQrOnImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Code resultFromPath = await zx.readBarcodeImagePath(
          image,
          DecodeParams(
            imageFormat: ImageFormat.rgb,
            format: Format.qrCode
          )
      );
      onScanned(resultFromPath, showErrorIfNoResult: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.tools.qrreader.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.image_search),
              onPressed: () async {
                await searchQrOnImage();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: ReaderWidget(
            codeFormat: Format.qrCode,
            showToggleCamera: false,
            showGallery: false,
            onScan: (result) async {
              onScanned(result);
            },
          ),
        )
    );
  }
}