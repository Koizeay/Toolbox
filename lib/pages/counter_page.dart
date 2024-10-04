
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({ Key? key }) : super(key: key);
  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("${t.generic.app_name} - ${t.tools.counter.title}"),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
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
                                  setState(() {
                                    _counter--;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    _counter++;
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