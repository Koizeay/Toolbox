import 'package:flutter/material.dart';

class CustomColors {
  static const Color favoriteCardColorLight = Color(0xffdcdcdc);
  static const Color favoriteCardColorDark = Color(0xff171717);

  static getFavoriteCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? favoriteCardColorLight
        : favoriteCardColorDark;
  }
}