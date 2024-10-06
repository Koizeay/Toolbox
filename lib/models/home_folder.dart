import 'dart:core';
import 'package:flutter/material.dart';
import 'package:toolbox/models/home_tool.dart';
import 'package:toolbox/pages/home_page.dart';

class Folder {
  String name;
  String image;
  List<Tool?> content;
  late Widget page;

  Folder(this.name, this.image, this.content) {
    content.removeWhere((tool) => tool == null);
    page = HomePage(content: content);
  }
}
