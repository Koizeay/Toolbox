
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.percentagecalculator.title),
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
                // Basic Percentage Card
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
                            Icon(Icons.percent, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                t.tools.percentagecalculator.what_is,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: basicPercentageController,
                                decoration: InputDecoration(
                                  labelText: t.tools.percentagecalculator.percentage,
                                  hintText: "${t.tools.percentagecalculator.eg} 30",
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixText: "%",
                                ),
                                keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                t.tools.percentagecalculator.of,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: basicTotalController,
                                decoration: InputDecoration(
                                  labelText: t.tools.percentagecalculator.total,
                                  hintText: "${t.tools.percentagecalculator.eg} 250",
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.calculate),
                            label: Text(t.tools.percentagecalculator.calculate),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              calculateBasicPercentageButtonPressed(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Find Percentage Card
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
                            Icon(Icons.help_outline, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                t.tools.percentagecalculator.is_what_percentage_of,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: findPercentageResultController,
                                decoration: InputDecoration(
                                  labelText: t.tools.percentagecalculator.result,
                                  hintText: "${t.tools.percentagecalculator.eg} 50",
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(Icons.arrow_forward, color: colorScheme.onSurfaceVariant),
                            ),
                            Expanded(
                              child: TextField(
                                controller: findPercentageTotalController,
                                decoration: InputDecoration(
                                  labelText: t.tools.percentagecalculator.total,
                                  hintText: "${t.tools.percentagecalculator.eg} 200",
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.calculate),
                            label: Text(t.tools.percentagecalculator.calculate),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              calculateFindPercentageButtonPressed(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Percentage Difference Card
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
                            Icon(Icons.compare_arrows, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                t.tools.percentagecalculator.what_is_the_percentage_difference,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.tools.percentagecalculator.from,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: percentageDifferenceFirstController,
                                    decoration: InputDecoration(
                                      labelText: t.tools.percentagecalculator.first_value,
                                      hintText: "${t.tools.percentagecalculator.eg} 120",
                                      filled: true,
                                      fillColor: colorScheme.surfaceVariant,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
                              child: Icon(Icons.arrow_forward, color: colorScheme.onSurfaceVariant),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.tools.percentagecalculator.to,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: percentageDifferenceSecondController,
                                    decoration: InputDecoration(
                                      labelText: t.tools.percentagecalculator.second_value,
                                      hintText: "${t.tools.percentagecalculator.eg} 150",
                                      filled: true,
                                      fillColor: colorScheme.surfaceVariant,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.calculate),
                            label: Text(t.tools.percentagecalculator.calculate),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              calculatePercentageDifferenceButtonPressed(context);
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
