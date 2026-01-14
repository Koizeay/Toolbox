
import 'package:flutter/material.dart';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';
import 'package:toolbox/core/time.dart';
import 'package:toolbox/gen/strings.g.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({ super.key });
  @override
  State<StopwatchPage> createState() => _StopwatchPage();
}

class _StopwatchPage extends State<StopwatchPage> {
  bool isLoading = false;
  bool isRunning = false;
  Duration duration = const Duration();
  ReliableIntervalTimer? timer;
  List<Duration> laps = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    stopTimer(isDispose: true);
    super.dispose();
  }

  void startTimer() {
    if (isLoading) {
      return;
    }
    isLoading = true;
    setState(() {
      isRunning = true;
    });
    timer = ReliableIntervalTimer(
      interval: const Duration(milliseconds: 10),
      callback: (elapsedMilliseconds) {
        updateDuration(Duration(milliseconds: elapsedMilliseconds));
      },
    );
    timer?.start().then((value) => isLoading = false);
  }

  void updateDuration(Duration newDuration) {
    if (mounted) {
      setState(() {
        duration += newDuration;
      });
    }
  }

  void stopTimer({bool isDispose = false}) {
    if (isLoading) {
      return;
    }
    isLoading = true;
    if (mounted && !isDispose) {
      setState(() {
        isRunning = false;
      });
    }
    if (timer != null) {
      timer?.stop().then((value) => isLoading = false);
      timer = null;
    }
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.stopwatch.title),
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
                            Icon(Icons.timer_outlined, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Stopwatch",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              getFormattedTimeFromMilliseconds(
                                duration.inMilliseconds.toDouble()),
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 64,
                                color: colorScheme.onPrimaryContainer,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
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
                            Expanded(
                              child: FilledButton.icon(
                                icon: Icon(isRunning ? Icons.stop : Icons.play_arrow),
                                label: Text(isRunning ? t.tools.stopwatch.stop : t.tools.stopwatch.start),
                                style: FilledButton.styleFrom(
                                  backgroundColor: isRunning ? colorScheme.error : colorScheme.primary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  if (isRunning) {
                                    stopTimer();
                                  } else {
                                    startTimer();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.refresh),
                                label: Text(t.tools.stopwatch.reset),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  resetTimer();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.flag),
                            label: Text(t.tools.stopwatch.lap),
                            style: FilledButton.styleFrom(
                              backgroundColor: colorScheme.secondary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              addLap();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (laps.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  // Laps Card
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
                              Icon(Icons.list, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                "Laps",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: laps.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceVariant,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lap ${index + 1}",
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      getFormattedTimeFromMilliseconds(
                                        laps[index].inMilliseconds.toDouble()),
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'monospace',
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}