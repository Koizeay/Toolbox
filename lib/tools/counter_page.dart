
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
  final int minNumberInButton = 1;

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
                if (buttonIncrements.contains(int.parse(controller.text))) {
                  Navigator.of(context).pop();
                  showOkTextDialog(
                      context,
                      t.generic.error,
                      t.tools.counter.error.this_button_already_exists,
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.counter.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        color: colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                          child: Column(
                            children: [
                              Text(
                                t.tools.counter.title,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '$_counter',
                                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 72,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Increments",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ...buttonIncrements.map((increment) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: FilledButton.icon(
                                        onPressed: () => incrementCounter(-increment),
                                        icon: const Icon(Icons.remove),
                                        label: Text(
                                          "$increment",
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                        ),
                                        style: FilledButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: FilledButton.icon(
                                        onPressed: () => incrementCounter(increment),
                                        icon: const Icon(Icons.add),
                                        label: Text(
                                          "$increment",
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                        ),
                                        style: FilledButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                    onPressed: showRemoveButtonDialog,
                                    icon: const Icon(Icons.remove_circle_outline),
                                    label: Text(t.tools.counter.remove_button),
                                  ),
                                  const SizedBox(width: 16),
                                  TextButton.icon(
                                    onPressed: showAddButtonDialog,
                                    icon: const Icon(Icons.add_circle_outline),
                                    label: Text(t.tools.counter.add_button),
                                  ),
                                ],
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