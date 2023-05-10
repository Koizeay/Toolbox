// Note: This is a template for creating new tools

import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class ToolTemplate extends StatefulWidget {
  const ToolTemplate({ Key? key }) : super(key: key);
  @override
  State<ToolTemplate> createState() => _ToolTemplate();
}

class _ToolTemplate extends State<ToolTemplate> {
  @override
  void initState() {
    // TODO: Add any initialization code here or remove this method
    super.initState();
  }

  @override
  void dispose() {
    // TODO: Add any cleanup code here or remove this method
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TODO: Replace this with the app name + tool's name
          title: Text("${t.generic.app_name} - REPLACE THIS WITH THE TRANSLATED TOOL NAME"),
        ),
        body: SafeArea(
          // TODO: Replace this with the tool's page content
          child: Container(),
        )
    );
  }
}