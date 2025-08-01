

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/helpers.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:toolbox/gen/strings.g.dart';


class WhiteBoardPage extends StatefulWidget {
  const WhiteBoardPage({ super.key });
  @override
  State<WhiteBoardPage> createState() => _WhiteBoardPage();
}

class _WhiteBoardPage extends State<WhiteBoardPage> {
  final DrawingController drawingController = DrawingController();

  final List<Color> colors = [
    Colors.red,
    Colors.deepOrange,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.blue,
    Colors.indigo,
    Colors.deepPurple,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> shareImage() async {
    final bytes = await drawingController.getImageData();
    if (bytes != null && mounted) {
      final data = bytes.buffer.asUint8List();
      final result = await Share.shareXFiles(
          [XFile.fromData(data, name: "whiteboard.png", mimeType: "image/png")],
          sharePositionOrigin: Rect.fromLTWH(MediaQuery
              .of(context)
              .size
              .width - 100, 0, 100, 100)
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

  Future<void> saveImageToFiles() async {
    final bytes = await drawingController.getImageData();
    final data = bytes?.buffer.asUint8List();
    if (data != null && mounted) {
      final result = await FlutterFileDialog.saveFile(
          params: SaveFileDialogParams(
            fileName: "whiteboard_${DateTime
                .now()
                .millisecondsSinceEpoch
                .round()}.png",
            data: data,
          )
      );
      if (result != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.whiteboard.save_success),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.tools.whiteboard.title),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DrawingBoard(
                      controller: drawingController,
                      boardPanEnabled: false,
                      boardScaleEnabled: false,
                      background: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 32 - (MediaQuery
                            .of(context)
                            .orientation == Orientation.landscape ? MediaQuery
                            .of(context)
                            .padding
                            .left + MediaQuery
                            .of(context)
                            .padding
                            .right : 0),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height - 340 - MediaQuery
                            .of(context)
                            .padding
                            .top - MediaQuery
                            .of(context)
                            .padding
                            .bottom,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {
                          drawingController.setPaintContent(
                              SimpleLine());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.brush_outlined),
                        onPressed: () {
                          drawingController.setPaintContent(
                              SmoothLine());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.rectangle_outlined),
                        onPressed: () {
                          drawingController.setPaintContent(
                              Rectangle());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.circle_outlined),
                        onPressed: () {
                          drawingController.setPaintContent(Circle());
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                            Icons.horizontal_rule_outlined),
                        onPressed: () {
                          drawingController.setPaintContent(
                              StraightLine());
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                            Icons.highlight_remove_outlined),
                        onPressed: () {
                          drawingController.setPaintContent(Eraser());
                        },
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.undo_outlined),
                        onPressed: () {
                          drawingController.undo();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.redo_outlined),
                        onPressed: () {
                          drawingController.redo();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outlined),
                        onPressed: () {
                          drawingController.clear();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.save_alt),
                        onPressed: () {
                          saveImageToFiles();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () {
                          shareImage();
                        },
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: MediaQuery
                        .of(context)
                        .platformBrightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.grey[200],
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final color in colors)
                            IconButton(
                              icon: Icon(
                                Icons.circle_rounded,
                                color: color,
                              ),
                              color: color,
                              onPressed: () {
                                drawingController.setStyle(color: color);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                ExValueBuilder(
                  valueListenable: drawingController.drawConfig,
                  builder: (context, DrawConfig drawConfig, child) =>
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 32,
                        child: Slider(
                          value: drawConfig.strokeWidth,
                          min: 1,
                          max: 50,
                          onChanged: (value) {
                            drawingController.setStyle(strokeWidth: value);
                          },
                        ),
                      ),
                ),
              ],
            ),
          ),
        )
    );
  }
}