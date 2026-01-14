import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/tools/home_page.dart';
import 'package:toolbox/pages/categories_page.dart';
import 'package:toolbox/tools/credits_page.dart';
import 'package:toolbox/widgets/main_banner_ad_widget.dart';

class MainShellPage extends StatefulWidget {
  final List<dynamic> toolsContent;

  const MainShellPage({super.key, required this.toolsContent});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Pages for bottom nav
  List<Widget> get _pages => [
    HomePage(content: widget.toolsContent), // Tools tab
    const CategoriesPage(), // Categories tab
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("Toolbox"),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surfaceTint,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreditsPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Platform.isAndroid) const MainBannerAd(),
          NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: onTabSelected,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.build_outlined),
                label: t.generic.tools,
              ),
              NavigationDestination(
                icon: const Icon(Icons.category_outlined),
                label: t.generic.categories,
              ),
            ],
          )
        ],
      ),
    );
  }
}
