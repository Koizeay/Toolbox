
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class PasswordGeneratorPage extends StatefulWidget {
  const PasswordGeneratorPage({super.key});

  @override
  State<PasswordGeneratorPage> createState() => _PasswordGeneratorPage();
}

class _PasswordGeneratorPage extends State<PasswordGeneratorPage> {
  final int _passwordMaxLength = 64;

  static const _defaultPasswordLength = 16;
  static const _defaultDigitCount = 4;
  static const _defaultSpecialCharactersCount = 2;

  TextEditingController passwordLengthController = TextEditingController(text: _defaultPasswordLength.toString());
  TextEditingController digitCountController = TextEditingController(text: _defaultDigitCount.toString());
  TextEditingController specialCharactersCountController = TextEditingController(text: _defaultSpecialCharactersCount.toString());

  String? generatedPassword;

  String generatePassword() {
    int passwordLength = int.tryParse(passwordLengthController.text) ?? _defaultPasswordLength;
    int digitCount = int.tryParse(digitCountController.text) ?? _defaultDigitCount;
    int specialCharactersCount = int.tryParse(specialCharactersCountController.text) ?? _defaultSpecialCharactersCount;

    final random = Random.secure();
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const digits = '0123456789';
    const specialCharacters = '!@#\$%^&*-_=+.:?';

    String password = '';

    if (passwordLength <= 0) {
      showOkTextDialog(
          context,
          t.generic.error,
          t.tools.passwordgenerator.error.password_length_must_be_greater_than_0
      );
      return '';
    }

    if (passwordLength > _passwordMaxLength) {
      showOkTextDialog(
          context,
          t.generic.error,
          t.tools.passwordgenerator.error.password_length_cannot_exceed_x_characters(maxLength: _passwordMaxLength)
      );
      return '';
    }

    if (passwordLength < digitCount + specialCharactersCount) {
      showOkTextDialog(
          context,
          t.generic.error,
          t.tools.passwordgenerator.error.password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters
      );
      return '';
    }

    for (int i = 0; i < digitCount; i++) {
      password += digits[random.nextInt(digits.length)];
    }

    for (int i = 0; i < specialCharactersCount; i++) {
      password += specialCharacters[random.nextInt(specialCharacters.length)];
    }

    int remainingLength = passwordLength - digitCount - specialCharactersCount;
    for (int i = 0; i < remainingLength; i++) {
      password += letters[random.nextInt(letters.length)];
    }

    return String.fromCharCodes(password.runes.toList()..shuffle(random));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.tools.passwordgenerator.title),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: passwordLengthController,
                        decoration: InputDecoration(
                          labelText: t.tools.passwordgenerator.password_length,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          setState(() {
                            passwordLengthController.text = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: digitCountController,
                        decoration: InputDecoration(
                          labelText: t.tools.passwordgenerator.number_of_digits,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          setState(() {
                            digitCountController.text = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: specialCharactersCountController,
                        decoration: InputDecoration(
                          labelText: t.tools.passwordgenerator.number_of_special_characters,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          setState(() {
                            specialCharactersCountController.text = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          child: Text(t.tools.passwordgenerator.generate_password),
                          onPressed: () {
                            setState(() {
                              generatedPassword = generatePassword();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (generatedPassword != null && generatedPassword!.isNotEmpty)
                        ...[
                          SizedBox(
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: generatedPassword ?? ''));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(t.tools.passwordgenerator.password_copied_to_clipboard)),
                                );
                              },
                              child: Text(
                                generatedPassword ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              t.tools.passwordgenerator.tap_to_copy,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ]
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}