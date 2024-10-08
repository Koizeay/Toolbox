import 'package:flutter/material.dart';
import 'package:toolbox/core/colors.dart';

class TileCard extends StatelessWidget {
  final String title;
  final String imageAssetPath;
  final bool isFavorite;
  final Function() onTap;
  final Function()? onLongPress;

  const TileCard({super.key, required this.title, required this.imageAssetPath, required this.isFavorite, required this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    String themedImageAssetPath = Theme.of(context).brightness == Brightness.light ? imageAssetPath : imageAssetPath.replaceFirst('.png', '_white.png');
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: isFavorite ? CustomColors.getFavoriteCardColor(context) : Theme.of(context).cardTheme.color,
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
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}