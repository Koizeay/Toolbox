
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:toolbox/gen/strings.g.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({ super.key });
  @override
  State<ClockPage> createState() => _ClockPage();
}

class _ClockPage extends State<ClockPage> {
  String formattedTime = t.tools.clock.loading;
  int timeZoneSeconds = 0;
  bool isFullscreen = false;

  List<int> timezonesInSeconds = [
    -12 * 3600, -11 * 3600, -10 * 3600, -9 * 3600 - 30 * 60, -9 * 3600,
    -8 * 3600, -7 * 3600, -6 * 3600, -5 * 3600, -4 * 3600,
    -3 * 3600 - 30 * 60, -3 * 3600, -2 * 3600, -1 * 3600, 0,
    1 * 3600, 2 * 3600, 3 * 3600, 3 * 3600 + 30 * 60, 4 * 3600,
    4 * 3600 + 30 * 60, 5 * 3600, 5 * 3600 + 30 * 60, 5 * 3600 + 45 * 60,
    6 * 3600, 6 * 3600 + 30 * 60, 7 * 3600, 8 * 3600, 8 * 3600 + 45 * 60,
    9 * 3600, 9 * 3600 + 30 * 60, 10 * 3600, 10 * 3600 + 30 * 60,
    11 * 3600, 12 * 3600, 12 * 3600 + 45 * 60, 13 * 3600, 14 * 3600
  ];

  String formatTimezoneLabel(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds.abs() % 3600) ~/ 60;
    String sign = hours >= 0 ? "+" : "-";
    return "UTC$sign${hours.abs().toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          formattedTime = getDateTime(timeZoneSeconds);
        });
      }
    });
    changeTimeZone(DateTime.now().timeZoneOffset.inSeconds);
    super.initState();
  }

  @override
  void dispose() {
    if (isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    super.dispose();
  }

  String getDateTime(int timeZone) {
    DateTime now = DateTime.now().toUtc();
    now = now.add(Duration(seconds: timeZone));
    return DateFormat('kk:mm:ss').format(now);
  }

  void changeTimeZone(int newTimeZone) {
    if (mounted) {
      setState(() {
        timeZoneSeconds = newTimeZone;
      });
    }
  }

  void showTimeZoneDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Text(t.tools.clock.timezone),
                Text(t.tools.clock.choose_a_timezone,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int seconds in timezonesInSeconds)
                    ListTile(
                      title: Text(formatTimezoneLabel(seconds)),
                      onTap: () {
                        changeTimeZone(seconds);
                        Navigator.pop(context);
                      },
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  int localTimeZone = DateTime
                      .now()
                      .timeZoneOffset
                      .inSeconds;
                  changeTimeZone(localTimeZone);
                  Navigator.pop(context);
                },
                child: Text(t.tools.clock.select_local),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(t.generic.cancel),
              ),
            ],
          );
        }
    );
  }

  void toggleFullscreen() {
    setState(() {
      isFullscreen = !isFullscreen;
    });
    SystemChrome.setEnabledSystemUIMode(isFullscreen ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        isFullscreen ? null :
        AppBar(
          title: Text(t.tools.clock.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              tooltip: t.tools.clock.change_timezone,
              onPressed: () {
                showTimeZoneDialog();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Text(
                    formattedTime,
                    style: const TextStyle(
                        fontSize: 1000
                    )
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          child: isFullscreen ? const Icon(Icons.fullscreen_exit, color: Colors.white,) : const Icon(
              Icons.fullscreen, color: Colors.white,),
          onPressed: () {
            toggleFullscreen();
          },
        )
    );
  }
}