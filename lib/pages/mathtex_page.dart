
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/widgets/mathtex_helplist.dart';

class MathTexPage extends StatefulWidget {
  const MathTexPage({super.key});

  @override
  State<MathTexPage> createState() => _MathTexPage();
}

class _MathTexPage extends State<MathTexPage> {
  final TextEditingController _textFieldController = TextEditingController();
  final double _defaultPixelRatio = 10;

  bool _showHelp = false;

  ScreenshotController screenshotController = ScreenshotController();
  String _mathTex = "";
  Color _selectedColor = Colors.black;

  final List<Color> colors = [
    Colors.black,
    Colors.white,
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
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _selectedColor = Theme
            .of(context)
            .brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
      }
    });
  }

  Future<void> editPixelRatio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double pixelRatio = prefs.getDouble(
        SHARED_PREFERENCES_TOOL_MATHTEX_EXPORTPIXELRATIO) ?? _defaultPixelRatio;
    if (!mounted) {
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(t.tools.mathtex.edit_pixel_ratio),
            content: TextField(
              controller: TextEditingController(text: pixelRatio.toString()),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: t.tools.mathtex.new_pixel_ratio,
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  pixelRatio = double.tryParse(value) ?? _defaultPixelRatio;
                });
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(t.generic.cancel),
              ),
              TextButton(
                onPressed: () async {
                  await prefs.setDouble(
                      SHARED_PREFERENCES_TOOL_MATHTEX_EXPORTPIXELRATIO,
                      pixelRatio);
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text(t.generic.ok),
              ),
            ],
          );
        }
    );
  }

  Future<void> exportToImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double pixelRatio = prefs.getDouble(
        SHARED_PREFERENCES_TOOL_MATHTEX_EXPORTPIXELRATIO) ?? _defaultPixelRatio;
    Uint8List? bytes = await screenshotController.capture(
        pixelRatio: pixelRatio);
    if (bytes != null) {
      String fileName = _textFieldController.text.isEmpty
          ? "mathtex"
          : _textFieldController.text;
      fileName = "${fileName.replaceAll(RegExp(r"[^a-zA-Z0-9]"), "_")}.png";
      final params = SaveFileDialogParams(data: bytes, fileName: fileName);
      await FlutterFileDialog.saveFile(params: params);
    } else {
      if (mounted) {
        showOkTextDialog(
          context,
          t.generic.error,
          t.tools.mathtex.error.an_error_occurred_while_exporting_the_image,
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
            title: Text(t.tools.mathtex.title),
            actions: [
              _showHelp ? Container() : IconButton(
                onPressed: () async {
                  await editPixelRatio();
                },
                icon: const Icon(Icons.aspect_ratio),
                tooltip: t.tools.mathtex.edit_pixel_ratio,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _showHelp = !_showHelp;
                  });
                },
                icon: Icon(_showHelp ? Icons.close_fullscreen_outlined : Icons.help_outline),
                tooltip: _showHelp ? t.tools.mathtex.close_help : t.tools.mathtex.get_help
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _showHelp
                  ? const MathTexHelpList()
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration(
                        labelText: t.tools.mathtex.enter_a_mathematical_expression_in_tex_format,
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _mathTex = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    _mathTex
                        .trim()
                        .isEmpty ? Container() : Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Screenshot(
                                controller: screenshotController,
                                child: Math.tex(
                                  _mathTex,
                                  textStyle: TextStyle(color: _selectedColor,),
                                  onErrorFallback: (FlutterMathException e) {
                                    return Column(
                                      children: [
                                        Text(
                                          t.tools.mathtex.error
                                              .an_error_occurred_while_rendering_the_mathtex,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          e.message,
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Theme
                                .of(context)
                                .brightness == Brightness.dark
                                ? Colors.grey[800]
                                : Colors.grey[200],
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (Color color in colors)
                                    IconButton(
                                      icon: Icon(
                                        Icons.circle,
                                        color: color,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _selectedColor = color;
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: () {
                                exportToImage();
                              },
                              child: Text(t.tools.mathtex.export_to_image)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
