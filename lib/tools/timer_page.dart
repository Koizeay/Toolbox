
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.timer.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Time Display Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isFinished ? Icons.alarm : Icons.hourglass_empty,
                              color: isFinished ? colorScheme.error : colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isFinished ? "Time's Up!" : "Timer",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isFinished ? colorScheme.error : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isFinished ? colorScheme.errorContainer : colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Countdown(
                            seconds: _seconds,
                            controller: controller,
                            build: (BuildContext context, double time) {
                              String formattedTime = getFormattedTimeFromSeconds(time);
                              return FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  formattedTime,
                                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 64,
                                    color: isFinished
                                      ? colorScheme.onErrorContainer
                                      : colorScheme.onPrimaryContainer,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              );
                            },
                            interval: const Duration(milliseconds: 10),
                            onFinished: () {
                              onFinish();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Time Adjustment Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.tune, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Adjust Time",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  addTime(-1);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: colorScheme.secondary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("-1s"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  addTime(1);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: colorScheme.secondary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("+1s"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  addTime(-60);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: colorScheme.secondary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("-1m"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  addTime(60);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: colorScheme.secondary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("+1m"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Controls Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.control_camera, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Controls",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            if (isCounting && !isFinished) ...[
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.pause),
                                  label: Text(t.tools.timer.pause),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    pauseTimer();
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                            Expanded(
                              child: FilledButton.icon(
                                icon: Icon(isCounting ? Icons.stop : Icons.play_arrow),
                                label: Text(isCounting ? t.tools.timer.stop : t.tools.timer.start),
                                style: FilledButton.styleFrom(
                                  backgroundColor: isCounting ? colorScheme.error : colorScheme.primary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  if (isCounting) {
                                    stopTimer();
                                    return;
                                  }
                                  startTimer();
                                },
                              ),
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