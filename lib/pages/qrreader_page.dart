
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class QrReaderPage extends StatefulWidget {
  const QrReaderPage({ Key? key }) : super(key: key);
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

  void onScanned(BarcodeCapture capture) {
    if (capture.barcodes.first.format == BarcodeFormat.qrCode) {
      _controller.stop();
      if (capture.barcodes.first.type == BarcodeType.url) {
        List<TextButton> buttons = [
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
            capture.barcodes.first.rawValue ?? "", buttons);
      } else {
        showCustomActionOkTextDialog(
            context, t.tools.qrreader.scanned,
            capture.barcodes.first.rawValue ?? "", () {
          _controller.start();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.qrreader.title}"),
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