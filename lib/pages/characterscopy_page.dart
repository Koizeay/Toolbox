
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/characterscopy_character.dart';

class CharactersCopyPage extends StatefulWidget {
  const CharactersCopyPage({super.key});

  @override
  State<CharactersCopyPage> createState() => _CharactersCopyPage();
}

class _CharactersCopyPage extends State<CharactersCopyPage> {

  List<CharactersCopyCharacter> charactersList = [
    CharactersCopyCharacter("Almost equal", "\u2248"),
    CharactersCopyCharacter("Alpha", "\u03B1"),
    CharactersCopyCharacter("Apple logo", "\uF8FF"),
    CharactersCopyCharacter("Beta", "\u03B2"),
    CharactersCopyCharacter("Bitcoin", "\u20BF"),
    CharactersCopyCharacter("Black smiling face", "\u263B"),
    CharactersCopyCharacter("Celsius", "\u2103"),
    CharactersCopyCharacter("Cent", "\u00A2"),
    CharactersCopyCharacter("Check mark", "\u2713"),
    CharactersCopyCharacter("Copyright", "\u00A9"),
    CharactersCopyCharacter("Cross mark", "\u2717"),
    CharactersCopyCharacter("Degree", "\u00B0"),
    CharactersCopyCharacter("Delta", "\u03B4"),
    CharactersCopyCharacter("Delta capital", "\u0394"),
    CharactersCopyCharacter("Division", "\u00F7"),
    CharactersCopyCharacter("Dollar", "\u0024"),
    CharactersCopyCharacter("Downwards arrow", "\u2193"),
    CharactersCopyCharacter("Element of", "\u2208"),
    CharactersCopyCharacter("Empty set", "\u2205"),
    CharactersCopyCharacter("Equal", "\u003D"),
    CharactersCopyCharacter("Erase to the left", "\u232B"),
    CharactersCopyCharacter("Erase to the right", "\u2326"),
    CharactersCopyCharacter("Euro", "\u20AC"),
    CharactersCopyCharacter("Fahrenheit", "\u2109"),
    CharactersCopyCharacter("Franc", "\u20A3"),
    CharactersCopyCharacter("Function", "\u0192"),
    CharactersCopyCharacter("Gamma", "\u03B3"),
    CharactersCopyCharacter("Gamma capital", "\u0393"),
    CharactersCopyCharacter("Gender female-female", "\u26A2"),
    CharactersCopyCharacter("Gender male-female", "\u26A4"),
    CharactersCopyCharacter("Gender male-female unified", "\u26A5"),
    CharactersCopyCharacter("Gender male-male", "\u26A3"),
    CharactersCopyCharacter("Hammer and sickle", "\u262D"),
    CharactersCopyCharacter("Homotetic", "\u223B"),
    CharactersCopyCharacter("Horizontal double arrow with vertical stroke", "\u21F9"),
    CharactersCopyCharacter("Horizontal double arrow with double vertical stroke", "\u21FC"),
    CharactersCopyCharacter("Horizontal ellipsis", "\u2026"),
    CharactersCopyCharacter("House", "\u2302"),
    CharactersCopyCharacter("Indian rupee", "\u20B9"),
    CharactersCopyCharacter("Infinity", "\u221E"),
    CharactersCopyCharacter("Integral", "\u222B"),
    CharactersCopyCharacter("Interrobang", "\u203D"),
    CharactersCopyCharacter("Lambda", "\u03BB"),
    CharactersCopyCharacter("Lambda capital", "\u039B"),
    CharactersCopyCharacter("Left to right mark (non-printing)", "\u200E"),
    CharactersCopyCharacter("Left to right override (non-printing)", "\u202D"),
    CharactersCopyCharacter("Lira", "\u20A4"),
    CharactersCopyCharacter("Leftwards arrow", "\u2190"),
    CharactersCopyCharacter("Mathematical Double-Struck Capital X", "\u{1D54F}"),
    CharactersCopyCharacter("Micro", "\u00B5"),
    CharactersCopyCharacter("Minus", "\u2212"),
    CharactersCopyCharacter("Mu", "\u03BC"),
    CharactersCopyCharacter("Multiplication", "\u00D7"),
    CharactersCopyCharacter("Musical g clef", "\u{1D11E}"),
    CharactersCopyCharacter("Naira", "\u20A6"),
    CharactersCopyCharacter("Not element of", "\u2209"),
    CharactersCopyCharacter("Not equal", "\u2260"),
    CharactersCopyCharacter("Numero", "\u2116"),
    CharactersCopyCharacter("Section", "\u00A7"),
    CharactersCopyCharacter("Peseta", "\u20A7"),
    CharactersCopyCharacter("Pi", "\u03C0"),
    CharactersCopyCharacter("Pi capital", "\u03A0"),
    CharactersCopyCharacter("Place of interest", "\u2318"),
    CharactersCopyCharacter("Plus", "\u002B"),
    CharactersCopyCharacter("Plus minus", "\u00B1"),
    CharactersCopyCharacter("Pound", "\u00A3"),
    CharactersCopyCharacter("Power", "\u23FB"),
    CharactersCopyCharacter("Propositional to", "\u221D"),
    CharactersCopyCharacter("Reference mark", "\u203B"),
    CharactersCopyCharacter("Registered trademark", "\u00AE"),
    CharactersCopyCharacter("Right to left mark (non-printing)", "\u200F"),
    CharactersCopyCharacter("Right to left override (non-printing)", "\u202E"),
    CharactersCopyCharacter("Rightwards arrow", "\u2192"),
    CharactersCopyCharacter("Ruble", "\u20BD"),
    CharactersCopyCharacter("Sigma", "\u03C3"),
    CharactersCopyCharacter("Sigma capital", "\u03A3"),
    CharactersCopyCharacter("Sinhala Letter Kantaja Naasikyaya", "\u0D9E"),
    CharactersCopyCharacter("Sound recording copyright", "\u2117"),
    CharactersCopyCharacter("Square four corners", "\u26F6"),
    CharactersCopyCharacter("Square root", "\u221A"),
    CharactersCopyCharacter("Squared key", "\u26BF"),
    CharactersCopyCharacter("Summation", "\u2211"),
    CharactersCopyCharacter("Summation integral", "\u2A0B"),
    CharactersCopyCharacter("Trademark", "\u2122"),
    CharactersCopyCharacter("Upwards arrow", "\u2191"),
    CharactersCopyCharacter("Won", "\u20A9"),
    CharactersCopyCharacter("Yen", "\u00A5"),
    CharactersCopyCharacter("Zero width space (non-printing)", "\u200B"),
  ];

  List<CharactersCopyCharacter> filteredCharactersList = [];

  @override
  void initState() {
    super.initState();
    charactersList.sort((a, b) => a.name.compareTo(b.name));
    filteredCharactersList = charactersList;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.characterscopy.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.warning_amber_outlined),
                tooltip: t.tools.characterscopy.important,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(t.tools.characterscopy.important),
                          content: Text(
                              t.tools.characterscopy.important_description),
                          actions: [
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
                },
              ),
            ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  // Search bar
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: t.generic.search,
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            filteredCharactersList = charactersList.where((
                                character) {
                              return character.name.toLowerCase().contains(
                                  value.toLowerCase()) ||
                                  character.character.toLowerCase().contains(
                                      value.toLowerCase());
                            }).toList();
                          });
                        },
                      ),
                    ),
                    Column(
                      children: filteredCharactersList.map((character) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))
                            ),
                            tileColor: Theme
                                .of(context)
                                .dividerColor,
                            leading: Text(
                                character.character,
                                style: const TextStyle(fontSize: 30)
                            ),
                            trailing: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.5,
                              child: Text(
                                character.name,
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: character.character));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(t.tools.characterscopy
                                        .copied_to_clipboard),
                                    duration: const Duration(seconds: 1),
                                  )
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )),
        )
    );
  }
}