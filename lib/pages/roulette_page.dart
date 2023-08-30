
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:yaru/yaru.dart';

class RoulettePage extends StatefulWidget {
  const RoulettePage({ Key? key }) : super(key: key);

  @override
  State<RoulettePage> createState() => _RoulettePage();
}

class _RoulettePage extends State<RoulettePage> with TickerProviderStateMixin {
  bool isSpinning = false;
  StreamController<int> selected = StreamController<int>();

  List<Color> rouletteColors = [
    YaruColors.ubuntuCinnamonBrown,
    YaruColors.olive,
    YaruColors.orange,
    YaruColors.ubuntuMateGreen,
    YaruColors.kubuntuBlue,
    YaruColors.prussianGreen,
    YaruColors.warmGrey
  ];

  List<FortuneItem> rouletteItems = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initSavedRouletteUnits();
    });
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  Future<void> initSavedRouletteUnits() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedRouletteItems =
        prefs.getStringList(SHARED_PREFERENCES_TOOL_ROULETTE_ITEMS) ?? [];
    if (savedRouletteItems.length >= 2 && savedRouletteItems.length <= 8) {
      for (String item in savedRouletteItems) {
        await addRouletteUnit(item);
      }
    } else {
      await initDefaultRouletteUnits();
    }
  }

  Future<void> initDefaultRouletteUnits() async {
    await addRouletteUnit(t.tools.roulette.default_1);
    await addRouletteUnit(t.tools.roulette.default_2);
    await addRouletteUnit(t.tools.roulette.default_3);
  }

  void rollRoulette() {
    if (isSpinning) {
      return;
    }
    setState(() {
      selected.add(
        Fortune.randomInt(0, rouletteItems.length),
      );
    });
  }

  String cleanTextForRoulette(String text) {
    text = text.trim();
    if (text.length > 8) {
      text = text.substring(0, 8);
    }
    return text;
  }

  Future<void> saveRouletteUnitsToSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> rouletteItemsToSave = [];
    for (FortuneItem item in rouletteItems) {
      rouletteItemsToSave.add((item.child as Text).data ?? "?");
    }
    prefs.setStringList(
        SHARED_PREFERENCES_TOOL_ROULETTE_ITEMS, rouletteItemsToSave);
  }

  Future<void> addRouletteUnit(String text) async {
    if (rouletteItems.length >= 8) {
      showOkTextDialog(context, t.generic.warning,
          t.tools.roulette.warning.you_cant_add_more_than_x_items(
              numberOfItems: 8));
      return;
    }
    text = cleanTextForRoulette(text);
    Color color = rouletteColors[Random().nextInt(rouletteColors.length)];
    setState(() {
      rouletteItems.add(FortuneItem(
        child: Text(text),
        style: FortuneItemStyle(
          color: color,
          borderColor: color,
          borderWidth: 2,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
    });
    await saveRouletteUnitsToSharedPreferences();
  }

  Future<void> removeRouletteUnit(int index) async {
    if (rouletteItems.length <= 2) {
      showOkTextDialog(context, t.generic.warning,
          t.tools.roulette.warning.you_must_have_at_least_x_items(
              numberOfItems: 2));
      return;
    }
    setState(() {
      rouletteItems.removeAt(index);
    });
    await saveRouletteUnitsToSharedPreferences();
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
              onPressed: () async {
                Navigator.pop(context);
                if (textController.text.isEmpty) {
                  showOkTextDialog(
                      context, t.generic.warning,
                      t.tools.roulette.warning.you_must_enter_an_item_name);
                  return;
                }
                await addRouletteUnit(textController.text);
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
              itemCount: rouletteItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      "${index + 1}) ${(rouletteItems[index].child as Text).data
                          .toString()}"),
                  onTap: () async {
                    Navigator.pop(context);
                    await removeRouletteUnit(index);
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
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery
                              .of(context)
                              .size
                              .height * 0.5,
                          maxWidth: MediaQuery
                              .of(context)
                              .size
                              .height * 0.5,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            rollRoulette();
                          },
                          child: FortuneWheel(
                            physics: CircularPanPhysics(
                              duration: const Duration(seconds: 1),
                              curve: Curves.decelerate,
                            ),
                            onFling: () {
                              rollRoulette();
                            },
                            onAnimationEnd: () {
                              isSpinning = false;
                            },
                            onAnimationStart: () {
                              isSpinning = true;
                            },
                            selected: selected.stream,
                            items: rouletteItems,
                            indicators: const [
                              FortuneIndicator(
                                alignment: Alignment.topCenter,
                                child: TriangleIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                        ),
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