
import 'dart:convert';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/nationalanthems_anthem.dart';

class NationalAnthemsPage extends StatefulWidget {
  const NationalAnthemsPage({ Key? key }) : super(key: key);
  @override
  State<NationalAnthemsPage> createState() => _NationalAnthemsPage();
}

class _NationalAnthemsPage extends State<NationalAnthemsPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  final String jsonListUrl = "https://raw.githubusercontent.com/Koizeay/Sharing/main/Toolbox/nationalanthems_list.json";
  final String remoteMp3Url = "https://nationalanthems.info/";
  List<NationalAnthemsAnthem> anthemsList = [];
  List<NationalAnthemsAnthem> filteredAnthemsList = [];

  bool isLoading = true;

  @override
  void initState() {
    loadAnthemsList().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.stop();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  Future<void> loadAnthemsList() async {
    try {
      HttpClientResponse response = await HttpClient().getUrl(
          Uri.parse(jsonListUrl)).then((HttpClientRequest request) =>
          request.close());
      if (response.statusCode == 200) {
        String json = await response.transform(utf8.decoder).join();
        List<dynamic> jsonList = jsonDecode(json);
        for (dynamic jsonObject in jsonList) {
          anthemsList.add(NationalAnthemsAnthem.fromJson(jsonObject));
        }
        anthemsList.sort((a, b) => a.name.compareTo(b.name));
        filteredAnthemsList = anthemsList;
      } else {
        if (mounted) {
          showOkTextDialog(context, t.generic.error, t.tools.nationalanthems.error.failed_to_load_list);
        }
      }
    } catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error, t.tools.nationalanthems.error.failed_to_load_list);
      }
    }
  }

  void filterList(String filter) {
    setState(() {
      filteredAnthemsList = anthemsList.where((anthem) =>
      anthem.name.toLowerCase().contains(filter.toLowerCase()) ||
          anthem.code.toLowerCase().contains(filter.toLowerCase())).toList();
    });
  }

  Future<void> playAnthems(NationalAnthemsAnthem anthem) async {
    assetsAudioPlayer.stop();
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    String url = "$remoteMp3Url${anthem.code}.mp3";
    try {
      await assetsAudioPlayer.open(
        Audio.network(
          url,
          metas: Metas(
            title: anthem.name,
            artist: t.generic.app_name,
            album: t.generic.app_name,
            image: const MetasImage.asset(
                "assets/images/specific/nationalanthems_cover.png"),
          ),
        ),
        showNotification: true,
        loopMode: LoopMode.single,
        notificationSettings: const NotificationSettings(
          seekBarEnabled: false,
          prevEnabled: false,
          nextEnabled: false,
          stopEnabled: true,
          playPauseEnabled: true,
        ),
      );
      assetsAudioPlayer.play();
    } catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error, t.tools.nationalanthems.error.failed_to_play_anthem);
      }
      assetsAudioPlayer.stop();
    } finally {
      if (mounted) {
        filteredAnthemsList = anthemsList;
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void showLicenseDialog() {
    List<TextButton> buttons = [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(t.generic.ok),
      ),
      TextButton(
          onPressed: () => launchUrlInBrowser("https://nationalanthems.info/"),
          child: Text(t.tools.nationalanthems.open)
      ),
      TextButton(
          onPressed: () =>
              launchUrlInBrowser(
                  "https://creativecommons.org/licenses/by/3.0/"),
          child: Text(t.tools.nationalanthems.view_license)
      )
    ];
    showCustomButtonsTextDialog(
      context,
      t.tools.nationalanthems.license,
      t.tools.nationalanthems.license_text(source: "nationalanthems.info", license: "Creative Commons Attribution 3.0 Unported License"),
      buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("${t.generic.app_name} - ${t.tools.nationalanthems.title}"),
            actions: [
              IconButton(
                  tooltip: t.tools.nationalanthems.stop,
                  icon: const Icon(Icons.music_off),
                  onPressed: () {
                    assetsAudioPlayer.stop();
                  }
              ),
              IconButton(
                  onPressed: () => showLicenseDialog(),
                  icon: const Icon(Icons.copyright)
              )
            ],
          ),
          body: SafeArea(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: t.tools.nationalanthems.search,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (String filter) {
                      filterList(filter);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredAnthemsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      NationalAnthemsAnthem anthem = filteredAnthemsList[index];
                      return ListTile(
                        title: Text(anthem.name),
                        leading: const Icon(
                          Icons.music_note,
                          color: Colors.black87,
                        ),
                        onTap: () {
                          playAnthems(anthem);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}