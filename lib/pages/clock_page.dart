
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:toolbox/core/rotations.dart';
import 'package:toolbox/gen/strings.g.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({ Key? key }) : super(key: key);
  @override
  State<ClockPage> createState() => _ClockPage();
}

class _ClockPage extends State<ClockPage> {
  String formattedTime = DateFormat('kk:mm:ss').format(DateTime.now());
  bool isFullscreen = false;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) {
        return;
      }
      setState(() {
        formattedTime = DateFormat('kk:mm:ss').format(DateTime.now());
      });
    });
    lockScreenRotation();
    super.initState();
  }

  @override
  void dispose() {
    setHomePageRotation();
    super.dispose();
  }

  void lockScreenRotation() {
    setOnlyLandscape();
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
        backgroundColor:
        isFullscreen ? Colors.grey[900] : Theme
            .of(context)
            .colorScheme
            .background,
        appBar:
        isFullscreen ? null :
        AppBar(
          title: Text("${t.generic.app_name} - ${t.tools.clock.title}"),
        ),
        body: SafeArea(
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Text(
                    formattedTime,
                    style: TextStyle(
                        fontSize: 1000,
                        color: isFullscreen ? Colors.white : Colors.grey[800]
                    )
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: isFullscreen ? Colors.grey[800] : Theme
              .of(context)
              .colorScheme
              .secondary,
          child: isFullscreen ? const Icon(Icons.fullscreen_exit) : const Icon(
              Icons.fullscreen),
          onPressed: () {
            toggleFullscreen();
          },
        )
    );
  }
}