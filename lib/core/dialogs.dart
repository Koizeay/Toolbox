import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

void showOkTextDialog(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
        );
      }
  );
}

void showCustomActionOkTextDialog(BuildContext context, String title, String message, Function() buttonAction) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
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

void showCustomButtonsTextDialog(BuildContext context, String title, String message, List<TextButton> buttons) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: SingleChildScrollView(child: Text(title)),
            content: Text(message),
            actions: buttons,
          ),
        );
      }
  );
}