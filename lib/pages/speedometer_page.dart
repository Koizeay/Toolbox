
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class SpeedometerPage extends StatefulWidget {
  const SpeedometerPage({ Key? key }) : super(key: key);
  @override
  State<SpeedometerPage> createState() => _SpeedometerPage();
}

class _SpeedometerPage extends State<SpeedometerPage> {
  bool _isLoading = true;
  double _speedMps = 0.0;
  double _maxSpeedMps = 0.0;
  double traveledDistanceMeters = 0.0;
  late LocationSettings _locationSettings;
  late Stream<Position>? _positionStream;

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
    _positionStream = null;
    super.dispose();
  }

  Future<void> initTool() async {
    await initLocationPermission();
    await initLocationServices();
    initLocationSettings();
    initSpeedometer();
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
            buttons
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
    _positionStream?.listen((position) {
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
          title: Text("${t.generic.app_name} - ${t.tools.speedometer.title}"),
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
                                maximum: 240,
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      needleLength: 0.7,
                                      value: _speedMps * 3.6,
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
                          "${(_speedMps * 3.6).round()} ${t.tools.speedometer
                              .kmh}",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${(_maxSpeedMps * 3.6).round()} ${t.tools.speedometer
                              .kmh}",
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
                                "${(traveledDistanceMeters / 1000)
                                    .toStringAsFixed(2)} ${t.tools.speedometer
                                    .km}",
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