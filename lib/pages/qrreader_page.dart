// Note: This is a template for creating new tools

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:yaru/yaru.dart';

class QrReaderPage extends StatefulWidget {
  const QrReaderPage({ Key? key }) : super(key: key);
  @override
  State<QrReaderPage> createState() => _QrReaderPage();
}

class _QrReaderPage extends State<QrReaderPage> {
  Icon _flashIcon = const Icon(Icons.flash_off, color: YaruColors.success);
  final MobileScannerController _controller = MobileScannerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFlash() {
    _controller.toggleTorch().then((value) =>
        setState(() {
          if (_flashIcon.icon == Icons.flash_off) {
            _flashIcon = const Icon(Icons.flash_on, color: YaruColors.success);
          } else {
            _flashIcon = const Icon(Icons.flash_off, color: YaruColors.success);
          }
        }));
  }

  void flipCamera() {
    _controller.switchCamera().then((value) =>
        setState(() {
          _flashIcon = const Icon(Icons.flash_off, color: YaruColors.success);
        }));
  }

  void onScanned(BarcodeCapture capture) {
    _controller.stop();
    showCustomActionOkTextDialog(
        context, t.tools.qrreader.scanned,
        capture.barcodes.first.rawValue ?? "", () {
      _controller.start();
    });
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
                        icon: _flashIcon,
                        iconSize: 48,
                      ),
                      IconButton(
                        onPressed: () {
                          flipCamera();
                        },
                        icon: const Icon(Icons.flip_camera_android,
                            color: YaruColors.success),
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