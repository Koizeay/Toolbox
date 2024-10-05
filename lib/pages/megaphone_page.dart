
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/gen/strings.g.dart';

class MegaphonePage extends StatefulWidget {
  const MegaphonePage({ super.key });
  @override
  State<MegaphonePage> createState() => _MegaphonePage();
}

class _MegaphonePage extends State<MegaphonePage> {
  bool isRecording = false;
  FlutterSoundPlayer player = FlutterSoundPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.stopPlayer();
    player.closePlayer();
    super.dispose();
  }

  Future<void> toggleMegaphone() async {
    setState(() {
      isRecording = !isRecording;
    });
    bool isMicrophoneGranted = await askForMicrophonePermission();
    if (!isMicrophoneGranted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.megaphone.error.microphone_permission_denied)
          ),
        );
        setState(() {
          isRecording = false;
        });
      }
    }
    if (isRecording) {
      player.openPlayer().then((value) => player.startPlayerFromMic());
    } else {
      player.stopPlayer();
      player.closePlayer();
    }
  }

  Future<bool> askForMicrophonePermission() async {
    if (await Permission.microphone.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.tools.megaphone.title),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      toggleMegaphone();
                    },
                    child: Image.asset(
                      isRecording ? "assets/images/specific/megaphone_mic_on.png"
                          : "assets/images/specific/megaphone_mic_off.png",
                        width: 120,
                        height: 120
                    ),
                  ),
                ]
            )
        ),
      ),
    );
  }
}