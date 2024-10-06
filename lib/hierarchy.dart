import 'package:toolbox/models/home_folder.dart';
import 'package:toolbox/pages/clock_page.dart';
import 'package:toolbox/pages/counter_page.dart';
import 'package:toolbox/pages/fileencryption_page.dart';
import 'package:toolbox/pages/flipcoins_page.dart';
import 'package:toolbox/pages/gameoflife_page.dart';
import 'package:toolbox/pages/home_page.dart';
import 'package:toolbox/pages/httprequest_page.dart';
import 'package:toolbox/pages/mc_server_ping.dart';
import 'package:toolbox/pages/metronome_page.dart';
import 'package:toolbox/pages/morsecode_page.dart';
import 'package:toolbox/pages/networkinfo_page.dart';
import 'package:toolbox/pages/nationalanthems_page.dart';
import 'package:toolbox/pages/nearbypublictransportstops_page.dart';
import 'package:toolbox/pages/nslookup_page.dart';
import 'package:toolbox/pages/osm_page.dart';
import 'package:toolbox/pages/ping_page.dart';
import 'package:toolbox/pages/qrreader_page.dart';
import 'package:toolbox/pages/randomcolor_page.dart';
import 'package:toolbox/pages/randomnumber_page.dart';
import 'package:toolbox/pages/roulette_page.dart';
import 'package:toolbox/pages/sshclient_page.dart';
import 'package:toolbox/pages/soundmeter_page.dart';
import 'package:toolbox/pages/speedometer_page.dart';
import 'package:toolbox/pages/stopwatch_page.dart';
import 'package:toolbox/pages/texttospeech_page.dart';
import 'package:toolbox/pages/timer_page.dart';
import 'package:toolbox/pages/timestampconverter_page.dart';
import 'package:toolbox/pages/url_shortener_page.dart';
import 'package:toolbox/pages/uuidgenerator_page.dart';
import 'package:toolbox/pages/whiteboard_page.dart';
import 'package:toolbox/pages/youtubethumbnail_page.dart';

import 'models/home_tool.dart';
import 'package:toolbox/gen/strings.g.dart';

class Hierarchy {
  static final List<dynamic> hierarchy = [
    Folder(t.folders.time, "assets/images/tools/clock.png", [
          Tool(t.tools.clock.title, "assets/images/tools/clock.png", const ClockPage()),
          Tool(t.tools.stopwatch.title, "assets/images/tools/stopwatch.png", const StopwatchPage()),
          Tool(t.tools.timer.title, "assets/images/tools/timer.png", const TimerPage()),
          Tool(t.tools.timestampconverter.title, "assets/images/tools/timestampconverter.png", const TimestampConverterPage()),
    ]),
    Folder(t.folders.network, "assets/images/tools/networkinfo.png", [
          Tool(t.tools.nslookup.title, "assets/images/tools/nslookup.png", const NslookupPage()),
          Tool(t.tools.ping.title, "assets/images/tools/ping.png", const PingPage()),
          Tool(t.tools.httprequest.title, "assets/images/tools/httprequest.png", const HttpRequestPage()),
          Tool(t.tools.mc_server_ping.title, "assets/images/tools/mc_server_ping.png", const McServerPing()),
          Tool(t.tools.networkinfo.title, "assets/images/tools/networkinfo.png", const NetworkInfoPage()),
          Tool(t.tools.sshclient.title, "assets/images/tools/sshclient.png", const SshClientPage()),
    ]),
    Folder(t.folders.random, "assets/images/tools/randomnumber.png", [
          Tool(t.tools.randomnumber.title, "assets/images/tools/randomnumber.png", const RandomNumberPage()),
          Tool(t.tools.uuidgenerator.title, "assets/images/tools/uuidgenerator.png", const UuidGeneratorPage()),
          Tool(t.tools.randomcolor.title, "assets/images/tools/randomcolor.png", const RandomColorPage()),
          Tool(t.tools.roulette.title, "assets/images/tools/roulette.png", const RoulettePage()),
          Tool(t.tools.flipcoins.title, "assets/images/tools/flipcoins.png", const FlipCoinsPage()),
    ]),
    Folder(t.folders.converter, "assets/images/tools/morsecode.png", [
          Tool(t.tools.morsecode.title, "assets/images/tools/morsecode.png", const MorseCodePage()),
          Tool(t.tools.timestampconverter.title, "assets/images/tools/timestampconverter.png", const TimestampConverterPage()),
          Tool(t.tools.texttospeech.title, "assets/images/tools/texttospeech.png", const TextToSpeechPage()),
          Tool(t.tools.youtubethumbnail.title, "assets/images/tools/youtubethumbnail.png", const YouTubeThumbnailPage()),
          Tool(t.tools.fileencryption.title, "assets/images/tools/fileencryption.png", const FileEncryptionPage()),
    ]),
    Folder(t.folders.analyser, "assets/images/tools/soundmeter.png", [
          Tool(t.tools.soundmeter.title, "assets/images/tools/soundmeter.png", const SoundMeterPage()),
          Tool(t.tools.speedometer.title, "assets/images/tools/speedometer.png", const SpeedometerPage()),
          Tool(t.tools.qrreader.title, "assets/images/tools/qrreader.png", const QrReaderPage()),
          Tool(t.tools.nearbypublictransportstops.title, "assets/images/tools/nearbypublictransportstops.png", const NearbyPublicTransportStopsPage()),
    ]),
    Folder(t.folders.geography, "assets/images/tools/osm.png", [
          Tool(t.tools.osm.title, "assets/images/tools/osm.png", const OsmPage()),
          Tool(t.tools.nationalanthems.title, "assets/images/tools/nationalanthems.png", const NationalAnthemsPage()),
          Tool(t.tools.nearbypublictransportstops.title, "assets/images/tools/nearbypublictransportstops.png", const NearbyPublicTransportStopsPage()),
    ]),
    Folder(t.folders.web, "assets/images/tools/nslookup.png", [
        Tool(t.tools.urlshortener.title, "assets/images/tools/urlshortener.png", const UrlShortenerPage()),
        Tool(t.tools.youtubethumbnail.title, "assets/images/tools/youtubethumbnail.png", const YouTubeThumbnailPage()),
    ]),
    Folder(t.folders.sound, "assets/images/tools/megaphone.png", [
        Tool(t.tools.metronome.title, "assets/images/tools/metronome.png", const MetronomePage()),
        // Tool(t.tools.megaphone.title, "assets/images/tools/megaphone.png", const MegaphonePage()),
        Tool(t.tools.soundmeter.title, "assets/images/tools/soundmeter.png", const SoundMeterPage()),
        Tool(t.tools.nationalanthems.title, "assets/images/tools/nationalanthems.png", const NationalAnthemsPage()),
    ]),
    Folder(t.folders.miscellaneous, "assets/images/tools/whiteboard.png", [
      Tool(t.tools.counter.title, "assets/images/tools/counter.png", const CounterPage()),
      Tool(t.tools.gameoflife.title, "assets/images/tools/gameoflife.png", const GameOfLifePage()),
      Tool(t.tools.whiteboard.title, "assets/images/tools/whiteboard.png", const WhiteBoardPage()),
    ]),
  ];

  static List<dynamic> getFlatHierarchy() {
    List<dynamic> uniqueItems = [];
    Set<String> uniqueNames = {};

    List<dynamic> flatten(dynamic item) {
      if (item is Folder) {
        return item.content.expand(flatten).toList();
      } else {
        return [item];
      }
    }
    List<dynamic> flat = hierarchy.expand(flatten).toList();

    for (var item in flat) {
      if (item is Tool && !uniqueNames.contains(item.name)) {
        uniqueItems.add(item);
        uniqueNames.add(item.name);
      }
    }
    return uniqueItems;
  }
}