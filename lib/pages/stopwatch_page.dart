
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toolbox/core/rotations.dart';
import 'package:toolbox/core/time.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:yaru/yaru.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({ Key? key }) : super(key: key);
  @override
  State<StopwatchPage> createState() => _StopwatchPage();
}

class _StopwatchPage extends State<StopwatchPage> {
  bool isRunning = false;
  Duration duration = const Duration();
  Timer? timer;
  List<Duration> laps = [];

  @override
  void initState() {
    super.initState();
    setOnlyPortraitUp();
  }

  @override
  void dispose() {
    setHomePageRotation();
    stopTimer(isDispose: true);
    super.dispose();
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (mounted) {
        setState(() {
          duration += const Duration(milliseconds: 10);
        });
      }
    });
  }

  void stopTimer({bool isDispose = false}) {
    if (mounted && !isDispose) {
      setState(() {
        isRunning = false;
      });
    }
    timer?.cancel();
  }

  void resetTimer() {
    setState(() {
      laps.clear();
      duration = const Duration();
    });
  }

  void addLap() {
    if (isRunning) {
      setState(() {
        laps.add(duration);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.stopwatch.title}"),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                      getFormattedTimeFromMilliseconds(
                          duration.inMilliseconds.toDouble()),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 100,
                      )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isRunning ?
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          stopTimer();
                        },
                        child: Text(t.tools.stopwatch.stop),
                      ),
                    ),
                  ) : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          startTimer();
                        },
                        child: Text(t.tools.stopwatch.start),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 16, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          resetTimer();
                        },
                        child: Text(t.tools.stopwatch.reset),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      addLap();
                    },
                    child: Text(t.tools.stopwatch.lap),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        "${index + 1}) ${getFormattedTimeFromMilliseconds(
                            laps[index].inMilliseconds.toDouble())}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: YaruColors.kubuntuBlue
                        )
                    ),
                  );
                },
                  itemCount: laps.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        )
    );
  }
}