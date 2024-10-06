import 'package:toolbox/models/home_folder.dart';
import 'package:toolbox/pages/clock_page.dart';
import 'package:toolbox/pages/counter_page.dart';
import 'package:toolbox/pages/fileencryption_page.dart';
import 'package:toolbox/pages/flipcoins_page.dart';
import 'package:toolbox/pages/gameoflife_page.dart';
import 'package:toolbox/pages/httprequest_page.dart';
import 'package:toolbox/pages/mcserverping_page.dart';
import 'package:toolbox/pages/megaphone_page.dart';
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
  static final Map<String, Tool> toolMap = {
    "clock": Tool("Clock", "assets/images/tools/clock.png", const ClockPage()),
    "counter": Tool("Counter", "assets/images/tools/counter.png", const CounterPage()),
    "fileencryption": Tool("File Encryption", "assets/images/tools/fileencryption.png", const FileEncryptionPage()),
    "flipcoins": Tool("Flip Coins", "assets/images/tools/flipcoins.png", const FlipCoinsPage()),
    "gameoflife": Tool("Game of Life", "assets/images/tools/gameoflife.png", const GameOfLifePage()),
    "httprequest": Tool("HTTP Request", "assets/images/tools/httprequest.png", const HttpRequestPage()),
    "mcserverping": Tool("MC Server Ping", "assets/images/tools/mcserverping.png", const McServerPingPage()),
    "megaphone": Tool("Megaphone", "assets/images/tools/megaphone.png", const MegaphonePage()),
    "metronome": Tool("Metronome", "assets/images/tools/metronome.png", const MetronomePage()),
    "morsecode": Tool("Morse Code", "assets/images/tools/morsecode.png", const MorseCodePage()),
    "nationalanthems": Tool("National Anthems", "assets/images/tools/nationalanthems.png", const NationalAnthemsPage()),
    "nearbypublictransportstops": Tool("Nearby Public Transport Stops", "assets/images/tools/nearbypublictransportstops.png", const NearbyPublicTransportStopsPage()),
    "networkinfo": Tool("Network Info", "assets/images/tools/networkinfo.png", const NetworkInfoPage()),
    "nslookup": Tool("NS Lookup", "assets/images/tools/nslookup.png", const NslookupPage()),
    "osm": Tool("OSM", "assets/images/tools/osm.png", const OsmPage()),
    "ping": Tool("Ping", "assets/images/tools/ping.png", const PingPage()),
    "qrreader": Tool("QR Reader", "assets/images/tools/qrreader.png", const QrReaderPage()),
    "randomcolor": Tool("Random Color", "assets/images/tools/randomcolor.png", const RandomColorPage()),
    "randomnumber": Tool("Random Number", "assets/images/tools/randomnumber.png", const RandomNumberPage()),
    "roulette": Tool("Roulette", "assets/images/tools/roulette.png", const RoulettePage()),
    "soundmeter": Tool("Sound Meter", "assets/images/tools/soundmeter.png", const SoundMeterPage()),
    "speedometer": Tool("Speedometer", "assets/images/tools/speedometer.png", const SpeedometerPage()),
    "sshclient": Tool("SSH Client", "assets/images/tools/sshclient.png", const SshClientPage()),
    "stopwatch": Tool("Stopwatch", "assets/images/tools/stopwatch.png", const StopwatchPage()),
    "texttospeech": Tool("Text to Speech", "assets/images/tools/texttospeech.png", const TextToSpeechPage()),
    "timer": Tool("Timer", "assets/images/tools/timer.png", const TimerPage()),
    "timestampconverter": Tool("Timestamp Converter", "assets/images/tools/timestampconverter.png", const TimestampConverterPage()),
    "urlshortener": Tool("URL Shortener", "assets/images/tools/urlshortener.png", const UrlShortenerPage()),
    "uuidgenerator": Tool("UUID Generator", "assets/images/tools/uuidgenerator.png", const UuidGeneratorPage()),
    "whiteboard": Tool("Whiteboard", "assets/images/tools/whiteboard.png", const WhiteBoardPage()),
    "youtubethumbnail": Tool("YouTube Thumbnail", "assets/images/tools/youtubethumbnail.png", const YouTubeThumbnailPage())
  };

  static final List<dynamic> hierarchy = [
    Folder(t.folders.audio, "assets/images/folders/folder.png", [
      toolMap["metronome"],
      toolMap["morsecode"],
      toolMap["nationalanthems"],
      toolMap["soundmeter"],
      toolMap["texttospeech"],
    ]),
    Folder(t.folders.games, "assets/images/folders/folder.png", [
      toolMap["gameoflife"],
      toolMap["mcserverping"],
    ]),
    Folder(t.folders.geography, "assets/images/folders/folder.png", [
      toolMap["osm"],
      toolMap["nearbypublictransportstops"],
      toolMap["nationalanthems"],
      toolMap["speedometer"],
    ]),
    Folder(t.folders.miscellaneous, "assets/images/folders/folder.png", [
      toolMap["counter"],
      toolMap["fileencryption"],
      toolMap["qrreader"],
      toolMap["whiteboard"],
    ]),
    Folder(t.folders.network, "assets/images/folders/folder.png", [
      toolMap["httprequest"],
      toolMap["mcserverping"],
      toolMap["networkinfo"],
      toolMap["nslookup"],
      toolMap["ping"],
      toolMap["sshclient"],
    ]),
    Folder(t.folders.random, "assets/images/folders/folder.png", [
      toolMap["flipcoins"],
      toolMap["randomcolor"],
      toolMap["randomnumber"],
      toolMap["roulette"],
      toolMap["uuidgenerator"],
    ]),
    Folder(t.folders.time, "assets/images/folders/folder.png", [
      toolMap["clock"],
      toolMap["stopwatch"],
      toolMap["timer"],
      toolMap["timestampconverter"],
    ]),
    Folder(t.folders.web, "assets/images/folders/folder.png", [
      toolMap["httprequest"],
      toolMap["urlshortener"],
      toolMap["youtubethumbnail"],
    ]),
  ];


  static List<Tool> getFlatHierarchy() {
    List<Tool> uniqueItems = [];
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
