
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class MorseCodePage extends StatefulWidget {
  const MorseCodePage({ Key? key }) : super(key: key);
  @override
  State<MorseCodePage> createState() => _MorseCodePage();
}

class _MorseCodePage extends State<MorseCodePage> {
  final player = AudioPlayer();

  final TextEditingController _alphabetController = TextEditingController();
  final TextEditingController _morseController = TextEditingController();
  final Map<String, String> _morseDictionary = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..',
    'E': '.', 'F': '..-.', 'G': '--.', 'H': '....',
    'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.',
    'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..',
    '0': '-----', '1': '.----', '2': '..---', '3': '...--',
    '4': '....-', '5': '.....', '6': '-....', '7': '--...',
    '8': '---..', '9': '----.',
  };

  bool _isMorsePlayingAudio = false;

  void convertMorse(bool isFromAlphabet) {
    if (isFromAlphabet) {
      String alphabet = _alphabetController.text.toUpperCase();
      String morse = "";
      for (int i = 0; i < alphabet.length; i++) {
        String letter = alphabet[i];
        if (_morseDictionary.containsKey(letter)) {
          morse += "${_morseDictionary[letter]} ";
        } else if (letter == " ") {
          morse += "   ";
        } else if (letter == "\n") {
          morse += "\n";
        } else {
          morse += "? ";
        }
      }
      if (morse.isNotEmpty) {
        morse = morse.substring(0, morse.length - 1);
      }
      _morseController.text = morse;
    } else {
      String morse = _morseController.text;
      String alphabet = "";
      List<String> words = morse.split("   ");
      for (int i = 0; i < words.length; i++) {
        List<String> letters = words[i].split(" ");
        for (int j = 0; j < letters.length; j++) {
          String letter = letters[j];
          if (letter == "\n") {
            alphabet += "\n";
          } else if (letter == "") {
            alphabet += " ";
          } else {
            String? key = _morseDictionary.keys.firstWhere((
                k) => _morseDictionary[k] == letter, orElse: () => "");
            if (key != "") {
              alphabet += key;
            } else {
              alphabet += "?";
            }
          }
        }
        if (i < words.length - 1) {
          alphabet += " ";
        }
      }
      _alphabetController.text = alphabet;
    }
  }

  Future<void> playMorseBeep() async {
    String morse = _morseController.text;
    _morseController.text = "";
    List<String> words = morse.split("   ");

    for (int i = 0; i < words.length; i++) {
      List<String> letters = words[i].split(" ");

      for (int j = 0; j < letters.length; j++) {
        String letter = letters[j];

        if (letter == "\n" || letter == "") {
          await Future.delayed(const Duration(milliseconds: 1200));
        } else {
          for (int k = 0; k < letter.length; k++) {
            if (letter[k] == ".") {
              _morseController.text += ".";
              convertMorse(false);
              await player.play(AssetSource("audios/morsecode_short.wav"));
              await Future.delayed(const Duration(milliseconds: 600));
            } else if (letter[k] == "-") {
              _morseController.text += "-";
              convertMorse(false);
              await player.play(AssetSource("audios/morsecode_long.wav"));
              await Future.delayed(const Duration(milliseconds: 600));
            }
          }

          if (j < letters.length - 1) {
            _morseController.text += " ";
            convertMorse(false);
            await Future.delayed(const Duration(milliseconds: 600));
          }
        }
      }

      if (i < words.length - 1) {
        _morseController.text += "   ";
        convertMorse(false);
        await Future.delayed(const Duration(milliseconds: 1200));
      }
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("${t.generic
                .app_name} - ${t.tools.morsecode.title}"),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _alphabetController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      readOnly: _isMorsePlayingAudio,
                      decoration: InputDecoration(
                        labelText: t.tools.morsecode.alphabet_field,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _morseController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      readOnly: _isMorsePlayingAudio,
                      decoration: InputDecoration(
                        labelText: t.tools.morsecode.morse_field,
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                        t.tools.morsecode.note_spaces,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                        )
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        child: Text(t.tools.morsecode.alphabet_to_morse),
                        onPressed: () {
                          if (_isMorsePlayingAudio) {
                            return;
                          }
                          if (_alphabetController.text
                              .trim()
                              .isNotEmpty) {
                            convertMorse(true);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        child: Text(t.tools.morsecode.morse_to_alphabet),
                        onPressed: () {
                          if (_isMorsePlayingAudio) {
                            return;
                          }
                          if (_morseController.text
                              .trim()
                              .isNotEmpty) {
                            convertMorse(false);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        child: Text(t.tools.morsecode.play_audio),
                        onPressed: () async {
                          if (_isMorsePlayingAudio) {
                            return;
                          }
                          if (_morseController.text
                              .trim()
                              .isNotEmpty) {
                            setState(() {
                              _isMorsePlayingAudio = true;
                            });
                            await playMorseBeep();
                            if (mounted) {
                              setState(() {
                                _isMorsePlayingAudio = false;
                              });
                            }
                          }
                        },
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