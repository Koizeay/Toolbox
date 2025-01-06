
import 'package:flutter/material.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';
import 'package:toolbox/gen/strings.g.dart';

class TextDifferencesPage extends StatefulWidget {
  const TextDifferencesPage({super.key});

  @override
  State<TextDifferencesPage> createState() => _TextDifferencesPage();
}

class _TextDifferencesPage extends State<TextDifferencesPage> {
  TextEditingController oldTextController = TextEditingController();
  TextEditingController newTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            // TODO: Replace this with the translated tool name
            title: Text(t.tools.textdifferences.title)
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 4.0, 4.0),
                          child: TextField(
                            controller: oldTextController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value) {
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: t.tools.textdifferences.old_text,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0, 4.0),
                          child: TextField(
                            controller: newTextController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value) {
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: t.tools.textdifferences.new_text,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  (oldTextController.text.trim().isEmpty && newTextController.text.trim().isEmpty)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              t.tools.textdifferences.no_text_hint,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: PrettyDiffText(
                          oldText: oldTextController.text,
                          newText: newTextController.text,
                          defaultTextStyle: TextStyle(
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
