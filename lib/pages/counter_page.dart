
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({ super.key });
  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  bool isLoading = true;

  int _counter = 0;
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
    });
  }

  void incrementCounter(int amount) {
    setState(() {
      _counter += amount;
    });
    prefs.setInt(SHARED_PREFERENCES_TOOL_COUNTER_VALUE, _counter);
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
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  incrementCounter(-1);
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    incrementCounter(1);
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
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