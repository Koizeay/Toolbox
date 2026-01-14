
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class MorseCodePage extends StatefulWidget {
  const MorseCodePage({ super.key });
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.morsecode.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Alphabet Card
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
                              t.tools.morsecode.alphabet_field,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _alphabetController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 3,
                          readOnly: _isMorsePlayingAudio,
                          decoration: InputDecoration(
                            hintText: "Enter text here...",
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
                // Morse Code Card
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
                            Icon(Icons.graphic_eq, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              t.tools.morsecode.morse_field,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _morseController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 3,
                          readOnly: _isMorsePlayingAudio,
                          decoration: InputDecoration(
                            hintText: ".- -... -.-.",
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceVariant.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, size: 16, color: colorScheme.onSurfaceVariant),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  t.tools.morsecode.note_spaces,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Action Buttons Card
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
                            Icon(Icons.swap_horiz, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Actions",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.arrow_downward),
                            label: Text(t.tools.morsecode.alphabet_to_morse),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _isMorsePlayingAudio
                              ? null
                              : () {
                                  if (_alphabetController.text.trim().isNotEmpty) {
                                    convertMorse(true);
                                  }
                                },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.arrow_upward),
                            label: Text(t.tools.morsecode.morse_to_alphabet),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _isMorsePlayingAudio
                              ? null
                              : () {
                                  if (_morseController.text.trim().isNotEmpty) {
                                    convertMorse(false);
                                  }
                                },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            icon: Icon(_isMorsePlayingAudio ? Icons.stop : Icons.volume_up),
                            label: Text(_isMorsePlayingAudio ? "Playing..." : t.tools.morsecode.play_audio),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(
                                color: _isMorsePlayingAudio ? colorScheme.primary : colorScheme.outline,
                              ),
                            ),
                            onPressed: _isMorsePlayingAudio
                              ? null
                              : () async {
                                  if (_morseController.text.trim().isNotEmpty) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}