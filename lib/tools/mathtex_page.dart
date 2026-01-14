
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
    final colorScheme = Theme.of(context).colorScheme;
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
                filled: true,
                fillColor: colorScheme.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
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
              FilledButton(
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.mathtex.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            if (!_showHelp)
              IconButton(
                onPressed: () async {
                  await editPixelRatio();
                },
                icon: const Icon(Icons.settings_outlined),
                tooltip: t.tools.mathtex.edit_pixel_ratio,
              ),
            IconButton(
              onPressed: () {
                setState(() {
                  _showHelp = !_showHelp;
                });
              },
              icon: Icon(_showHelp ? Icons.close : Icons.help_outline),
              tooltip: _showHelp ? t.tools.mathtex.close_help : t.tools.mathtex.get_help,
            ),
          ],
        ),
        body: SafeArea(
          child: _showHelp
              ? const MathTexHelpList()
              : SingleChildScrollView(
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
                                  Icon(Icons.functions, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "LaTeX Expression",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: _textFieldController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: t.tools.mathtex.enter_a_mathematical_expression_in_tex_format,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _mathTex = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_mathTex.trim().isNotEmpty) ...[
                        const SizedBox(height: 16),
                        // Preview Card
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
                                    Icon(Icons.preview, color: colorScheme.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Preview",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceVariant,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Screenshot(
                                      controller: screenshotController,
                                      child: Math.tex(
                                        _mathTex,
                                        textStyle: TextStyle(color: _selectedColor),
                                        onErrorFallback: (FlutterMathException e) {
                                          return Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: colorScheme.errorContainer,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: colorScheme.onErrorContainer,
                                                  size: 32,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  t.tools.mathtex.error.an_error_occurred_while_rendering_the_mathtex,
                                                  style: TextStyle(
                                                    color: colorScheme.onErrorContainer,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  e.message,
                                                  style: TextStyle(
                                                    color: colorScheme.onErrorContainer,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Color Picker Card
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
                                    Icon(Icons.palette, color: colorScheme.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Color",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceVariant,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (Color color in colors)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(20),
                                              onTap: () {
                                                setState(() {
                                                  _selectedColor = color;
                                                });
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: color,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: _selectedColor == color
                                                        ? colorScheme.primary
                                                        : Colors.transparent,
                                                    width: 3,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Export Button
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.download),
                            label: Text(t.tools.mathtex.export_to_image),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              exportToImage();
                            },
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
