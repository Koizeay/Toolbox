
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.textdifferences.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Input Cards
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Old Text Card
                    Expanded(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.history, color: colorScheme.error, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    t.tools.textdifferences.old_text,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: oldTextController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                minLines: 5,
                                onChanged: (value) {
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter old text...",
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // New Text Card
                    Expanded(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.new_releases, color: colorScheme.primary, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    t.tools.textdifferences.new_text,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: newTextController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                minLines: 5,
                                onChanged: (value) {
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter new text...",
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Diff Result Card
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
                            Icon(Icons.difference, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Differences",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        (oldTextController.text.trim().isEmpty && newTextController.text.trim().isEmpty)
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceVariant.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.text_fields,
                                    size: 48,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    t.tools.textdifferences.no_text_hint,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceVariant,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: PrettyDiffText(
                                oldText: oldTextController.text,
                                newText: newTextController.text,
                                defaultTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontFamily: 'monospace',
                                ) ?? const TextStyle(),
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
      ),
    );
  }
}
