import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

void showOkTextDialog(BuildContext context, String title, String message, {bool barrierDismissible = true}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(child: Text(message)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(t.generic.ok)
              )
            ],
          ),
        );
      }
  );
}

void showCustomActionOkTextDialog(BuildContext context, String title, String message, Function() buttonAction, {bool barrierDismissible = true}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(child: Text(message)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    buttonAction();
                  },
                  child: Text(t.generic.ok)
              )
            ],
          ),
        );
      }
  );
}

void showCustomButtonsTextDialog(BuildContext context, String title, String message, List<TextButton> buttons, {bool barrierDismissible = true}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: AlertDialog(
            title: SingleChildScrollView(child: Text(title)),
            content: Text(message),
            actions: buttons,
          ),
        );
      }
  );
}