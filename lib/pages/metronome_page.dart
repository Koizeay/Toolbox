
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';
import 'package:toolbox/gen/strings.g.dart';

class MetronomePage extends StatefulWidget {
  const MetronomePage({ super.key });
  @override
  State<MetronomePage> createState() => _MetronomePage();
}

class _MetronomePage extends State<MetronomePage> {
  bool isLoading = false;
  bool isPlaying = false;
  final player = AudioPlayer();
  ReliableIntervalTimer? timer;
  int beatIndex = 0;

  int _currentBpm = 120;
  int _currentBeatsPerMeasure = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    stopMetronome(isDispose: true);
    super.dispose();
  }

  Future<void> startMetronome() async {
    int currentBpm = _currentBpm;
    if (timer != null) {
      await stopMetronome();
    }
    timer = ReliableIntervalTimer(
        interval: Duration(milliseconds: (60000 / _currentBpm).round()),
        callback: (elapsedMilliseconds) async {
          if (currentBpm != _currentBpm) {
            await stopMetronome();
            await startMetronome();
            return;
          }
          if (beatIndex == 0) {
            player.play(AssetSource('audios/metronome_click0.wav'));
          } else {
            player.play(AssetSource('audios/metronome_click.wav'));
          }
          beatIndex = (beatIndex + 1) % _currentBeatsPerMeasure;
        }
    );
    setState(() {
      isPlaying = true;
    });
    await timer?.start();
  }

  Future<void> stopMetronome({isDispose = false}) async {
    await timer?.stop();
    timer = null;
    beatIndex = 0;
    if (!isDispose) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.tools.metronome.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                    t.tools.metronome.bpm,
                    style: const TextStyle(fontSize: 20)
                ),
                NumberPicker(
                  value: _currentBpm,
                  minValue: 25,
                  maxValue: 200,
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() => _currentBpm = value),
                ),
                const SizedBox(height: 10),
                Text(
                    t.tools.metronome.beats_per_measure,
                    style: const TextStyle(fontSize: 20)
                ),
                NumberPicker(
                  value: _currentBeatsPerMeasure,
                  minValue: 1,
                  maxValue: 12,
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() => _currentBeatsPerMeasure = value),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (isLoading) {
                          return;
                        }
                        isLoading = true;
                        if (isPlaying) {
                          stopMetronome().then((value) => isLoading = false);
                          return;
                        }
                        startMetronome().then((value) => isLoading = false);
                      },
                      child: Text(isPlaying ? t.tools.metronome.stop : t.tools.metronome.start),
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