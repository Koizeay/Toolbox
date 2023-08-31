// Note: This is a template for creating new tools

import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';
import 'package:toolbox/gen/strings.g.dart';

class WhiteBoardPage extends StatefulWidget {
  const WhiteBoardPage({ Key? key }) : super(key: key);
  @override
  State<WhiteBoardPage> createState() => _WhiteBoardPage();
}

class _WhiteBoardPage extends State<WhiteBoardPage> {
  late final PaintingBoardController controller;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.whiteboard.title}"),
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
                      controller: controller, // use here the controller
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