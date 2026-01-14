import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class TextCounterPage extends StatefulWidget {
  const TextCounterPage({super.key});

  @override
  State<TextCounterPage> createState() => _TextCounterPage();
}

class _TextCounterPage extends State<TextCounterPage> {

  final TextEditingController _controller = TextEditingController();

  int getTextLength() {
    return _controller.text.runes.length;
  }

  int getTrimmedTextLength() {
    return _controller.text.trim().runes.length;
  }

  int getRawTextLength() {
    return _controller.text.length;
  }

  int getLettersCount() {
    return _controller.text.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ]'), "").length;
  }

  int getWordCount() {
    return _controller.text.split(RegExp(r'\s+')).where((element) => element.contains(RegExp(r'[a-zA-ZÀ-ÿ0-9]'))).length;
  }

  int getSpaceCount() {
    return _controller.text.replaceAll(RegExp(r'[^ ]'), "").length;
  }

  int getDigitCount() {
    return _controller.text.replaceAll(RegExp(r'[^0-9]'), "").length;
  }

  int getLineCount() {
    return _controller.text.split("\n").where((element) => element.isNotEmpty).length;
  }

  int getEmptyLineCount() {
    if (_controller.text.isEmpty) {
      return 0;
    }
    return _controller.text.split("\n").where((element) => element.isEmpty).length;
  }

  int getTotalLineCount() {
    return getLineCount() + getEmptyLineCount();
  }

  Widget _buildStatRow(BuildContext context, ColorScheme colorScheme, IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
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
          title: Text(t.tools.textcounter.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: t.tools.textcounter.clear,
              onPressed: () {
                _controller.clear();
                setState(() {});
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                            Icon(Icons.text_fields, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Text Input",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: t.tools.textcounter.enter_text_here,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          maxLines: 8,
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                          onChanged: (String value) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Statistics Card
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
                            Icon(Icons.analytics, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Statistics",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildStatRow(context, colorScheme, Icons.straighten, t.tools.textcounter.length, getTextLength().toString()),
                        _buildStatRow(context, colorScheme, Icons.content_cut, t.tools.textcounter.trimmed_length, getTrimmedTextLength().toString()),
                        _buildStatRow(context, colorScheme, Icons.data_array, t.tools.textcounter.raw_length, getRawTextLength().toString()),
                        _buildStatRow(context, colorScheme, Icons.abc, t.tools.textcounter.letters, getLettersCount().toString()),
                        _buildStatRow(context, colorScheme, Icons.article, t.tools.textcounter.words, getWordCount().toString()),
                        _buildStatRow(context, colorScheme, Icons.space_bar, t.tools.textcounter.spaces, getSpaceCount().toString()),
                        _buildStatRow(context, colorScheme, Icons.pin, t.tools.textcounter.digits, getDigitCount().toString()),
                        _buildStatRow(context, colorScheme, Icons.format_align_left, t.tools.textcounter.lines, getLineCount().toString()),
                        _buildStatRow(context, colorScheme, Icons.horizontal_rule, t.tools.textcounter.empty_lines, getEmptyLineCount().toString()),
                        _buildStatRow(context, colorScheme, Icons.view_headline, t.tools.textcounter.total_lines, getTotalLineCount().toString()),
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