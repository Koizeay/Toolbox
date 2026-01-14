import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final String title;
  final String imageAssetPath;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const TileCard({
    super.key,
    required this.title,
    required this.imageAssetPath,
    required this.isFavorite,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themedImageAssetPath =
    isDark ? imageAssetPath.replaceFirst('.png', '_white.png') : imageAssetPath;

    return Card(
      elevation: 3,
      surfaceTintColor: isFavorite ? colorScheme.primaryContainer : colorScheme.surfaceTint,
      shadowColor: colorScheme.shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  themedImageAssetPath,
                  fit: BoxFit.contain,
                  opacity: const AlwaysStoppedAnimation(0.95),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}