
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/rotations.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:yaru/yaru.dart';

class SoundMeterPage extends StatefulWidget {
  const SoundMeterPage({ Key? key }) : super(key: key);
  @override
  State<SoundMeterPage> createState() => _SoundMeterPage();
}

class _SoundMeterPage extends State<SoundMeterPage> {
  StreamSubscription<NoiseReading>? _noiseSubscription;

  final _checkIfDecibelIsZeroDuring = const Duration(seconds: 4);

  double meanDecibel = 0.0;
  double maxDecibel = 0.0;

  @override
  void initState() {
    startListening();
    checkIfDecibelIsZeroDuring(_checkIfDecibelIsZeroDuring);
    lockScreenRotation();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      stopRecorder();
    }
    setHomePageRotation();
    super.dispose();
  }

  void lockScreenRotation() {
    setOnlyPortraitUp();
  }

  void startListening() async {
    try {
      _noiseSubscription =
          NoiseMeter().noise.listen(onData, onError: onError, cancelOnError: true);
    } catch (exception) {
      showOkTextDialog(context, t.generic.error, t.tools.soundmeter.error.impossible_to_start_the_sound_meter);
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  void onData(NoiseReading noiseReading) {
    setState(() {
      meanDecibel = noiseReading.meanDecibel;
      if (meanDecibel == double.infinity || meanDecibel == double.negativeInfinity) {
        meanDecibel = 0.0;
      }
      if (meanDecibel > maxDecibel) {
        maxDecibel = noiseReading.meanDecibel;
      }
    });
  }

  void onError(Object error) {
    if (kDebugMode) {
      print(error.toString());
    }
  }

  void stopRecorder() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription?.cancel();
        _noiseSubscription = null;
      }
      meanDecibel = 0.0;
    } catch (err) {
      if (kDebugMode) {
        print('stopRecorder error: $err');
      }
    }
  }

  void checkIfDecibelIsZeroDuring(Duration duration) async {
    await Future.delayed(duration);
    if (meanDecibel == 0.0 && mounted) {
      showOkTextDialog(
          context,
          t.generic.error,
          t.tools.soundmeter.error.no_sound_detected
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${t.generic.app_name} - ${t.tools.soundmeter.title}"),
      ),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: SizedBox(
                          child: RadialGauge(
                            axes: [
                              RadialGaugeAxis(
                                minValue: 10,
                                maxValue: 120,
                                color: Colors.transparent,
                                pointers: [
                                  RadialNeedlePointer(
                                    value: meanDecibel,
                                    thicknessStart: 20,
                                    thicknessEnd: 0,
                                    length: 0.6,
                                    knobRadiusAbsolute: 10,
                                    gradient: LinearGradient(
                                        colors: [Theme.of(context).colorScheme.primary],
                                        stops: [0.0]
                                    ),
                                  )
                                ],
                                ticks: [
                                  RadialTicks(
                                      interval: 20,
                                      alignment: RadialTickAxisAlignment.inside,
                                      color: Theme.of(context).colorScheme.primary,
                                      length: 0.2,
                                      children: [
                                        RadialTicks(
                                            ticksInBetween: 5,
                                            length: 0.1,
                                            color: YaruColors.textGrey),
                                      ]
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${meanDecibel.toStringAsFixed(2)} ${t.tools.soundmeter
                          .decibels}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      "${maxDecibel.toStringAsFixed(2)} ${t.tools.soundmeter
                          .decibels}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ]
              ),
            )
        ),
      ),);
  }
}