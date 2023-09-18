
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:yaru/yaru.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({ Key? key }) : super(key: key);
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("${t.generic
                .app_name} - ${t.tools.randomnumber.title}"),
          ),
          body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            generateRandomNumber();
                          },
                          child: Card(
                            shape: const CircleBorder(),
                            color: YaruColors.success,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                  child: Text(
                                      randomNumber.toString(),
                                      style: const TextStyle(
                                          fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                      textAlign: TextAlign.center
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            child: TextField(
                              controller: minNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: t.tools.randomnumber.min,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 140,
                            child: TextField(
                              controller: maxNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: t.tools.randomnumber.max,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}