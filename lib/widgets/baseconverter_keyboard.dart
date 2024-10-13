import 'package:flutter/material.dart';
import 'package:toolbox/widgets/generic_customkeyboard.dart';

class BaseConverterKeyboard extends StatelessWidget {
  final String inputMode;
  final Function(String) onKeyTap;

  const BaseConverterKeyboard({
    super.key,
    required this.inputMode,
    required this.onKeyTap,
  });

  List<String> _getKeysForMode() {
    return [
      '7', '8', '9', 'A', 'B',
      '4', '5', '6', 'C', 'D',
      '1', '2', '3', 'E', 'F',
      '0', GenericCustomKeyboard.noButton, GenericCustomKeyboard.noButton,
      GenericCustomKeyboard.backspaceButton, GenericCustomKeyboard.clearButton
    ];
  }

  bool _isKeyEnabled(String key) {
    switch (inputMode) {
      case 'BIN':
        return ['0', '1', 'backspace', 'clear'].contains(key);
      case 'OCT':
        return ['0', '1', '2', '3', '4', '5', '6', '7', 'backspace', 'clear'].contains(key);
      case 'DEC':
        return ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'backspace', 'clear'].contains(key);
      case 'HEX':
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenericCustomKeyboard(
      keys: _getKeysForMode(),
      onKeyTap: onKeyTap,
      isKeyEnabled: _isKeyEnabled,
    );
  }
}