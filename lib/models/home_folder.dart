import 'dart:core';
import 'package:flutter/material.dart';
import 'package:toolbox/pages/home_page.dart';

class Folder {
  String name;
  String image;
  List<dynamic> content;
  late Widget page;

  Folder(this.name, this.image, this.content) {
    page = HomePage(content: content);
  }
}
