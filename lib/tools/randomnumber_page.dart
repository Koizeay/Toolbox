
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({ super.key });
  @override
  State<RandomNumberPage> createState() => _RandomNumberPage();
}

class _RandomNumberPage extends State<RandomNumberPage> {
  final int minNumberLimit = -999;
  final int maxNumberLimit = 9999;

  int minNumber = 0;
  int maxNumber = 100;
  int randomNumber = 0;

  final Random random = Random();
  final TextEditingController minNumberController = TextEditingController();
  final TextEditingController maxNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    minNumberController.text = minNumber.toString();
    maxNumberController.text = maxNumber.toString();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    int _minNumber = minNumber;
    int _maxNumber = maxNumber;
    try {
      _minNumber = int.parse(minNumberController.text);
      _maxNumber = int.parse(maxNumberController.text);
    } catch (e) {
      showOkTextDialog(
          context, t.generic.error, t.tools.randomnumber.error.invalid_number);
      return;
    }
    if (_minNumber > _maxNumber) {
      showOkTextDialog(context, t.generic.error, t.tools.randomnumber.error.min_must_be_lower_than_max);
      return;
    }
    if (_minNumber < minNumberLimit || _maxNumber > maxNumberLimit) {
      showOkTextDialog(context, t.generic.error, t.tools.randomnumber.error.min_and_max_must_be_between_x_and_y(minNumberLimit: minNumberLimit, maxNumberLimit: maxNumberLimit));
      return;
    }
    minNumber = _minNumber;
    maxNumber = _maxNumber;
    setState(() {
      randomNumber = random.nextInt(maxNumber - minNumber + 1) + minNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.randomnumber.title),
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
                // Settings Card
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
                            Icon(Icons.settings, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Settings",
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
                              child: TextField(
                                controller: minNumberController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: t.tools.randomnumber.min,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.minimize, color: colorScheme.onSurfaceVariant),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: maxNumberController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: t.tools.randomnumber.max,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.add, color: colorScheme.onSurfaceVariant),
                                ),
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
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.casino, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Random Number",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.primaryContainer,
                          ),
                          child: Center(
                            child: Text(
                              randomNumber.toString(),
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: 56,
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Generate Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text("Generate"),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      generateRandomNumber();
                    },
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