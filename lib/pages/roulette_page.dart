
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:yaru/yaru.dart';

class RoulettePage extends StatefulWidget {
  const RoulettePage({ Key? key }) : super(key: key);

  @override
  State<RoulettePage> createState() => _RoulettePage();
}

class _RoulettePage extends State<RoulettePage> with TickerProviderStateMixin {
  late RouletteController controller;
  List<RouletteUnit> rouletteUnits = [];
  late RouletteGroup rouletteGroup;
  int pointerRotation = 0;
  TextStyle rouletteTextStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
  List<Color> rouletteColors = [
    YaruColors.ubuntuCinnamonBrown,
    YaruColors.olive,
    YaruColors.orange,
    YaruColors.ubuntuMateGreen,
    YaruColors.kubuntuBlue,
    YaruColors.textGrey,
    YaruColors.prussianGreen,
    YaruColors.warmGrey
  ];

  @override
  void initState() {
    rouletteGroup = RouletteGroup(rouletteUnits);
    controller = RouletteController(vsync: this, group: rouletteGroup);
    initDefaultRouletteUnits();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setPointerRotation() {
    setState(() {
      if (rouletteUnits.length % 2 == 0) {
        pointerRotation = 33;
      } else {
        pointerRotation = 0;
      }
    });
  }

  void initDefaultRouletteUnits() {
    addRouletteUnit(t.tools.roulette.default_1);
    addRouletteUnit(t.tools.roulette.default_2);
    addRouletteUnit(t.tools.roulette.default_3);
  }

  void rollRoulette() {
    int maxRandom = rouletteUnits.length;
    int randomTo = Random().nextInt(maxRandom);
    controller.rollTo(randomTo);
  }

  String cleanTextForRoulette(String text) {
    text = text.trim();
    if (text.length > 8) {
      text = text.substring(0, 8);
    }
    return text;
  }

  void addRouletteUnit(String text) {
    if (rouletteUnits.length >= 8) {
      showOkTextDialog(context, t.generic.warning,
          t.tools.roulette.warning.you_cant_add_more_than_x_items(
              numberOfItems: 8));
      return;
    }
    text = cleanTextForRoulette(text);
    Color color = rouletteColors[Random().nextInt(rouletteColors.length)];
    rouletteUnits.add(
      RouletteUnit.text(
        text,
        textStyle: rouletteTextStyle,
        color: color,
      ),
    );
    setState(() {
      rouletteGroup = RouletteGroup(rouletteUnits);
      controller = RouletteController(vsync: this, group: rouletteGroup);
    });
    setPointerRotation();
  }

  void removeRouletteUnit(int index) {
    if (rouletteUnits.length <= 2) {
      showOkTextDialog(context, t.generic.warning,
          t.tools.roulette.warning.you_must_have_at_least_x_items(
              numberOfItems: 2));
      return;
    }
    rouletteUnits.removeAt(index);
    setState(() {
      rouletteGroup = RouletteGroup(rouletteUnits);
      controller = RouletteController(vsync: this, group: rouletteGroup);
    });
    setPointerRotation();
  }

  void showAddRouletteUnitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController textController = TextEditingController();
        return AlertDialog(
          title: Text(t.tools.roulette.add_item),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: t.tools.roulette.item_name,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(t.generic.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (textController.text.isEmpty) {
                  showOkTextDialog(
                      context, t.generic.warning,
                      t.tools.roulette.warning.you_must_enter_an_item_name);
                  return;
                }
                addRouletteUnit(textController.text);
              },
              child: Text(t.tools.roulette.add),
            ),
          ],
        );
      },
    );
  }

  void showRemoveRouletteChoiceListDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.tools.roulette.remove_an_item),
          content: SizedBox(
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: rouletteUnits.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${index + 1}) ${rouletteUnits[index].text}"),
                  onTap: () {
                    Navigator.pop(context);
                    removeRouletteUnit(index);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(t.generic.cancel),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.roulette.title}"),
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  rollRoulette();
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        t.tools.roulette.tap_to_roll_info,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Roulette(
                            controller: controller,
                            style: RouletteStyle(
                              centerStickerColor: Colors.grey[800] ??
                                  Colors.grey,
                            ),
                          ),
                          RotationTransition(
                            turns: AlwaysStoppedAnimation(
                                pointerRotation / 360),
                            child: Image.asset(
                              "assets/images/specific/roulette_arrow.png",
                              width: 90,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                showAddRouletteUnitDialog();
                              },
                              child: Text(t.tools.roulette.add),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                showRemoveRouletteChoiceListDialog();
                              },
                              child: Text(t.tools.roulette.remove),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}