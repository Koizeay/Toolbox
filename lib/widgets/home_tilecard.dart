import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final String title;
  final String imageAssetPath;
  final Function() onTap;

  const TileCard({super.key, required this.title, required this.imageAssetPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String themedImageAssetPath = Theme.of(context).brightness == Brightness.light ? imageAssetPath : imageAssetPath.replaceFirst('.png', '_white.png');
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            children: [
              Image.asset(
                themedImageAssetPath,
                opacity: const AlwaysStoppedAnimation(0.8)
              ),
              Text(title, style: const TextStyle(fontSize: 100)),
            ],
          ),
        ),
      ),
    );
  }
}