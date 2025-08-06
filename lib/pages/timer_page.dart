
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/time.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:vibration/vibration.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({ super.key });
  @override
  State<TimerPage> createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> {
  bool isPlayingAlarm = false;
  final audioPlayer = AudioPlayer();
  final CountdownController controller = CountdownController(autoStart: false);
  int _seconds = 60;
  bool isCounting = false;
  bool isPaused = false;
  bool isFinished = false;

  @override
  Future<void> dispose() async {
    stopTimer();
    super.dispose();
  }

  void showIosAlert() {
    showOkTextDialog(
      context,
      t.generic.warning,
      t.tools.timer.ios_warning_message,
    );
  }

  void startTimer() {
    if (_seconds == 0) {
      return;
    }
    if (Platform.isIOS && !isPaused) {
      showIosAlert();
    }
    if (!isCounting) {
      stopAlarm();
      controller.start();
      setState(() {
        isCounting = true;
        isPaused = false;
        isFinished = false;
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

  void pauseTimer() {
    if (isCounting) {
      controller.pause();
      setState(() {
        isCounting = false;
        isPaused = true;
      });
    }
  }

  void addTime(int seconds) {
    if (isCounting || isPaused) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.tools.timer.please_stop_the_timer_first),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }
    if (_seconds + seconds >= 0 && _seconds + seconds < 3600) {
      setState(() {
        _seconds += seconds;
      });
    }
  }

  void onFinish() {
    controller.pause();
    setState(() {
      isFinished = true;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.tools.timer.title),
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
                          String formattedTime = getFormattedTimeFromSeconds(
                              time);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FilledButton(
                                  onPressed: () {
                                    addTime(-1);
                                  },
                                  child: const Text("-1s")
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FilledButton(
                                  onPressed: () {
                                    addTime(1);
                                  },
                                  child: const Text("+1s")
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FilledButton(
                                  onPressed: () {
                                    addTime(-60);
                                  },
                                  child: const Text("-1m")
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FilledButton(
                                  onPressed: () {
                                    addTime(60);
                                  },
                                  child: const Text("+1m")
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              if (isCounting && !isFinished) ...[
                              Expanded(
                                child: FilledButton(
                                    onPressed: () {
                                      pauseTimer();
                                    },
                                    child: Text(t.tools.timer.pause)
                                ),
                              ),
                              const SizedBox(width: 8),
                              ] else
                                const SizedBox(width: 0),
                              Expanded(
                                child: FilledButton(
                                    onPressed: () {
                                      if (isCounting) {
                                        stopTimer();
                                        return;
                                      }
                                      startTimer();
                                    },
                                    child: Text(
                                        isCounting
                                            ? t.tools.timer.stop
                                            : t.tools.timer.start
                                    )
                                ),
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
          ),
        )
    );
  }
}