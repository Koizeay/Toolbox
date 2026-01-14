
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:uuid/uuid.dart';

class UuidGeneratorPage extends StatefulWidget {
  const UuidGeneratorPage({ super.key });
  @override
  State<UuidGeneratorPage> createState() => _UuidGeneratorPage();
}

class _UuidGeneratorPage extends State<UuidGeneratorPage> {
  var uuid = const Uuid();
  String uuidString = t.tools.uuidgenerator.default_uuid_text;


  void showV5UuidDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    TextEditingController nameController = TextEditingController();
    TextEditingController namespaceController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t.tools.uuidgenerator.v5_generate_title),
            content: SizedBox(
              height: 140,
              child: Column(
                children: [
                  TextField(
                    controller: namespaceController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorScheme.surfaceVariant,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      labelText: t.tools.uuidgenerator.v5_namespace,
                      labelStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorScheme.surfaceVariant,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      labelText: t.tools.uuidgenerator.v5_name,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.generic.cancel),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    if (namespaceController.text.isEmpty) {
                      namespaceController.text = uuid.v4();
                    }
                    try {
                      uuidString = uuid.v5(
                          namespaceController.text, nameController.text);
                    } on FormatException {
                      uuidString = t.tools.uuidgenerator.error.invalid_namespace;
                    }
                  });
                  Navigator.of(context).pop();
                },
                child: Text(t.tools.uuidgenerator.generate),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.uuidgenerator.title),
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
                // UUID Display Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: uuidString));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(t.tools.uuidgenerator.copied_to_clipboard)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fingerprint, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                "UUID",
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
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SelectableText(
                              uuidString,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'monospace',
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.content_copy,
                                size: 16,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                t.tools.uuidgenerator.tap_to_copy,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Actions Card
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
                            Icon(Icons.create, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Generate",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.schedule),
                            label: Text(t.tools.uuidgenerator.v1_uuid),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                uuidString = uuid.v1();
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.shuffle),
                            label: Text(t.tools.uuidgenerator.v4_uuid),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                uuidString = uuid.v4();
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.tag),
                            label: Text(t.tools.uuidgenerator.v5_uuid),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                showV5UuidDialog();
                              });
                            },
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