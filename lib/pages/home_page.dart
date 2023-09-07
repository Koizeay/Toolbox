
import 'package:flutter/material.dart';
import 'package:toolbox/core/rotations.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/tool.dart';
import 'package:toolbox/pages/clock_page.dart';
import 'package:toolbox/pages/credits_page.dart';
import 'package:toolbox/pages/flipcoins_page.dart';
import 'package:toolbox/pages/metronome_page.dart';
import 'package:toolbox/pages/micspeak_page.dart';
import 'package:toolbox/pages/nslookup_page.dart';
import 'package:toolbox/pages/ping_page.dart';
import 'package:toolbox/pages/qrreader_page.dart';
import 'package:toolbox/pages/randomcolor_page.dart';
import 'package:toolbox/pages/randomnumber_page.dart';
import 'package:toolbox/pages/roulette_page.dart';
import 'package:toolbox/pages/soundmeter_page.dart';
import 'package:toolbox/pages/sshclient_page.dart';
import 'package:toolbox/pages/stopwatch_page.dart';
import 'package:toolbox/pages/timer_page.dart';
import 'package:toolbox/pages/uuidgenerator_page.dart';
import 'package:toolbox/pages/whiteboard_page.dart';
import 'package:toolbox/widgets/tool_card.dart';
import 'package:yaru/yaru.dart';

import 'networkinfo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late List<Tool> tools;

  @override
  void initState() {
    super.initState();
    initTools();
    sortTools();
    setOnlyPortraitUp();
  }

  void initTools() {
    tools = [
      Tool(t.tools.clock.title, "assets/images/tools/clock.png",
          const ClockPage()),
      Tool(t.tools.flipcoins.title, "assets/images/tools/flipcoins.png",
          const FlipCoinsPage()),
      Tool(t.tools.metronome.title, "assets/images/tools/metronome.png",
          const MetronomePage()),
      Tool(t.tools.micspeak.title, "assets/images/tools/micspeak.png",
          const MicSpeakPage()),
      Tool(t.tools.networkinfo.title, "assets/images/tools/networkinfo.png",
          const NetworkInfoPage()),
      Tool(t.tools.nslookup.title, "assets/images/tools/nslookup.png",
          const NslookupPage()),
      Tool(t.tools.ping.title, "assets/images/tools/ping.png",
          const PingPage()),
      Tool(t.tools.qrreader.title, "assets/images/tools/qrreader.png",
          const QrReaderPage()),
      Tool(t.tools.randomcolor.title, "assets/images/tools/randomcolor.png",
          const RandomColorPage()),
      Tool(t.tools.randomnumber.title, "assets/images/tools/randomnumber.png",
          const RandomNumberPage()),
      Tool(t.tools.roulette.title, "assets/images/tools/roulette.png",
          const RoulettePage()),
      Tool(t.tools.sshclient.title, "assets/images/tools/sshclient.png",
          const SshClientPage()),
      Tool(t.tools.soundmeter.title, "assets/images/tools/soundmeter.png",
          const SoundMeterPage()),
      Tool(t.tools.stopwatch.title, "assets/images/tools/stopwatch.png",
          const StopwatchPage()),
      Tool(t.tools.timer.title, "assets/images/tools/timer.png",
          const TimerPage()),
      Tool(t.tools.uuidgenerator.title, "assets/images/tools/uuidgenerator.png",
          const UuidGeneratorPage()),
      Tool(t.tools.whiteboard.title, "assets/images/tools/whiteboard.png",
          const WhiteBoardPage())
    ];
  }

  void sortTools() {
    tools.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.generic.app_name),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: YaruColors.textGrey,
              tooltip: t.credits.title,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreditsPage()
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return ToolCard(
                      title: tools[index].name,
                      imageAssetPath: tools[index].image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tools[index].page
                          ),
                        );
                      }
                  );
                },
              )
          ),
        )
    );
  }
}