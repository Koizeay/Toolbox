import 'package:flutter/material.dart';

class CustomColors {
  static const Color favoriteCardColorLight = Color(0xffdcdcdc);
  static const Color favoriteCardColorDark = Color(0xff171717);

  static const Color lightGreyOnSurfaceLight = Color(0xffbfbfbf);
  static const Color lightGreyOnSurfaceDark = Color(0xff606060);

  static getFavoriteCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? favoriteCardColorLight
        : favoriteCardColorDark;
  }

  static getLightGreyOnSurface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightGreyOnSurfaceLight
        : lightGreyOnSurfaceDark;
  }
}