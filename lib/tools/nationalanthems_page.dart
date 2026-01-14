
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/nationalanthems_anthem.dart';

class NationalAnthemsPage extends StatefulWidget {
  const NationalAnthemsPage({ super.key });
  @override
  State<NationalAnthemsPage> createState() => _NationalAnthemsPage();
}

class _NationalAnthemsPage extends State<NationalAnthemsPage> {
  final audioPlayer = AudioPlayer();

  final String jsonListUrl = "https://raw.githubusercontent.com/Koizeay/Sharing/main/Toolbox/nationalanthems_list.json";
  final String remoteMp3Url = "https://nationalanthems.info/";
  List<NationalAnthemsAnthem> anthemsList = [];
  List<NationalAnthemsAnthem> filteredAnthemsList = [];

  bool isLoading = true;
  bool isLoadingAudio = false;

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
    audioPlayer.dispose();
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
      anthem.name.toLowerCase().contains(filter.toLowerCase())).toList();
    });
  }

  void showLoadingDialog() {
    showCustomButtonsTextDialog(
        context,
        t.tools.nationalanthems.loading_audio_title,
        t.tools.nationalanthems.loading_audio_text,
        [],
        barrierDismissible: false
    );
  }

  void hideLoadingDialog(BuildContext context) {
    if (isLoadingAudio) {
      Navigator.pop(context);
    }
  }

  Future<void> playAnthems(NationalAnthemsAnthem anthem) async {
    await audioPlayer.stop();
    if (isLoading) {
      return;
    }
    isLoadingAudio = true;
    setState(() {
      showLoadingDialog();
    });
    String url = "$remoteMp3Url${anthem.code}.mp3";
    try {
      await audioPlayer.play(UrlSource(url,), mode: PlayerMode.mediaPlayer);
      if (mounted) {
        hideLoadingDialog(context);
      }
    } catch (e) {
      if (mounted) {
        hideLoadingDialog(context);
      }
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.nationalanthems.error.failed_to_play_anthem);
      }
      await audioPlayer.stop();
    } finally {
      if (mounted) {
        isLoadingAudio = false;
      }
    }
  }

  void showLicenseDialog() {
    List<TextButton> buttons = [
      TextButton(
          onPressed: () => launchUrlInBrowser("https://nationalanthems.info/"),
          child: Text(t.tools.nationalanthems.open)
      ),
      TextButton(
          onPressed: () =>
              launchUrlInBrowser(
                  "https://creativecommons.org/licenses/by/4.0/"),
          child: Text(t.tools.nationalanthems.view_license)
      ),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(t.generic.ok),
      ),
    ];
    showCustomButtonsTextDialog(
      context,
      t.tools.nationalanthems.license,
      t.tools.nationalanthems.license_text(source: "nationalanthems.info", license: "Creative Commons Attribution 4.0 Unported License"),
      buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.nationalanthems.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            IconButton(
              tooltip: t.tools.nationalanthems.stop,
              icon: const Icon(Icons.stop_circle_outlined),
              onPressed: () async {
                await audioPlayer.stop();
              },
            ),
            IconButton(
              tooltip: t.tools.nationalanthems.license,
              onPressed: () => showLicenseDialog(),
              icon: const Icon(Icons.info_outline),
            ),
          ],
        ),
        body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Search Card
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: t.tools.nationalanthems.search,
                          filled: true,
                          fillColor: colorScheme.surfaceVariant,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search, color: colorScheme.onSurfaceVariant),
                        ),
                        onChanged: (String filter) {
                          filterList(filter);
                        },
                      ),
                    ),
                    // Anthems List
                    Expanded(
                      child: filteredAnthemsList.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 64,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No anthems found",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              itemCount: filteredAnthemsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                NationalAnthemsAnthem anthem = filteredAnthemsList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Card(
                                    elevation: 0,
                                    color: colorScheme.surfaceVariant,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        playAnthems(anthem);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                color: colorScheme.primaryContainer,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                Icons.music_note,
                                                color: colorScheme.onPrimaryContainer,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Text(
                                                anthem.name,
                                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.play_circle_outline,
                                              color: colorScheme.primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}