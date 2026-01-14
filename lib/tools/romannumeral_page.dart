
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/gen/strings.g.dart';

class RomanNumeralPage extends StatefulWidget {
  const RomanNumeralPage({super.key});

  @override
  State<RomanNumeralPage> createState() => _RomanNumeralPage();
}

class _RomanNumeralPage extends State<RomanNumeralPage> {

  TextEditingController numberController = TextEditingController();
  TextEditingController romanController = TextEditingController();
  String romanNumber = "";
  int digitNumber = 0;
  bool isNumberToRoman = true;

  final List<Map<int, String>> numbers = [
    {1000: "M"},
    {900: "CM"},
    {500: "D"},
    {400: "CD"},
    {100: "C"},
    {90: "XC"},
    {50: "L"},
    {40: "XL"},
    {10: "X"},
    {9: "IX"},
    {5: "V"},
    {4: "IV"},
    {1: "I"},
  ];

  String convertToRoman(int number) {
    if (number < 1 || number > 9999) {
      return "";
    }
    String result = "";
    for (int i = 0; i < numbers.length; i++) {
      int key = numbers[i].keys.first;
      while (number >= key) {
        result += numbers[i][key]!;
        number -= key;
      }
    }
    return result;
  }

  int convertToNumber(String roman) {
    roman = roman.toUpperCase();
    if (roman.isEmpty) {
      return 0;
    }
    if (!RegExp(r'^M{0,9}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$').hasMatch(roman)) {
      return 0;
    }
    int result = 0;
    for (int i = 0; i < numbers.length; i++) {
      int key = numbers[i].keys.first;
      while (roman.startsWith(numbers[i][key]!)) {
        result += key;
        roman = roman.substring(numbers[i][key]!.length);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.romannumeral.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isNumberToRoman = !isNumberToRoman;
                  numberController.clear();
                  romanController.clear();
                  romanNumber = "";
                  digitNumber = 0;
                });
                FocusManager.instance.primaryFocus?.unfocus();
              },
              icon: Icon(
                isNumberToRoman
                  ? Icons.swap_horiz
                  : Icons.swap_horiz,
              ),
              tooltip: "${t.tools.romannumeral.change_to} ${isNumberToRoman ? t.tools.romannumeral.roman_numeral : t.tools.romannumeral.number}",
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Mode Indicator Card
                Card(
                  elevation: 0,
                  color: colorScheme.secondaryContainer,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isNumberToRoman ? Icons.format_list_numbered : Icons.text_fields,
                          color: colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isNumberToRoman
                            ? "${t.tools.romannumeral.number} → ${t.tools.romannumeral.roman_numeral}"
                            : "${t.tools.romannumeral.roman_numeral} → ${t.tools.romannumeral.number}",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                            Icon(Icons.input, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Input",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        isNumberToRoman
                          ? TextField(
                              controller: numberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^[1-9]\d{0,3}$'),
                                ),
                              ],
                              decoration: InputDecoration(
                                labelText: "${t.tools.romannumeral.number_input_hint} (1-9999)",
                                filled: true,
                                fillColor: colorScheme.surfaceVariant,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(Icons.numbers, color: colorScheme.onSurfaceVariant),
                              ),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontFamily: 'monospace',
                              ),
                              onChanged: (value) {
                                value = value.trim();
                                setState(() {
                                  if (value.isNotEmpty) {
                                    int number = int.parse(value);
                                    romanNumber = convertToRoman(number);
                                  } else {
                                    romanNumber = "";
                                  }
                                });
                              },
                            )
                          : TextField(
                              controller: romanController,
                              decoration: InputDecoration(
                                labelText: t.tools.romannumeral.roman_numeral_input_hint,
                                filled: true,
                                fillColor: colorScheme.surfaceVariant,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(Icons.format_list_numbered_rtl, color: colorScheme.onSurfaceVariant),
                              ),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontFamily: 'monospace',
                              ),
                              onChanged: (value) {
                                value = value.trim();
                                setState(() {
                                  if (value.isNotEmpty) {
                                    digitNumber = convertToNumber(value);
                                  } else {
                                    digitNumber = 0;
                                  }
                                });
                              },
                            ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Output Card
                if ((isNumberToRoman && romanNumber.isNotEmpty) ||
                    (!isNumberToRoman && (digitNumber != 0 || romanController.text.trim().isNotEmpty)))
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: InkWell(
                      onTap: isNumberToRoman && romanNumber.isNotEmpty
                        ? () async {
                            await Clipboard.setData(ClipboardData(text: romanNumber));
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(t.tools.romannumeral.copied_to_clipboard),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          }
                        : null,
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.output, color: colorScheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  "Output",
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
                                color: isNumberToRoman
                                  ? colorScheme.primaryContainer
                                  : (digitNumber != 0
                                      ? colorScheme.primaryContainer
                                      : colorScheme.errorContainer),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    isNumberToRoman
                                      ? romanNumber
                                      : (digitNumber != 0
                                          ? digitNumber.toString()
                                          : t.tools.romannumeral.error.invalid_roman_numeral),
                                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: isNumberToRoman
                                        ? colorScheme.onPrimaryContainer
                                        : (digitNumber != 0
                                            ? colorScheme.onPrimaryContainer
                                            : colorScheme.onErrorContainer),
                                      fontFamily: 'monospace',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  if (isNumberToRoman && romanNumber.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.content_copy,
                                          size: 16,
                                          color: colorScheme.onPrimaryContainer,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          t.tools.romannumeral.tap_to_copy,
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: colorScheme.onPrimaryContainer,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
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