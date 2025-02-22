
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/core/shared_preferences.dart';

class SpeedometerPage extends StatefulWidget {
  const SpeedometerPage({ super.key });
  @override
  State<SpeedometerPage> createState() => _SpeedometerPage();
}

class _SpeedometerPage extends State<SpeedometerPage> {
  bool _isUsingMpH = false;
  bool _isLoading = true;
  double _speedMps = 0.0;
  double _maxSpeedMps = 0.0;
  double traveledDistanceMeters = 0.0;
  late LocationSettings _locationSettings;
  Stream<Position>? _positionStream;
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    initTool().then((_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    _positionStream = null;
    super.dispose();
  }

  Future<void> initTool() async {
    await initSharedPreferences();
    await initLocationPermission();
    await initLocationServices();
    initLocationSettings();
    initSpeedometer();
  }

  Future<void> initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isUsingMpH = prefs.getBool(SHARED_PREFERENCES_TOOL_SPEEDOMETER_ISUSINGMPH) ?? true;
  }

  Future<void> initLocationPermission() async {
    if (!await Permission.location
        .request()
        .isGranted) {
      if (mounted) {
        showOkTextDialog(
            context,
            t.tools.speedometer.error.location_permission_denied_title,
            t.tools.speedometer.error.location_permission_denied_description
        );
      }
      return;
    }
  }

  double convertMpsToUnit(double mps) {
    return _isUsingMpH ? mps * 2.23694 : mps * 3.6;
  }

  String getSpeedUnit() {
    return _isUsingMpH ? t.tools.speedometer.mph : t.tools.speedometer.kmh;
  }

  String getDistanceUnit() {
    return _isUsingMpH ? t.tools.speedometer.mi : t.tools.speedometer.km;
  }

  Future<void> initLocationServices() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      List<TextButton> buttons = [
        TextButton(
            onPressed: () {
              Geolocator.openLocationSettings();
            },
            child: Text(t.generic.enable)
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(t.generic.cancel)
        ),
      ];
      if (mounted) {
        showCustomButtonsTextDialog(
            context,
            t.tools.speedometer.error.location_services_disabled_title,
            t.tools.speedometer.error.location_services_disabled_description,
            buttons,
            barrierDismissible: false
        );
      }
      return;
    }
  }

  void initLocationSettings() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      _locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        intervalDuration: const Duration(seconds: 1),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      _locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
      );
    } else {
      _locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
      );
    }
  }

  void initSpeedometer() {
    _positionStream = Geolocator.getPositionStream(
        locationSettings: _locationSettings
    );
    _positionStreamSubscription = _positionStream?.listen((position) {
      if (mounted) {
        setState(() {
          traveledDistanceMeters += position.speed * 1;
          _speedMps = position.speed;
          if (_speedMps > _maxSpeedMps) {
            _maxSpeedMps = _speedMps;
          }
        });
      }
    });
  }

  void showTraveledDistanceDialog() {
    List<TextButton> buttons = [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              traveledDistanceMeters = 0.0;
            });
          },
          child: Text(t.tools.speedometer.reset)
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(t.generic.ok)
      )
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.speedometer.about_traveled_distance_title,
        t.tools.speedometer.about_traveled_distance_description,
        buttons
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.tools.speedometer.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.speed_outlined),
              tooltip: t.tools.speedometer.change_speed_unit,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                if (mounted) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(t.tools.speedometer.change_speed_unit, textAlign: TextAlign.center,),
                        content: SizedBox(
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(t.tools.speedometer.change_speed_unit_description, textAlign: TextAlign.center,),
                              const SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FilledButton(
                                      onPressed : () {
                                        Navigator.of(context).pop();
                                        prefs.setBool(SHARED_PREFERENCES_TOOL_SPEEDOMETER_ISUSINGMPH, false);
                                        setState(() {
                                          _isUsingMpH = false;
                                        });
                                      },
                                      child: Text(t.tools.speedometer.kmh)
                                  ),
                                  const SizedBox(width: 16,),
                                  FilledButton(
                                      onPressed : () {
                                        Navigator.of(context).pop();
                                        prefs.setBool(SHARED_PREFERENCES_TOOL_SPEEDOMETER_ISUSINGMPH, true);
                                        setState(() {
                                          _isUsingMpH = true;
                                        });
                                      },
                                      child: Text(t.tools.speedometer.mph)
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(t.generic.cancel),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            ),
          ],
        ),
        body: SafeArea(
            child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SfRadialGauge(
                          enableLoadingAnimation: true,
                          axes: <RadialAxis>[
                            RadialAxis(
                                interval: 20,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.03,
                                  thicknessUnit: GaugeSizeUnit.factor,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .secondary,
                                ),
                                showTicks: true,
                                showLastLabel: true,
                                axisLabelStyle: const GaugeTextStyle(
                                  fontSize: 14,
                                ),
                                majorTickStyle: const MajorTickStyle(
                                    length: 0.15,
                                    lengthUnit: GaugeSizeUnit.factor,
                                    thickness: 1.5
                                ),
                                minorTicksPerInterval: 3,
                                labelOffset: 25,
                                radiusFactor: 0.95,
                                maximum: _isUsingMpH ? 160 : 240,
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      needleLength: 0.7,
                                      value: convertMpsToUnit(_speedMps),
                                      animationDuration: 800,
                                      enableAnimation: true,
                                      animationType: AnimationType.ease,
                                      needleColor: Theme
                                          .of(context)
                                          .colorScheme
                                          .primary,
                                      needleStartWidth: 0,
                                      needleEndWidth: 4,
                                      knobStyle: KnobStyle(color: Theme
                                          .of(context)
                                          .colorScheme
                                          .primary, knobRadius: 0.05)
                                  ),
                                ]
                            )
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Text(
                          "${convertMpsToUnit(_speedMps).round()} ${getSpeedUnit()}",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${convertMpsToUnit(_maxSpeedMps).round()} ${getSpeedUnit()}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16,),
                        GestureDetector(
                          child: Column(
                            children: [
                              Text(
                                t.tools.speedometer.traveled_distance,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "${(traveledDistanceMeters / 1000).toStringAsFixed(2)} ${getDistanceUnit()}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          onTap: () {
                            showTraveledDistanceDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                )
            )
        ),
      ),
    );
  }
}