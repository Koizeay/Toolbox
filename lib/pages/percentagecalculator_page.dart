
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class PercentageCalculatorPage extends StatefulWidget {
  const PercentageCalculatorPage({super.key});

  @override
  State<PercentageCalculatorPage> createState() => _PercentageCalculatorPage();
}

class _PercentageCalculatorPage extends State<PercentageCalculatorPage> {

  TextEditingController basicPercentageController = TextEditingController();
  TextEditingController basicTotalController = TextEditingController();

  TextEditingController findPercentageResultController = TextEditingController();
  TextEditingController findPercentageTotalController = TextEditingController();

  TextEditingController percentageDifferenceFirstController = TextEditingController();
  TextEditingController percentageDifferenceSecondController = TextEditingController();

  void calculateBasicPercentageButtonPressed(BuildContext context) {
    if (basicPercentageController.text.isNotEmpty && basicTotalController.text.isNotEmpty) {
      double percentage = double.tryParse(basicPercentageController.text) ?? 0;
      double total = double.tryParse(basicTotalController.text) ?? 0;
      double result = (percentage / 100) * total;
      showOkTextDialog(
        context,
        t.tools.percentagecalculator.result,
        result.toStringAsFixed(2),
      );
    } else {
      showOkTextDialog(
          context,
         t.generic.error,
          t.tools.percentagecalculator.error.please_enter_valid_numbers_for_both_fields
      );
    }
  }

  void calculateFindPercentageButtonPressed(BuildContext context) {
    if (findPercentageResultController.text.isNotEmpty && findPercentageTotalController.text.isNotEmpty) {
      double result = double.tryParse(findPercentageResultController.text) ?? 0;
      double total = double.tryParse(findPercentageTotalController.text) ?? 0;
      if (total == 0) {
        showOkTextDialog(
            context,
           t.generic.error,
            t.tools.percentagecalculator.error.total_cannot_be_zero
        );
        return;
      }
      double percentage = (result / total) * 100;
      showOkTextDialog(
        context,
       t.tools.percentagecalculator.result,
       "${percentage.toStringAsFixed(2)}%",
      );
    } else {
      showOkTextDialog(
          context, 
          t.generic.error,
          t.tools.percentagecalculator.error.please_enter_valid_numbers_for_both_fields
      );
    }
  }

  void calculatePercentageDifferenceButtonPressed(BuildContext context) {
    if (percentageDifferenceFirstController.text.isNotEmpty && percentageDifferenceSecondController.text.isNotEmpty) {
      double firstValue = double.tryParse(percentageDifferenceFirstController.text) ?? 0;
      double secondValue = double.tryParse(percentageDifferenceSecondController.text) ?? 0;
      if (firstValue == 0) {
        showOkTextDialog(
            context, 
            t.generic.error, 
            t.tools.percentagecalculator.error.first_value_cannot_be_zero
        );
        return;
      }
      double difference = ((secondValue - firstValue) / firstValue) * 100;
      showOkTextDialog(
        context,
        t.tools.percentagecalculator.result,
       "${difference.toStringAsFixed(2)}%",
      );
    } else {
      showOkTextDialog(
          context,
          t.generic.error,
          t.tools.percentagecalculator.error.please_enter_valid_numbers_for_both_fields
      );
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
            title: Text(t.tools.percentagecalculator.title),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            t.tools.percentagecalculator.what_is,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: basicPercentageController,
                              decoration: InputDecoration(
                                labelText: t.tools.percentagecalculator.percentage,
                                hintText: "${t.tools.percentagecalculator.eg} 30",
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "% ${t.tools.percentagecalculator.of}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: basicTotalController,
                              decoration: InputDecoration(
                                labelText: t.tools.percentagecalculator.total,
                                hintText: "${t.tools.percentagecalculator.eg} 250",
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            calculateBasicPercentageButtonPressed(context);
                          },
                          child: Text(t.tools.percentagecalculator.calculate),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: findPercentageResultController,
                              decoration: InputDecoration(
                                labelText: t.tools.percentagecalculator.result,
                                hintText: "${t.tools.percentagecalculator.eg} 50",
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            t.tools.percentagecalculator.is_what_percentage_of,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: findPercentageTotalController,
                              decoration: InputDecoration(
                                labelText: t.tools.percentagecalculator.total,
                                hintText: "${t.tools.percentagecalculator.eg} 200",
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            calculateFindPercentageButtonPressed(context);
                          },
                          child: Text(t.tools.percentagecalculator.calculate),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          t.tools.percentagecalculator.what_is_the_percentage_difference,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            t.tools.percentagecalculator.from,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: percentageDifferenceFirstController,
                              decoration: InputDecoration(
                                labelText: t.tools.percentagecalculator.first_value,
                                hintText: "${t.tools.percentagecalculator.eg} 120",
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            t.tools.percentagecalculator.to,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: percentageDifferenceSecondController,
                              decoration: InputDecoration(
                                labelText: t.tools.percentagecalculator.second_value,
                                hintText: "${t.tools.percentagecalculator.eg} 150",
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            calculatePercentageDifferenceButtonPressed(context);
                          },
                          child: Text(t.tools.percentagecalculator.calculate),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}
