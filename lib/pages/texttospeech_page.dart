
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';

class TextToSpeechPage extends StatefulWidget {
  const TextToSpeechPage({ super.key });
  @override
  State<TextToSpeechPage> createState() => _TextToSpeechPage();
}

class _TextToSpeechPage extends State<TextToSpeechPage> {
  String defaultLanguageString = t.tools.texttospeech.choose_a_language;
  TextEditingController inputTextController = TextEditingController();
  bool loading = true;
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  String? currentLanguage;
  List<DropdownMenuEntry<dynamic>> languages = [];
  double currentPitch = 1.0;
  double currentSpeechRate = 0.5;


  @override
  void initState() {
    currentLanguage = defaultLanguageString;
    init().then((value) {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> init() async {
    await initLanguages();
    await setIosSettings();
    await initCurrentLanguageFromSharedPreferences();
    setHandlers();
  }

  Future<void> initLanguages() async {
    List<dynamic> tempLanguages = await flutterTts.getLanguages;
    languages.add(DropdownMenuEntry(
      value: defaultLanguageString,
      label: defaultLanguageString,
    ));
    for (var element in tempLanguages) {
      languages.add(DropdownMenuEntry(
        value: element,
        label: element,
      ));
    }
    languages.sort((a, b) => a.label.toString().compareTo(b.label.toString()));
    currentLanguage = languages[0].value;
  }

  Future<void> setIosSettings() async {
    if (Platform.isIOS) {
      loading = true;
      flutterTts.setSharedInstance(true).then((value) async {
        await flutterTts.setIosAudioCategory(
            IosTextToSpeechAudioCategory.ambient,
            [
              IosTextToSpeechAudioCategoryOptions.allowBluetooth,
              IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
              IosTextToSpeechAudioCategoryOptions.mixWithOthers
            ],
            IosTextToSpeechAudioMode.voicePrompt
        ).then((value) {
          if (mounted) {
            setState(() {
              loading = false;
            });
          }
        });
      });
    }
  }

  void setHandlers() {
    flutterTts.setStartHandler(() {
      if (mounted) {
        setState(() {
          isPlaying = true;
        });
      }
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        if (mounted) {
          setState(() {
            isPlaying = false;
          });
        }
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    t.tools.texttospeech.error.please_try_again
                ),
              )
          );
          setState(() {
            isPlaying = false;
          });
        }
      });
    });

    flutterTts.setCancelHandler(() {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  Future<void> changeLanguage(String language) async {
    await flutterTts.setLanguage(language);
    await saveCurrentLanguageToSharedPreferences(language);
    if (mounted) {
      setState(() {
        currentLanguage = language;
      });
    }
  }

  Future<void> saveCurrentLanguageToSharedPreferences(String language) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        SHARED_PREFERENCES_TOOL_TEXTTOSPEECH_LANGUAGE, language);
  }

  Future<void> initCurrentLanguageFromSharedPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var tempCurrentLanguage = prefs.getString(
        SHARED_PREFERENCES_TOOL_TEXTTOSPEECH_LANGUAGE);
    if (tempCurrentLanguage != null) {
      if (!languages.any((element) => element.value == tempCurrentLanguage)) {
        tempCurrentLanguage = defaultLanguageString;
      }
    }
    await changeLanguage(tempCurrentLanguage ?? defaultLanguageString);
  }

  Future<void> playText() async {
    if (isPlaying) {
      await flutterTts.stop();
      return;
    }
    if (currentLanguage == defaultLanguageString) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.texttospeech.error.please_select_a_language),
          )
      );
      return;
    }
    String textToSpeak = inputTextController.text;
    if (textToSpeak.isNotEmpty) {
      await flutterTts.speak(textToSpeak);
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
            title: Text(t.tools.texttospeech.title),
          ),
          body: SafeArea(
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: inputTextController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: t.tools.texttospeech.text_to_speak
                      ),
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      child: DropdownMenu(
                        initialSelection: currentLanguage,
                        dropdownMenuEntries: languages,
                        width: double.infinity,
                        enableFilter: false,
                        enableSearch: false,
                        menuHeight: 300,
                        onSelected: (value) {
                          loading = true;
                          changeLanguage((value ?? "").toString()).then((value) =>
                          loading = false);
                        },
                      ),
                    ),
                    const SizedBox(height: 8,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(t.tools.texttospeech.pitch),
                          Slider(
                            value: currentPitch,
                            onChanged: (value) {
                              setState(() {
                                currentPitch = value;
                              });
                            },
                            onChangeEnd: (value) async {
                              loading = true;
                              await flutterTts.setPitch(value).then((value) => loading = false);
                            },
                            min: 0.5,
                            max: 2.0,
                          ),
                          Text(currentPitch.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(t.tools.texttospeech.rate),
                          Slider(
                            value: currentSpeechRate,
                            onChanged: (value) {
                              setState(() {
                                currentSpeechRate = value;
                              });
                            },
                            onChangeEnd: (value) async {
                              loading = true;
                              await flutterTts.setSpeechRate(value).then((value) => loading = false);
                            },
                            min: 0.01,
                            max: 1.0,
                          ),
                          Text(currentSpeechRate.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () async {
                            await playText();
                          },
                          child: Text(isPlaying ? t.tools.texttospeech.stop : t.tools.texttospeech.play)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}