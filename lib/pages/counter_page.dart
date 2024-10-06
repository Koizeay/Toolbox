
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({ super.key });
  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  final int maxNumberInButton = 100000;
  final int minNumberInButton = -100000;

  bool isLoading = true;

  int _counter = 0;
  List<int> buttonIncrements = [1];

  late SharedPreferences prefs;

  @override
  void initState() {
    initCounter().then((_) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  Future<void> initCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(SHARED_PREFERENCES_TOOL_COUNTER_VALUE) ?? 0;
      buttonIncrements = prefs.getStringList(SHARED_PREFERENCES_TOOL_COUNTER_BUTTONS)?.map((e) => int.parse(e)).toList() ?? [1];
      buttonIncrements.removeWhere((element) => element > maxNumberInButton || element < minNumberInButton);
      buttonIncrements.sort();
    });
  }

  void incrementCounter(int amount) {
    setState(() {
      _counter += amount;
    });
    prefs.setInt(SHARED_PREFERENCES_TOOL_COUNTER_VALUE, _counter);
  }

  void showRemoveButtonDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.tools.counter.remove_button),
          content: SizedBox(
            height: 45 * buttonIncrements.length.toDouble(),
            width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: buttonIncrements.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${buttonIncrements[index]}"),
                  onTap: () {
                    if (buttonIncrements.length == 1) {
                      Navigator.of(context).pop();
                      showOkTextDialog(
                          context,
                          t.generic.error,
                          t.tools.counter.error.you_must_have_at_least_one_button,
                      );
                      return;
                    }
                    setState(() {
                      buttonIncrements.removeAt(index);
                    });
                    prefs.setStringList(SHARED_PREFERENCES_TOOL_COUNTER_BUTTONS, buttonIncrements.map((e) => e.toString()).toList());
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(t.generic.cancel),
            )
          ],
        );
      },
    );
  }

  void showAddButtonDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.tools.counter.add_button),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: t.tools.counter.enter_number,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(t.generic.cancel),
            ),
            TextButton(
              onPressed: () {
                try {
                  int.parse(controller.text);
                } catch (e) {
                  Navigator.of(context).pop();
                  showOkTextDialog(
                      context,
                      t.generic.error,
                      t.tools.counter.error.invalid_number,
                  );
                  return;
                }
                if (int.parse(controller.text) > maxNumberInButton || int.parse(controller.text) < minNumberInButton) {
                  Navigator.of(context).pop();
                  showOkTextDialog(
                      context,
                      t.generic.error,
                      t.tools.counter.error.the_number_must_be_between_x_and_y(minNumberLimit: minNumberInButton, maxNumberLimit: maxNumberInButton),
                  );
                  return;
                }
                setState(() {
                  buttonIncrements.add(int.parse(controller.text));
                  buttonIncrements.sort();
                });
                prefs.setStringList(SHARED_PREFERENCES_TOOL_COUNTER_BUTTONS, buttonIncrements.map((e) => e.toString()).toList());
                Navigator.of(context).pop();
              },
              child: Text(t.generic.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.counter.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: t.generic.reset,
                onPressed: () {
                  setState(() {
                    _counter = 0;
                  });
                  prefs.setInt(SHARED_PREFERENCES_TOOL_COUNTER_VALUE, _counter);
                },
              ),
            ],
          ),
          body: SafeArea(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(
                        '$_counter',
                        style: const TextStyle(fontSize: 45),
                      ),
                      for (int increment in buttonIncrements)
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  incrementCounter(-increment);
                                },
                                child: Text("-$increment", style: const TextStyle(fontSize: 22)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    incrementCounter(increment);
                                  });
                                },
                                child: Text("+$increment", style: const TextStyle(fontSize: 22)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              showRemoveButtonDialog();
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          IconButton(
                            onPressed: () {
                              showAddButtonDialog();
                            },
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            )
          )
    );
  }
}