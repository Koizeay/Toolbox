import 'dart:core';
import 'package:flutter/material.dart';
import 'package:toolbox/models/home_tool.dart';
import 'package:toolbox/pages/home_page.dart';

class Folder {
  String name;
  String image;
  bool isFavoriteFolder = false;
  List<Tool?> content;
  late Widget page;

  Folder(this.name, this.image, this.content, {this.isFavoriteFolder = false}) {
    content.removeWhere((tool) => tool == null);
    page = isFavoriteFolder ? HomePage(content: content, isFavoriteFolderShown: true) : HomePage(content: content);
  }
}
