
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.texttospeech.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Input Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.text_fields, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    t.tools.texttospeech.text_to_speak,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: inputTextController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: t.tools.texttospeech.text_to_speak,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Settings Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.settings_outlined, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Settings",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Language Selector
                              Row(
                                children: [
                                  Icon(Icons.language, color: colorScheme.onSurfaceVariant, size: 20),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: DropdownMenu(
                                      initialSelection: currentLanguage,
                                      dropdownMenuEntries: languages,
                                      width: double.infinity,
                                      enableFilter: false,
                                      enableSearch: false,
                                      menuHeight: 300,
                                      inputDecorationTheme: InputDecorationTheme(
                                        filled: true,
                                        fillColor: colorScheme.surfaceVariant,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      ),
                                      onSelected: (value) {
                                        loading = true;
                                        changeLanguage((value ?? "").toString()).then((value) =>
                                        loading = false);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Pitch Slider
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        t.tools.texttospeech.pitch,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: colorScheme.primaryContainer,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          currentPitch.toStringAsFixed(2),
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Rate Slider
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        t.tools.texttospeech.rate,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: colorScheme.primaryContainer,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          currentSpeechRate.toStringAsFixed(2),
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Control Button
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          icon: Icon(isPlaying ? Icons.stop : Icons.volume_up),
                          label: Text(isPlaying ? t.tools.texttospeech.stop : t.tools.texttospeech.play),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            await playText();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}