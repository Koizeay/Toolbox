
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:toolbox/gen/strings.g.dart';

class MetronomePage extends StatefulWidget {
  const MetronomePage({ Key? key }) : super(key: key);
  @override
  State<MetronomePage> createState() => _MetronomePage();
}

class _MetronomePage extends State<MetronomePage> {
  bool isPlaying = false;
  final player = AudioPlayer();
  Timer? timer;
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

  void startMetronome() {
    int currentBpm = _currentBpm;
    if (timer != null) {
      stopMetronome();
    }
    timer = Timer.periodic(Duration(milliseconds: (60000 / _currentBpm).round()), (timer) {
      if (currentBpm != _currentBpm) {
        stopMetronome();
        startMetronome();
        return;
      }
      if (beatIndex == 0) {
        player.play(AssetSource('audios/metronome_click0.wav'));
      } else {
        player.play(AssetSource('audios/metronome_click.wav'));
      }
      beatIndex = (beatIndex + 1) % _currentBeatsPerMeasure;
    });
    setState(() {
      isPlaying = true;
    });
  }

  void stopMetronome({isDispose = false}) {
    timer?.cancel();
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
        title: Text("${t.generic.app_name} - ${t.tools.metronome.title}"),
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
                isPlaying ?
                ElevatedButton(
                  onPressed: () {
                    stopMetronome();
                  },
                  child: Text(t.tools.metronome.stop),
                ) :
                ElevatedButton(
                  onPressed: () {
                    startMetronome();
                  },
                  child: Text(t.tools.metronome.start),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}