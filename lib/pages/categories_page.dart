import 'package:flutter/material.dart';
import 'package:toolbox/hierarchy.dart';
import 'package:toolbox/widgets/home_tilecard.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Hierarchy.hierarchy;
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
        childAspectRatio: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final folder = categories[index];
        return TileCard(
          title: folder.name,
          imageAssetPath: folder.image,
          isFavorite: false, // favorites only for Tools
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => folder.page),
            );
          },
        );
      },
    );
  }
}
