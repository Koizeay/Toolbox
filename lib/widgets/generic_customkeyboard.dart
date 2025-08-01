import 'package:flutter/material.dart';

class GenericCustomKeyboard extends StatelessWidget {
  final List<String> keys;
  final Function(String) onKeyTap;
  final bool Function(String) isKeyEnabled;

  static const String noButton = 'nobutton';
  static const String backspaceButton = 'backspace';
  static const String clearButton = 'clear';

  const GenericCustomKeyboard({
    super.key,
    required this.keys,
    required this.onKeyTap,
    required this.isKeyEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        if (keys[index] == noButton) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: FilledButton(
            onPressed: isKeyEnabled(keys[index]) ? () => onKeyTap(keys[index]) : null,
            child: FittedBox(
              fit: BoxFit.contain,
              child: _buildKeyChild(keys[index]),
            ),
          ),
        );
      },
    );
  }

  Widget _buildKeyChild(String key) {
    switch (key) {
      case backspaceButton:
        return const Icon(Icons.backspace);
      case clearButton:
        return const Icon(Icons.clear);
      default:
        return Text(key);
    }
  }
}