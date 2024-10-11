
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.bitwisecalculator.title),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
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
                            border: const OutlineInputBorder(),
                          ),
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
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    adjustInputPadding();
                                    if (firstNumberController.text.trim() == "" ||
                                        secondNumberController.text.trim() == "") {
                                      setState(() {
                                        result = 0;
                                      });
                                      return;
                                    }
                                    result = getBitwiseAnd(
                                        firstNumberController.text,
                                        secondNumberController.text
                                    );
                                  });
                                },
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                      t.tools.bitwisecalculator.and
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    adjustInputPadding();
                                    if (firstNumberController.text.trim() == "" ||
                                        secondNumberController.text.trim() == "") {
                                      setState(() {
                                        result = 0;
                                      });
                                      return;
                                    }
                                    result = getBitwiseOr(
                                        firstNumberController.text,
                                        secondNumberController.text
                                    );
                                  });
                                },
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                      t.tools.bitwisecalculator.or
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    adjustInputPadding();
                                    if (firstNumberController.text.trim() == "" ||
                                        secondNumberController.text.trim() == "") {
                                      setState(() {
                                        result = 0;
                                      });
                                      return;
                                    }
                                    result = getBitwiseXor(
                                        firstNumberController.text,
                                        secondNumberController.text
                                    );
                                  });
                                },
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(t.tools.bitwisecalculator.xor)
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                              getFormattedBinary(
                                  firstNumberController.text.length,
                                  result
                              ),
                              style: const TextStyle(fontSize: 28)
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