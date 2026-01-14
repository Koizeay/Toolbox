
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/gen/strings.g.dart';

class BitwiseCalculatorPage extends StatefulWidget {
  const BitwiseCalculatorPage({ super.key });
  @override
  State<BitwiseCalculatorPage> createState() => _BitwiseCalculatorPage();
}

class _BitwiseCalculatorPage extends State<BitwiseCalculatorPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  bool invalidInput = false;
  int result = 0;

  String getFormattedBinary(int length, int number) {
    if (invalidInput) {
      return t.tools.bitwisecalculator.error.invalid_input;
    }
    if (length == 0) {
      return "0";
    }
    return number.toRadixString(2).padLeft(length, '0');
  }

  void adjustInputPadding() {
    if (firstNumberController.text.length < secondNumberController.text.length) {
      firstNumberController.text =
          firstNumberController.text.padLeft(secondNumberController.text.length, '0');
    } else {
      secondNumberController.text =
          secondNumberController.text.padLeft(firstNumberController.text.length, '0');
    }
  }

  int getBitwiseAnd(String first, String second) {
    invalidInput = false;
    try {
      return int.parse(first, radix: 2) & int.parse(
          second, radix: 2);
    } catch (e) {
      invalidInput = true;
      return 0;
    }
  }

  int getBitwiseOr(String first, String second) {
    invalidInput = false;
    try {
      return int.parse(first, radix: 2) | int.parse(
          second, radix: 2);
    } catch (e) {
      invalidInput = true;
      return 0;
    }
  }

  int getBitwiseXor(String first, String second) {
    invalidInput = false;
    try {
      return int.parse(first, radix: 2) ^ int.parse(
          second, radix: 2);
    } catch (e) {
      invalidInput = true;
      return 0;
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
          title: Text(t.tools.bitwisecalculator.title),
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
                              "Binary Inputs",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: firstNumberController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: false),
                          maxLength: 32,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[01]')),
                          ],
                          decoration: InputDecoration(
                            labelText: t.tools.bitwisecalculator.first_number,
                            hintText: t.tools.bitwisecalculator.enter_a_binary_number,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.looks_one, color: colorScheme.onSurfaceVariant),
                          ),
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: secondNumberController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: false),
                          maxLength: 32,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[01]')),
                          ],
                          decoration: InputDecoration(
                            labelText: t.tools.bitwisecalculator.second_number,
                            hintText: t.tools.bitwisecalculator.enter_a_binary_number,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.looks_two, color: colorScheme.onSurfaceVariant),
                          ),
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Operations Card
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
                            Icon(Icons.calculate, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Operations",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    adjustInputPadding();
                                    if (firstNumberController.text.trim() == "" ||
                                        secondNumberController.text.trim() == "") {
                                      result = 0;
                                      return;
                                    }
                                    result = getBitwiseAnd(
                                      firstNumberController.text,
                                      secondNumberController.text,
                                    );
                                  });
                                },
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(t.tools.bitwisecalculator.and),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    adjustInputPadding();
                                    if (firstNumberController.text.trim() == "" ||
                                        secondNumberController.text.trim() == "") {
                                      result = 0;
                                      return;
                                    }
                                    result = getBitwiseOr(
                                      firstNumberController.text,
                                      secondNumberController.text,
                                    );
                                  });
                                },
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(t.tools.bitwisecalculator.or),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    adjustInputPadding();
                                    if (firstNumberController.text.trim() == "" ||
                                        secondNumberController.text.trim() == "") {
                                      result = 0;
                                      return;
                                    }
                                    result = getBitwiseXor(
                                      firstNumberController.text,
                                      secondNumberController.text,
                                    );
                                  });
                                },
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(t.tools.bitwisecalculator.xor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Result Card
                if (firstNumberController.text.isNotEmpty || secondNumberController.text.isNotEmpty)
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
                              Icon(Icons.output, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                "Result",
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
                              color: invalidInput ? colorScheme.errorContainer : colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                getFormattedBinary(
                                  firstNumberController.text.length,
                                  result,
                                ),
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: invalidInput ? colorScheme.onErrorContainer : colorScheme.onPrimaryContainer,
                                  fontFamily: 'monospace',
                                ),
                                textAlign: TextAlign.center,
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
      ),
    );
  }
}