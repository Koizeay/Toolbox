import 'package:flutter/material.dart';

void showOkTextDialog (BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK")
            )
          ],
        );
      }
  );
}

void showCustomActionOkTextDialog (BuildContext context, String title, String message, Function() buttonAction) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  buttonAction();
                },
                child: const Text("OK")
            )
          ],
        );
      }
  );
}