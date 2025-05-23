import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/models/home_folder.dart';
import 'package:toolbox/pages/areacalculator_page.dart';
import 'package:toolbox/pages/baseconverter_page.dart';
import 'package:toolbox/pages/bitwisecalculator_page.dart';
import 'package:toolbox/pages/characterscopy_page.dart';
import 'package:toolbox/pages/clock_page.dart';
import 'package:toolbox/pages/compass_page.dart';
import 'package:toolbox/pages/counter_page.dart';
import 'package:toolbox/pages/fileencryption_page.dart';
import 'package:toolbox/pages/flipcoins_page.dart';
import 'package:toolbox/pages/gameoflife_page.dart';
import 'package:toolbox/pages/httprequest_page.dart';
import 'package:toolbox/pages/mathtex_page.dart';
import 'package:toolbox/pages/mcserverping_page.dart';
import 'package:toolbox/pages/megaphone_page.dart';
import 'package:toolbox/pages/metronome_page.dart';
import 'package:toolbox/pages/morsecode_page.dart';
import 'package:toolbox/pages/musicsearch_page.dart';
import 'package:toolbox/pages/networkinfo_page.dart';
import 'package:toolbox/pages/nationalanthems_page.dart';
import 'package:toolbox/pages/nearbypublictransportstops_page.dart';
import 'package:toolbox/pages/nslookup_page.dart';
import 'package:toolbox/pages/osm_page.dart';
import 'package:toolbox/pages/pastebin_page.dart';
import 'package:toolbox/pages/ping_page.dart';
import 'package:toolbox/pages/qrcreator_page.dart';
import 'package:toolbox/pages/qrreader_page.dart';
import 'package:toolbox/pages/randomcolor_page.dart';
import 'package:toolbox/pages/randomnumber_page.dart';
import 'package:toolbox/pages/romannumeral_page.dart';
import 'package:toolbox/pages/roulette_page.dart';
import 'package:toolbox/pages/sshclient_page.dart';
import 'package:toolbox/pages/soundmeter_page.dart';
import 'package:toolbox/pages/speedometer_page.dart';
import 'package:toolbox/pages/stopwatch_page.dart';
import 'package:toolbox/pages/musicanalyser_page.dart';
import 'package:toolbox/pages/textcounter_page.dart';
import 'package:toolbox/pages/textdifferences_page.dart';
import 'package:toolbox/pages/texttospeech_page.dart';
import 'package:toolbox/pages/timer_page.dart';
import 'package:toolbox/pages/timestampconverter_page.dart';
import 'package:toolbox/pages/urlshortener_page.dart';
import 'package:toolbox/pages/uuidgenerator_page.dart';
import 'package:toolbox/pages/whiteboard_page.dart';
import 'package:toolbox/pages/whoisdomain_page.dart';
import 'package:toolbox/pages/youtubethumbnail_page.dart';

import 'models/home_tool.dart';
import 'package:toolbox/gen/strings.g.dart';

class Hierarchy {
  static final Map<String, Tool> toolMap = {
    "areacalculator": Tool(t.tools.areacalculator.title, "assets/images/tools/areacalculator.png", const AreaCalculatorPage()),
    "baseconverter": Tool(t.tools.baseconverter.title, "assets/images/tools/baseconverter.png", const BaseConverterPage()),
    "bitwisecalculator": Tool(t.tools.bitwisecalculator.title, "assets/images/tools/bitwisecalculator.png", const BitwiseCalculatorPage()),
    "characterscopy": Tool(t.tools.characterscopy.title, "assets/images/tools/characterscopy.png", const CharactersCopyPage()),
    "clock": Tool(t.tools.clock.title, "assets/images/tools/clock.png", const ClockPage()),
    "compass": Tool(t.tools.compass.title, "assets/images/tools/compass.png", const CompassPage()),
    "counter": Tool(t.tools.counter.title, "assets/images/tools/counter.png", const CounterPage()),
    "fileencryption": Tool(t.tools.fileencryption.title, "assets/images/tools/fileencryption.png", const FileEncryptionPage()),
    "flipcoins": Tool(t.tools.flipcoins.title, "assets/images/tools/flipcoins.png", const FlipCoinsPage()),
    "gameoflife": Tool(t.tools.gameoflife.title, "assets/images/tools/gameoflife.png", const GameOfLifePage()),
    "httprequest": Tool(t.tools.httprequest.title, "assets/images/tools/httprequest.png", const HttpRequestPage()),
    "mathtex": Tool(t.tools.mathtex.title, "assets/images/tools/mathtex.png", const MathTexPage()),
    "mcserverping": Tool(t.tools.mc_server_ping.title, "assets/images/tools/mcserverping.png", const McServerPingPage()),
    "megaphone": Tool(t.tools.megaphone.title, "assets/images/tools/megaphone.png", const MegaphonePage()),
    "metronome": Tool(t.tools.metronome.title, "assets/images/tools/metronome.png", const MetronomePage()),
    "morsecode": Tool(t.tools.morsecode.title, "assets/images/tools/morsecode.png", const MorseCodePage()),
    "musicanalyser": Tool(t.tools.musicanalyser.title, "assets/images/tools/musicanalyser.png", const MusicAnalyserPage()),
    "musicsearch": Tool(t.tools.musicsearch.title, "assets/images/tools/musicsearch.png", const MusicSearchPage()),
    "nationalanthems": Tool(t.tools.nationalanthems.title, "assets/images/tools/nationalanthems.png", const NationalAnthemsPage()),
    "nearbypublictransportstops": Tool(t.tools.nearbypublictransportstops.title, "assets/images/tools/nearbypublictransportstops.png", const NearbyPublicTransportStopsPage()),
    "networkinfo": Tool(t.tools.networkinfo.title, "assets/images/tools/networkinfo.png", const NetworkInfoPage()),
    "nslookup": Tool(t.tools.nslookup.title, "assets/images/tools/nslookup.png", const NslookupPage()),
    "osm": Tool(t.tools.osm.title, "assets/images/tools/osm.png", const OsmPage()),
    "pastebin": Tool(t.tools.pastebin.title, "assets/images/tools/pastebin.png", const PastebinPage()),
    "ping": Tool(t.tools.ping.title, "assets/images/tools/ping.png", const PingPage()),
    "qrcreator": Tool(t.tools.qrcreator.title, "assets/images/tools/qrcreator.png", const QrCreatorPage()),
    "qrreader": Tool(t.tools.qrreader.title, "assets/images/tools/qrreader.png", const QrReaderPage()),
    "randomcolor": Tool(t.tools.randomcolor.title, "assets/images/tools/randomcolor.png", const RandomColorPage()),
    "randomnumber": Tool(t.tools.randomnumber.title, "assets/images/tools/randomnumber.png", const RandomNumberPage()),
    "romannumeral": Tool(t.tools.romannumeral.title, "assets/images/tools/romannumeral.png", const RomanNumeralPage()),
    "roulette": Tool(t.tools.roulette.title, "assets/images/tools/roulette.png", const RoulettePage()),
    "soundmeter": Tool(t.tools.soundmeter.title, "assets/images/tools/soundmeter.png", const SoundMeterPage()),
    "speedometer": Tool(t.tools.speedometer.title, "assets/images/tools/speedometer.png", const SpeedometerPage()),
    "sshclient": Tool(t.tools.sshclient.title, "assets/images/tools/sshclient.png", const SshClientPage()),
    "stopwatch": Tool(t.tools.stopwatch.title, "assets/images/tools/stopwatch.png", const StopwatchPage()),
    "textcounter": Tool(t.tools.textcounter.title, "assets/images/tools/textcounter.png", const TextCounterPage()),
    "textdifferences": Tool(t.tools.textdifferences.title, "assets/images/tools/textdifferences.png", const TextDifferencesPage()),
    "texttospeech": Tool(t.tools.texttospeech.title, "assets/images/tools/texttospeech.png", const TextToSpeechPage()),
    "timer": Tool(t.tools.timer.title, "assets/images/tools/timer.png", const TimerPage()),
    "timestampconverter": Tool(t.tools.timestampconverter.title, "assets/images/tools/timestampconverter.png", const TimestampConverterPage()),
    "urlshortener": Tool(t.tools.urlshortener.title, "assets/images/tools/urlshortener.png", const UrlShortenerPage()),
    "uuidgenerator": Tool(t.tools.uuidgenerator.title, "assets/images/tools/uuidgenerator.png", const UuidGeneratorPage()),
    "whiteboard": Tool(t.tools.whiteboard.title, "assets/images/tools/whiteboard.png", const WhiteBoardPage()),
    "whoisdomain": Tool(t.tools.whoisdomain.title, "assets/images/tools/whoisdomain.png", const WhoisDomainPage()),
    "youtubethumbnail": Tool(t.tools.youtubethumbnail.title, "assets/images/tools/youtubethumbnail.png", const YouTubeThumbnailPage())
  };

  static final List<dynamic> hierarchy = [
    Folder(t.folders.audio, "assets/images/folders/folder.png", [
      toolMap["metronome"],
      toolMap["morsecode"],
      toolMap["musicanalyser"],
      toolMap["musicsearch"],
      toolMap["nationalanthems"],
      toolMap["soundmeter"],
      toolMap["texttospeech"],
    ]),
    Folder(t.folders.calculations, "assets/images/folders/folder.png", [
      toolMap["areacalculator"],
      toolMap["baseconverter"],
      toolMap["bitwisecalculator"],
      toolMap["mathtex"],
      toolMap["romannumeral"],
      toolMap["textcounter"],
    ]),
    Folder(t.folders.games, "assets/images/folders/folder.png", [
      toolMap["gameoflife"],
      toolMap["mcserverping"],
    ]),
    Folder(t.folders.geography, "assets/images/folders/folder.png", [
      toolMap["compass"],
      toolMap["osm"],
      toolMap["nearbypublictransportstops"],
      toolMap["nationalanthems"],
      toolMap["speedometer"],
    ]),
    Folder(t.folders.miscellaneous, "assets/images/folders/folder.png", [
      toolMap["characterscopy"],
      toolMap["counter"],
      toolMap["fileencryption"],
      toolMap["qrcreator"],
      toolMap["qrreader"],
      toolMap["textdifferences"],
      toolMap["whiteboard"],
    ]),
    Folder(t.folders.network, "assets/images/folders/folder.png", [
      toolMap["httprequest"],
      toolMap["mcserverping"],
      toolMap["networkinfo"],
      toolMap["nslookup"],
      toolMap["ping"],
      toolMap["sshclient"],
      toolMap["whoisdomain"],
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
      toolMap["pastebin"],
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

  static String findToolIdByInstance(Tool tool) {
    return Hierarchy.toolMap.entries
        .firstWhere((entry) => entry.value == tool)
        .key;
  }

  static Future<List<String>> getFavoriteTools() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(SHARED_PREFERENCES_CORE_HOMEPAGE_FAVORITES) ?? [];
  }

  static Future<void> setFavoriteTools(List<String> favoriteTools) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(SHARED_PREFERENCES_CORE_HOMEPAGE_FAVORITES, favoriteTools);
  }

  static Future<void> addFavoriteTool(String toolId) async {
    List<String> favoriteTools = await getFavoriteTools();
    if (!favoriteTools.contains(toolId)) {
      favoriteTools.add(toolId);
      await setFavoriteTools(favoriteTools);
    }
  }

  static Future<void> removeFavoriteTool(String toolId) async {
    List<String> favoriteTools = await getFavoriteTools();
    if (favoriteTools.contains(toolId)) {
      favoriteTools.remove(toolId);
      await setFavoriteTools(favoriteTools);
    }
  }
}
