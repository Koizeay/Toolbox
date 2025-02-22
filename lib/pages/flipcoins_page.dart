
import 'dart:math';

import 'package:flippy/constants/parameters.dart';
import 'package:flippy/controllers/flipperController.dart';
import 'package:flippy/flipper/regularFlipper.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/shared_preferences.dart';

class FlipCoinsPage extends StatefulWidget {
  const FlipCoinsPage({ super.key });
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
    SharedPreferences.getInstance().then((prefs) {
      String coinCode = prefs.getString(SHARED_PREFERENCES_TOOL_FLIPCOINS_CURRENTCOIN) ?? "kz";
      if (mounted) {
        setState(() {
          setCoinAsset(coinCode);
        });
      }
    });
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
      case "gbp":
        frontAsset = "assets/images/specific/flipcoins_2gbp_front.png";
        backAsset = "assets/images/specific/flipcoins_2gbp_back.png";
        break;
      default:
        frontAsset = "assets/images/specific/flipcoins_kz_front.png";
        backAsset = "assets/images/specific/flipcoins_kz_back.png";
        break;
    }
  }

  Future<void> showChangeCoinsDialog(BuildContext context) async {
    String? coinCode = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.tools.flipcoins.change_coin_currency),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("KZ (Generic)"),
                onTap: () {
                  Navigator.of(context).pop("kz");
                },
              ),
              ListTile(
                title: const Text("CHF (Fr.)"),
                onTap: () {
                  Navigator.of(context).pop("chf");
                },
              ),
              ListTile(
                title: const Text("EUR (€)"),
                onTap: () {
                  Navigator.of(context).pop("eur");
                },
              ),
              ListTile(
                title: const Text("GBP (£)"),
                onTap: () {
                  Navigator.of(context).pop("gbp");
                },
              ),
            ],
          ),
        );
      },
    );
    if (coinCode != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(SHARED_PREFERENCES_TOOL_FLIPCOINS_CURRENTCOIN, coinCode);
      setState(() {
        setCoinAsset(coinCode);
      });
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
    double imageOpacity = Theme.of(context).brightness == Brightness.dark ? 0.8 : 1.0;

    return Scaffold(
        appBar: AppBar(
          title: Text(t.tools.flipcoins.title),
          actions: [
            IconButton(
              onPressed: () {
                showChangeCoinsDialog(context);
              },
              icon: const Icon(Icons.currency_exchange_outlined),
              tooltip: t.tools.flipcoins.change_coin_currency,
            ),
          ],
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
                        front: Image.asset(
                            frontAsset,
                            opacity: AlwaysStoppedAnimation(imageOpacity)
                        ),
                        back: Image.asset(
                            backAsset,
                            opacity: AlwaysStoppedAnimation(imageOpacity)
                        ),
                        controller: controller,
                        shape: BoxShape.circle,
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        showShadow: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}