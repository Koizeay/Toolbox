
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.passwordgenerator.title),
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
                            Icon(Icons.settings, color: colorScheme.primary),
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
                        TextField(
                          controller: passwordLengthController,
                          decoration: InputDecoration(
                            labelText: t.tools.passwordgenerator.password_length,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.straighten, color: colorScheme.onSurfaceVariant),
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
                        const SizedBox(height: 12),
                        TextField(
                          controller: digitCountController,
                          decoration: InputDecoration(
                            labelText: t.tools.passwordgenerator.number_of_digits,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.pin, color: colorScheme.onSurfaceVariant),
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
                        const SizedBox(height: 12),
                        TextField(
                          controller: specialCharactersCountController,
                          decoration: InputDecoration(
                            labelText: t.tools.passwordgenerator.number_of_special_characters,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.tag, color: colorScheme.onSurfaceVariant),
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Generate Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.vpn_key),
                    label: Text(t.tools.passwordgenerator.generate_password),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        generatedPassword = generatePassword();
                      });
                    },
                  ),
                ),
                if (generatedPassword != null && generatedPassword!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  // Password Display Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: generatedPassword ?? ''));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.tools.passwordgenerator.password_copied_to_clipboard)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.lock, color: colorScheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  "Generated Password",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SelectableText(
                                generatedPassword ?? '',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'monospace',
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.content_copy,
                                  size: 16,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  t.tools.passwordgenerator.tap_to_copy,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}