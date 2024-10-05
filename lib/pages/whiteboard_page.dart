
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:widgets_to_image/widgets_to_image.dart';


class WhiteBoardPage extends StatefulWidget {
  const WhiteBoardPage({ super.key });
  @override
  State<WhiteBoardPage> createState() => _WhiteBoardPage();
}

class _WhiteBoardPage extends State<WhiteBoardPage> {
  late final PaintingBoardController controller;
  WidgetsToImageController widgetsToImageController = WidgetsToImageController();

  @override
  void initState() {
    controller = PaintingBoardController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Future<void> shareImage() async {
    final box = context.findRenderObject() as RenderBox?;
    final bytes = await widgetsToImageController.capture();
    if (bytes != null) {
      final result = await Share.shareXFiles(
          [XFile.fromData(bytes, name: "whiteboard.png", mimeType: "image/png")],
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if (result.status == ShareResultStatus.success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.tools.whiteboard.share_success),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.tools.whiteboard.title),
          actions: [
            IconButton(
              tooltip: t.tools.whiteboard.clear,
              icon: const Icon(Icons.delete),
              onPressed: () {
                controller.deletePainting();
              },
            ),
            IconButton(
              tooltip: t.tools.whiteboard.undo,
              icon: const Icon(Icons.undo),
              onPressed: () {
                controller.deleteLastLine();
              },
            ),
            IconButton(
              tooltip: t.tools.whiteboard.share,
              icon: const Icon(Icons.share),
              onPressed: () {
                shareImage();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PaintingColorBar(
                  controller: controller,
                  colorsType: ColorsType.materialWithBlackAndWhite,
                  onTap: (Color color) {
                    controller.changeBrushColor(color);
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: WidgetsToImage(
                      controller: widgetsToImageController,
                      child: PaintingBoard(
                        boardHeight: double.infinity,
                        boardWidth: double.infinity,
                        boardDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        controller: controller,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}