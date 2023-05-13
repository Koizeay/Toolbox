
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:vibration/vibration.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({ Key? key }) : super(key: key);
  @override
  State<TimerPage> createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> {
  bool isPlayingAlarm = false;
  final audioPlayer = AudioPlayer();
  final CountdownController controller = CountdownController(autoStart: false);
  int _seconds = 60;
  bool isCounting = false;

  @override
  Future<void> dispose() async {
    stopTimer();
    super.dispose();
  }

  void startTimer() {
    if (!isCounting) {
      stopAlarm();
      controller.start();
      setState(() {
        isCounting = true;
      });
    }
  }

  void stopTimer() {
    stopAlarm();
    controller.restart();
    controller.pause();
    setState(() {
      isCounting = false;
    });
  }

  void addTime(int seconds) {
    if (!isCounting && _seconds + seconds >= 0 && _seconds + seconds < 3600) {
      setState(() {
        _seconds += seconds;
      });
    }
  }

  void onFinish() {
    controller.pause();
    playAlarm();
    startVibration();
  }

  void stopAlarm() {
    audioPlayer.stop();
    isPlayingAlarm = false;
  }

  void playAlarm() {
    audioPlayer.onPlayerComplete.listen((event) {
      if (mounted && isPlayingAlarm) {
        audioPlayer.play(AssetSource("audios/timer_alarm.wav"));
      }
    });
    audioPlayer.play(AssetSource("audios/timer_alarm.wav"));
    isPlayingAlarm = true;
  }

  Future<void> startVibration() async {
    if ((await Vibration.hasVibrator()) ?? false) {
      while (isPlayingAlarm) {
        Vibration.vibrate();
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  String getFormattedTime(double time) {
    Duration duration = Duration(
        milliseconds: ((time * 1000).round()));
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(
        duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(
        duration.inSeconds.remainder(60));
    String twoDigitMilliseconds = twoDigits(
        duration.inMilliseconds.remainder(1000));
    if (twoDigitMilliseconds.endsWith("0")) {
      twoDigitMilliseconds = twoDigitMilliseconds.substring(
          0, twoDigitMilliseconds.length - 1);
    }
    if (twoDigitMilliseconds.length == 1) {
      twoDigitMilliseconds = "0$twoDigitMilliseconds";
    }
    return "$twoDigitMinutes:$twoDigitSeconds:$twoDigitMilliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.timer.title}"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery
                    .of(context)
                    .size
                    .height - AppBar().preferredSize.height - MediaQuery
                    .of(context)
                    .padding
                    .top - MediaQuery
                    .of(context)
                    .padding
                    .bottom,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Countdown(
                        seconds: _seconds,
                        controller: controller,
                        build: (BuildContext context, double time) {
                          String formattedTime = getFormattedTime(time);
                          return FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                                formattedTime,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 100,
                                )
                            ),
                          );
                        },
                        interval: const Duration(milliseconds: 10),
                        onFinished: () {
                          onFinish();
                        },
                      ),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    addTime(-1);
                                  },
                                  child: const Text("-1s")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    addTime(1);
                                  },
                                  child: const Text("+1s")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    addTime(-60);
                                  },
                                  child: const Text("-1m")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    addTime(60);
                                  },
                                  child: const Text("+1m")
                              ),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: !isCounting ? ElevatedButton(
                              onPressed: () {
                                startTimer();
                              },
                              child: Text(t.tools.timer.start)
                          ) : ElevatedButton(
                              onPressed: () {
                                stopTimer();
                              },
                              child: Text(t.tools.timer.stop)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}