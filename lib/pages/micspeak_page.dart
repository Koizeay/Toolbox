
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:toolbox/gen/strings.g.dart';

class MicSpeakPage extends StatefulWidget {
  const MicSpeakPage({ Key? key }) : super(key: key);
  @override
  State<MicSpeakPage> createState() => _MicSpeakPage();
}

class _MicSpeakPage extends State<MicSpeakPage> {
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

  Future<void> toggleMicSpeak() async {
    setState(() {
      isRecording = !isRecording;
    });
    if (isRecording) {
      player.openPlayer().then((value) => player.startPlayerFromMic());
    } else {
      player.stopPlayer();
      player.closePlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${t.generic.app_name} - ${t.tools.micspeak.title}"),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      toggleMicSpeak();
                    },
                    child: Image.asset(
                      isRecording ? "assets/images/specific/micspeak_mic_on.png"
                          : "assets/images/specific/micspeak_mic_off.png",
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