

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:record/record.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/secret/musicanalyzer.dart';

class MusicAnalyserPage extends StatefulWidget {
  const MusicAnalyserPage({super.key});

  @override
  State<MusicAnalyserPage> createState() => _MusicAnalyserPage();
}

class _MusicAnalyserPage extends State<MusicAnalyserPage> {
  final String apiEndpoint = "https://toolbox.koizeay.com/musicanalyzer/analyze";
  bool isLoading = true;
  bool isAnalyzing = false;

  final AudioRecorder audioRecorder = AudioRecorder();

  String audioTitle = "";
  String audioSubtitle = "";
  String audioCover = "";

  String? statusText;

  @override
  void initState() {
    super.initState();
    hasMicrophonePermission().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    stopAudioStream();
    super.dispose();
  }

  void clearAudioData() {
    if (mounted) {
      setState(() {
        audioTitle = "";
        audioSubtitle = "";
        audioCover = "";
      });
    }
  }

  void resetStatusText() {
    if (mounted) {
      setState(() {
        statusText = "";
      });
    }
  }

  Future<void> hasMicrophonePermission() async {
    if (!await Permission.microphone.isGranted) {
      if (!await Permission.microphone
          .request()
          .isGranted) {
        if (mounted) {
          showCustomActionOkTextDialog(
              context,
              t.tools.musicanalyser.error.permission_denied,
              t.tools.musicanalyser.error.permission_denied_description,
                  () {
                Navigator.of(context).pop();
              },
              barrierDismissible: false
          );
        }
      }
    }
  }

  Future<String> getAudioPath() async {
    return '${(await getTemporaryDirectory()).path}/audio.m4a';
  }

  Future<void> startAudioStream() async {
    await audioRecorder.start(const RecordConfig(), path: await getAudioPath());
  }

  Future<void> stopAudioStream() async {
    await audioRecorder.stop();
  }

  Future<StreamedResponse> getAudioData() async {
    var request = MultipartRequest('POST', Uri.parse(apiEndpoint));

    request.files.add(await MultipartFile.fromPath(
      'file',
      await getAudioPath(),
      contentType: MediaType('audio', 'mp4'),
    ));
    request.headers["Authorization-Token"] = await getMusicAnalyzerApiToken(await getAudioPath());
    request.headers["Authorization-Key"] = await getMusicAnalyzerApiKey();
    return await request.send().onError((error, stackTrace) {
      if (kDebugMode) {
        print("HTTP error: $error");
      }
      return StreamedResponse(const Stream.empty(), 500);
    });
  }

  Future<void> startAnalyzingMusic() async {
    int remainingSeconds = 10;
    setState(() {
      statusText = t.tools.musicanalyser.loading;
      isAnalyzing = true;
      clearAudioData();
    });
    await startAudioStream();
    while (remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        remainingSeconds--;
        setState(() {
          statusText = t.tools.musicanalyser.analyzing_music(remainingSeconds: remainingSeconds);
        });
      }
    }
    await stopAudioStream();
    if (mounted) {
      setState(() {
        statusText = t.tools.musicanalyser.getting_results;
      });
    }
    var response = await getAudioData();
    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) {
        if (mounted) {
          var json = jsonDecode(value);
          setState(() {
            audioTitle = json["title"] ?? t.tools.musicanalyser.unknown;
            audioSubtitle = json["subtitle"] ?? t.tools.musicanalyser.unknown;
            audioCover = json["cover"] ?? "";
          });
        }
      });
    } else if (response.statusCode == 404) {
      if (mounted) {
        setState(() {
          showOkTextDialog(
              context,
              t.tools.musicanalyser.error.no_match_found,
              t.tools.musicanalyser.error.no_match_found_description
          );
        });
      }
    } else if (response.statusCode == 401) {
      if (mounted) {
        setState(() {
          showOkTextDialog(
              context,
              t.generic.error,
              t.tools.musicanalyser.error.please_update_the_app_and_try_again
          );
        });
      }
    } else {
      if (mounted) {
        if (kDebugMode) {
          print("HTTP error: ${response.statusCode}: ${await response.stream
              .bytesToString()}");
        }
        setState(() {
          showOkTextDialog(
              context,
              t.generic.error,
              t.tools.musicanalyser.error.error_occurred
          );
        });
      }
    }
    if (mounted) {
      setState(() {
        isAnalyzing = false;
        statusText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.musicanalyser.title),
            actions: [
              IconButton(
                  icon: const Icon(Icons.copyright_outlined),
                  onPressed: () {
                    showOkTextDialog(
                        context,
                        t.tools.musicanalyser.api_used,
                        t.tools.musicanalyser.this_tool_uses_the_x_api(service: "Shazam", company: "Apple Inc.")
                    );
                  }
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              )
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isAnalyzing
                        ? SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(statusText ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center),
                      ),
                    ) : SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          await startAnalyzingMusic();
                        },
                        child: Text(t.tools.musicanalyser.start_analyzing_music, textAlign: TextAlign.center),
                      ),
                    ),
                    Text(isAnalyzing
                        ? ""
                        : t.tools.musicanalyser.press_the_button_to_start_music_analysis,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 20,
                    ),
                    audioTitle.isEmpty
                        ? Container()
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(audioCover),
                              errorBuilder: (context, error, stackTrace) {
                                return const Text("");
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12,),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(audioTitle,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left),
                              ),
                              const SizedBox(height: 4,),
                              SizedBox(
                                width: double.infinity,
                                child: Text(audioSubtitle,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            clearAudioData();
                          },
                          icon: const Icon(Icons.close_rounded),
                          tooltip: t.tools.musicanalyser.clear,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}