import 'package:flutter/material.dart';
import 'package:toolbox/tools/home_page.dart';

class FolderPage extends StatelessWidget {
  final String title;
  final List<dynamic> content;

  const FolderPage({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      body: HomePage(content: content, checkForUpdate: false),
    );
  }
}
