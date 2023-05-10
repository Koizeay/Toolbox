import 'package:flutter/material.dart';

class ToolCard extends StatelessWidget {
  final String title;
  final String imageAssetPath;
  final Function() onTap;

  const ToolCard({Key? key, required this.title, required this.imageAssetPath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            children: [
              Image.asset(
                imageAssetPath,
              ),
              Text(title, style: const TextStyle(fontSize: 100)),
            ],
          ),
        ),
      ),
    );
  }
}