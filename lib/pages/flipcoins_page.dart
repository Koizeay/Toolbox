
import 'dart:math';

import 'package:flippy/constants/parameters.dart';
import 'package:flippy/controllers/flipperController.dart';
import 'package:flippy/flipper/regularFlipper.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class FlipCoinsPage extends StatefulWidget {
  const FlipCoinsPage({ Key? key }) : super(key: key);
  @override
  State<FlipCoinsPage> createState() => _FlipCoinsPage();
}

class _FlipCoinsPage extends State<FlipCoinsPage> {
  FlipperController controller = FlipperController(dragAxis: DragAxis.both);
  bool isFlipping = false;

  String frontAsset = "";
  String backAsset = "";

  @override
  void initState() {
    setCoinAsset("kz");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void setCoinAsset(String code) {
    code = code.toLowerCase();
    switch (code) {
      case "kz":
        frontAsset = "assets/images/specific/flipcoins_kz_front.png";
        backAsset = "assets/images/specific/flipcoins_kz_back.png";
        break;
      case "chf":
        frontAsset = "assets/images/specific/flipcoins_2chf_front.png";
        backAsset = "assets/images/specific/flipcoins_2chf_back.png";
        break;
      case "eur":
        frontAsset = "assets/images/specific/flipcoins_2eur_front.png";
        backAsset = "assets/images/specific/flipcoins_2eur_back.png";
        break;
      default:
        frontAsset = "assets/images/specific/flipcoins_kz_front.png";
        backAsset = "assets/images/specific/flipcoins_kz_back.png";
        break;
    }
  }

  Future<void> flipCoin() async {
    isFlipping = true;
    int flipDirectionInt = Random().nextInt(4);
    int flipTimes = Random().nextInt(6) + 4;
    for (int i = 0; i < flipTimes; i++) {
      switch (flipDirectionInt) {
        case 0:
          controller.flipLeft();
          break;
        case 1:
          controller.flipDown();
          break;
        case 2:
          controller.flipRight();
          break;
        case 3:
          controller.flipUp();
          break;
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.flipcoins.title} "),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isFlipping) {
                        flipCoin().then((value) => isFlipping = false);
                      }
                    },
                    child: FittedBox(
                      child: Flipper(
                        front: Image.asset(frontAsset),
                        back: Image.asset(backAsset),
                        controller: controller,
                        shape: BoxShape.circle,
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        showShadow: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FilledButton(
                              onPressed: () {
                                setState(() {
                                  setCoinAsset("kz");
                                });
                              },
                              child: const Text("KZ", textAlign: TextAlign.center,)
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: FilledButton(
                              onPressed: () {
                                setState(() {
                                  setCoinAsset("chf");
                                });
                              },
                              child: const Text("CHF", textAlign: TextAlign.center,)
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: FilledButton(
                              onPressed: () {
                                setState(() {
                                  setCoinAsset("eur");
                                });
                              },
                              child: const Text("€", textAlign: TextAlign.center,)
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}