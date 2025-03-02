
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'dart:math' as math;

class CompassPage extends StatefulWidget {
  const CompassPage({super.key});

  @override
  State<CompassPage> createState() => _CompassPage();
}

class _CompassPage extends State<CompassPage> {
  double _value = 0.0;


  @override
  void initState() {
    super.initState();
    askForPermission().then((isGranted) {
      if (isGranted) {
        initCompass();
      } else {
        if (mounted) {
          showOkTextDialog(
            context,
            t.generic.error,
            t.tools.compass.error.please_grant_location_permission,
          );
        }
      }
    });
  }

  Future<bool> askForPermission() async {
    return Permission.location
        .request()
        .isGranted;
  }

  void initCompass() {
    FlutterCompass.events?.listen((event) {
      if (mounted) {
        setState(() {
          _value = event.heading ?? 0.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.compass.title),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MediaQuery
                          .of(context)
                          .orientation == Orientation.portrait ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: (_value * (math.pi / 180) * -1),
                            child: Image.asset(
                              'assets/images/specific/compass_compass.png',
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${_value.toStringAsFixed(2)}°",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: (_value * (math.pi / 180) * -1),
                            child: Image.asset(
                              'assets/images/specific/compass_compass.png',
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height - 120,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${_value.toStringAsFixed(2)}°",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                  ),
                )
            ),
          )),
    );
  }
}