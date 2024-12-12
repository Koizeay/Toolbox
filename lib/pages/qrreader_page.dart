
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class QrReaderPage extends StatefulWidget {
  const QrReaderPage({ super.key });
  @override
  State<QrReaderPage> createState() => _QrReaderPage();
}

class _QrReaderPage extends State<QrReaderPage> {
  IconData _flashIcon = Icons.flash_off;
  final MobileScannerController _controller = MobileScannerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFlash() {
    _controller.toggleTorch().then((value) =>
        setState(() {
          if (_flashIcon == Icons.flash_off) {
            _flashIcon = Icons.flash_on;
          } else {
            _flashIcon = Icons.flash_off;
          }
        })
    );
  }

  void flipCamera() {
    _controller.switchCamera().then((value) =>
        setState(() {
          _flashIcon = Icons.flash_off;
        }));
  }

  void scanFromImageFile() async {
    setState(() {
      _controller.stop();
    });
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final barcodeCapture = await getBarcodeCaptureFromImageFile(image.path);
      if (barcodeCapture != null) {
        onScanned(barcodeCapture);
      } else {
        if (mounted) {
          showCustomActionOkTextDialog(
            context,
            t.tools.qrreader.error.no_qr_code_found,
            t.tools.qrreader.error.no_qr_code_found_description,
            () {
                setState(() {
                  _controller.start();
                });
              },
            barrierDismissible: false,
          );
        }
      }
    } else {
      setState(() {
        _controller.start();
      });
    }
  }

  Future<BarcodeCapture?> getBarcodeCaptureFromImageFile(String imageFilePath) async {
    return await MobileScannerPlatform.instance.analyzeImage(imageFilePath);
  }

  void onScanned(BarcodeCapture capture) {
    if (capture.barcodes.first.format == BarcodeFormat.qrCode) {
      _controller.stop();
      switch (capture.barcodes.first.type) {
        case BarcodeType.url:
          List<TextButton> buttons = [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _controller.start();
                  Clipboard.setData(ClipboardData(text: capture.barcodes.first.rawValue ?? "")).then((value) {
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
                  _controller.start();
                  launchUrlInBrowser(capture.barcodes.first.rawValue ?? "");
                },
                child: Text(t.tools.qrreader.openurl)
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _controller.start();
                },
                child: Text(t.generic.ok)
            ),
          ];
          showCustomButtonsTextDialog(context, t.tools.qrreader.scanned,
              capture.barcodes.first.rawValue ?? "", buttons, barrierDismissible: false);
          break;
        case BarcodeType.wifi:
          var ssid = capture.barcodes.first.wifi?.ssid ?? "";
          var password = capture.barcodes.first.wifi?.password ?? "";
          List<TextButton> buttons = [
            TextButton(
                onPressed: () {
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
                  Navigator.pop(context);
                  _controller.start();
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
          break;
        default:
          List<TextButton> buttons = [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _controller.start();
                  Clipboard.setData(ClipboardData(text: capture.barcodes.first.rawValue ?? "")).then((value) {
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
                  _controller.start();
                },
                child: Text(t.generic.ok)
            ),
          ];
          showCustomButtonsTextDialog(
            context, t.tools.qrreader.scanned,
            capture.barcodes.first.rawValue ?? "",
            buttons,
            barrierDismissible: false,
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.tools.qrreader.title),
          actions: [
            IconButton(
              onPressed: () {
                scanFromImageFile();
              },
              icon: const Icon(Icons.image_search),
              tooltip: t.tools.qrreader.scan_from_image,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery
                    .of(context)
                    .size
                    .height - AppBar().preferredSize.height - MediaQuery
                    .of(context)
                    .padding
                    .top - MediaQuery
                    .of(context)
                    .padding
                    .bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 1.5,
                    child: MobileScanner(
                      controller: _controller,
                      onDetect: (capture) {
                        onScanned(capture);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          toggleFlash();
                        },
                        icon: Icon(_flashIcon, color: Theme.of(context).colorScheme.primary),
                        iconSize: 48,
                      ),
                      IconButton(
                        onPressed: () {
                          flipCamera();
                        },
                        icon: Icon(Icons.flip_camera_android,
                            color: Theme.of(context).colorScheme.primary),
                        iconSize: 48,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}