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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: Image(
                image: AssetImage(themedImageAssetPath),
                opacity: const AlwaysStoppedAnimation(0.8),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}