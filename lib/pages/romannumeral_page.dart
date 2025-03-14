
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.tools.romannumeral.title),
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
              icon: isNumberToRoman
                  ? const Icon(Icons.format_list_numbered_outlined)
                  : const Icon(Icons.format_list_numbered_rtl_outlined),
              tooltip: "${t.tools.romannumeral.change_to} ${isNumberToRoman ? t.tools.romannumeral.roman_numeral : t.tools.romannumeral.number}",
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isNumberToRoman
                    ? Column(
                    children: [
                      TextField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^[1-9]\d{0,3}$')),
                        ],
                        decoration: InputDecoration(
                          labelText: "${t.tools.romannumeral.number_input_hint} (1-9999)",
                          border: const OutlineInputBorder(),
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
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        child: GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(
                                text: romanNumber));
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(t.tools.romannumeral.copied_to_clipboard),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: Column(
                            children: [
                              Text(
                                romanNumber,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                  romanNumber.isEmpty ? "" : t.tools.romannumeral.tap_to_copy,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.primary,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                )
                    : Column(
                  children: [
                    TextField(
                      controller: romanController,
                      decoration: InputDecoration(
                        labelText: t.tools.romannumeral.roman_numeral_input_hint,
                        border: const OutlineInputBorder(),
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
                    const SizedBox(height: 16),
                    Text(
                      digitNumber != 0
                          ? digitNumber.toString()
                          : romanController.text.trim().isEmpty
                            ? ""
                            : t.tools.romannumeral.error.invalid_roman_numeral,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}