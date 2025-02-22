
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/musicsearch_music.dart';

class MusicSearchPage extends StatefulWidget {
  const MusicSearchPage({super.key});

  @override
  State<MusicSearchPage> createState() => _MusicSearchPage();
}

class _MusicSearchPage extends State<MusicSearchPage> {
  final audioPlayer = AudioPlayer();

  final String serviceName = "Deezer";
  final String deezerSearchApiUrl = "https://api.deezer.com/search?limit=15&q=";
  List<MusicSearchMusic> musicList = [];

  double lastSearchTimestamp = 0;

  bool isSearching = false;
  bool hasApiError = false;

  @override
  void dispose() {
    stopAudioPreview();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> searchMusic(String query) async {
    query = query.trim();
    double currentSearchTimestamp = DateTime.now().millisecondsSinceEpoch / 1000;
    lastSearchTimestamp = currentSearchTimestamp;
    setState(() {
      isSearching = true;
      hasApiError = false;
    });
    if (query.isEmpty) {
      if (currentSearchTimestamp == lastSearchTimestamp) {
        setState(() {
          musicList = [];
          isSearching = false;
        });
        return;
      }
    }
    String urlEncodedQuery = Uri.encodeComponent(query);
    Response response = await httpGet(deezerSearchApiUrl + urlEncodedQuery, {}).onError((
        error, stackTrace) {
      if (kDebugMode) {
        print("Error searching music: $error");
      }
      return Response("", 500);
    });
    if (response.statusCode == 200) {
      List<dynamic> musicJsonList = jsonDecode(response.body)["data"];
      List<MusicSearchMusic> musicList = [];
      for (int i = 0; i < musicJsonList.length; i++) {
        try {
          musicList.add(MusicSearchMusic(
              musicJsonList[i]["title"] ?? t.tools.musicsearch.unknown_title,
              musicJsonList[i]["artist"]?["name"] ?? t.tools.musicsearch.unknown_artist,
              musicJsonList[i]["artist"]?["picture"] ?? "",
              musicJsonList[i]["album"]?["title"] ?? t.tools.musicsearch.unknown_album,
              musicJsonList[i]["album"]?["cover"] ?? "",
              musicJsonList[i]["preview"] ?? "",
              musicJsonList[i]["link"] ?? ""
          ));
        } catch (e) {
          if (kDebugMode) {
            print("Error parsing music data: $e");
          }
        }
      }
      if (mounted && currentSearchTimestamp == lastSearchTimestamp) {
        setState(() {
          this.musicList = musicList;
          isSearching = false;
        });
      }
    } else {
      if (mounted && currentSearchTimestamp == lastSearchTimestamp) {
        setState(() {
          isSearching = false;
          hasApiError = true;
          musicList = [];
        });
      }
    }
  }

  Future<void> playAudioPreview(String previewAudioUrl) async {
    showCustomButtonsTextDialog(
        context,
        t.tools.musicsearch.loading,
        t.tools.musicsearch.loading_audio_preview,
        [],
        barrierDismissible: false
    );
    await stopAudioPreview();
    await audioPlayer.play(UrlSource(previewAudioUrl)).onError((error, stackTrace) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(t.tools.musicsearch.error.error_playing_audio_preview),
        ));
      }
    });
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> stopAudioPreview() async {
    await audioPlayer.stop();
  }

  void showMusicInfoDialog(BuildContext context, String title, String artist, String artistPictureUrl, String album, String albumPictureUrl, String deezerUrl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image(
                            width: 50,
                            height: 50,
                            image: NetworkImage(artistPictureUrl),
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return const Icon(Icons.person, size: 40);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                          child: Text(
                            artist,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image(
                            width: 50,
                            height: 50,
                            image: NetworkImage(albumPictureUrl),
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return const Icon(Icons.album, size: 40);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                          child: Text(
                              album,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  launchUrlInBrowser(deezerUrl);
                  Navigator.of(context).pop();
                },
                child: Text(
                    t.tools.musicsearch.open_in_x(service: serviceName)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.generic.ok),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.musicsearch.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.music_off),
                onPressed: () async {
                  await stopAudioPreview();
                },
                tooltip: t.tools.musicsearch.stop_audio_preview,
              ),
              IconButton(
                icon: const Icon(Icons.copyright),
                onPressed: () {
                  showCustomButtonsTextDialog(
                      context,
                      t.tools.musicsearch.data_source,
                      t.tools.musicsearch.this_tool_uses_the_x_api(service: serviceName),
                      [
                        TextButton(
                          onPressed: () {
                            launchUrlInBrowser(
                                "https://developers.deezer.com/api");
                            Navigator.of(context).pop();
                          },
                          child: Text(t.tools.musicsearch.go_to_x(service: serviceName)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(t.generic.ok),
                        ),
                      ]
                  );
                },
                tooltip: t.tools.musicsearch.data_source,
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: t.tools.musicsearch.search_for_music,
                      suffixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (String value) async {
                      await searchMusic(value);
                    },
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: isSearching
                        ? const Center(child: CircularProgressIndicator())
                        : hasApiError ? Center(child: Text(
                      t.tools.musicsearch.error.unable_to_connect_to_the_api,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,))
                        : musicList.isEmpty
                        ? Center(child: Text(
                      t.tools.musicsearch.use_the_searchbar_to_search_music,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,))
                        : ListView.builder(
                      itemCount: musicList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            showMusicInfoDialog(
                                context,
                                musicList[index].title,
                                musicList[index].artist,
                                musicList[index].artistPictureUrl,
                                musicList[index].album,
                                musicList[index].albumPictureUrl,
                                musicList[index].deezerUrl
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(musicList[index].title, maxLines: 2, overflow: TextOverflow.ellipsis),
                              subtitle: Text(musicList[index].artist, maxLines: 2, overflow: TextOverflow.ellipsis),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                  width: 60,
                                  height: 60,
                                  image: NetworkImage(
                                      musicList[index].albumPictureUrl
                                  ),
                                  errorBuilder: (BuildContext context, Object error,
                                      StackTrace? stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.play_arrow),
                                onPressed: () {
                                  playAudioPreview(
                                      musicList[index].previewAudioUrl);
                                },
                                tooltip: t.tools.musicsearch.play_preview,
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
        )
    );
  }
}