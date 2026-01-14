import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/hierarchy.dart';
import 'package:toolbox/models/home_folder.dart';
import 'package:toolbox/models/home_tool.dart';
import 'package:toolbox/tools/credits_page.dart';
import 'package:toolbox/widgets/home_tilecard.dart';

class HomePage extends StatefulWidget {
  final List<dynamic> content;
  final bool isFavoriteFolderShown;
  final bool checkForUpdate;

  const HomePage({
    super.key,
    required this.content,
    this.isFavoriteFolderShown = false,
    this.checkForUpdate = true,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> hierarchy = [];
  List<dynamic> hierarchyFiltered = [];
  List<String> favoriteTools = [];
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    initTools();
    sortTools();
    checkForAppUpdate();
    refreshFavoritesInContent();
    hierarchyFiltered = hierarchy;
  }

  void initTools() {
    hierarchy = widget.content;
  }

  void sortTools() {
    widget.content.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  void filterSearchResults() {
    searchQuery = searchQuery.trim();
    hierarchyFiltered = [];
    if (searchQuery.isNotEmpty) {
      for (var tile in !isRootPage
          ? hierarchy
          : Hierarchy.getFlatHierarchy()) {
        if (tile.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          hierarchyFiltered.add(tile);
        }
      }
    } else {
      hierarchyFiltered = hierarchy;
    }
    setState(() {});
  }

  bool get isFolderView =>
      widget.content.toSet().containsAll(Hierarchy.hierarchy);

  bool get isRootPage {
    return isFolderView
        ? widget.content
        .toSet()
        .containsAll(Hierarchy.hierarchy.where((e) => e.runtimeType == Folder).toSet())
        : widget.content.toSet().containsAll(Hierarchy.getFlatHierarchy().toSet());
  }

  void showFavoriteDialog(Tool tool) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        title: Text(tool.name, style: Theme.of(context).textTheme.titleLarge),
        content: Text(
          favoriteTools.contains(Hierarchy.findToolIdByInstance(tool))
              ? t.homepage.would_you_like_to_remove_this_tool_from_favorites
              : t.homepage.would_you_like_to_add_this_tool_to_favorites,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.generic.no),
          ),
          TextButton(
            onPressed: () async {
              String key = Hierarchy.findToolIdByInstance(tool);
              favoriteTools.contains(key)
                  ? await Hierarchy.removeFavoriteTool(key)
                  : await Hierarchy.addFavoriteTool(key);
              if (mounted) Navigator.pop(context);
              refreshFavoritesInContent();
            },
            child: Text(t.generic.yes),
          ),
        ],
      ),
    );
  }

  Future<void> refreshFavoritesInContent() async {
    favoriteTools = await Hierarchy.getFavoriteTools();

    if (isFolderView) {
      List<Tool> favoriteToolsObjects = favoriteTools
          .map((toolId) => Hierarchy.toolMap[toolId])
          .whereType<Tool>()
          .toList();

      widget.content.removeWhere(
              (element) => element.runtimeType == Folder && (element as Folder).isFavoriteFolder);

      if (favoriteToolsObjects.isNotEmpty) {
        favoriteToolsObjects.sort((a, b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        if (mounted) {
          widget.content.insert(
            0,
            Folder(
              t.homepage.favorites,
              "assets/images/folders/folder_favorite.png",
              favoriteToolsObjects,
              isFavoriteFolder: true,
            ),
          );
        }
      }
    } else {
      List<Tool> favoriteToolsObjects = favoriteTools
          .map((toolId) => Hierarchy.toolMap[toolId])
          .whereType<Tool>()
          .toList();

      if (widget.isFavoriteFolderShown) {
        widget.content.clear();
      } else {
        favoriteToolsObjects.removeWhere((element) => !widget.content.contains(element));
      }

      favoriteToolsObjects.sort((a, b) =>
          a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      sortTools();
      widget.content.removeWhere((element) => favoriteToolsObjects.contains(element));
      widget.content.insertAll(0, favoriteToolsObjects);
    }

    if (mounted) {
      setState(() {
        filterSearchResults();
      });
    }
  }

  Future<void> checkForAppUpdate() async {
    if (!widget.checkForUpdate) return;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String osEndpoint = Platform.isAndroid ? "android" : "ios";
    String versionCheckEndpoint =
        "https://toolbox.koizeay.com/general/version/$osEndpoint";
    final String currentVersion = packageInfo.buildNumber;
    final http.Response latestVersionResponse = await httpGet(versionCheckEndpoint, {});

    if (latestVersionResponse.statusCode == 200) {
      final String latestVersion = latestVersionResponse.body;
      int? currentVersionInt = int.tryParse(currentVersion);
      int? latestVersionInt = int.tryParse(latestVersion);
      if (currentVersionInt != null &&
          latestVersionInt != null &&
          currentVersionInt < latestVersionInt &&
          mounted) {
        final colorScheme = Theme.of(context).colorScheme;
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: colorScheme.surface,
            surfaceTintColor: colorScheme.surfaceTint,
            title: Text(t.homepage.update_available,
                style: Theme.of(context).textTheme.titleLarge),
            content: Text(t.homepage.update_available_message,
                style: Theme.of(context).textTheme.bodyMedium),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(t.generic.ok),
              ),
            ],
          ),
        );
      }
    } else if (kDebugMode) {
      print("Error: ${latestVersionResponse.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      filterSearchResults();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: isRootPage && isFolderView
                        ? t.homepage.search_all_folders
                        : t.generic.search,
                    prefixIcon:
                    Icon(Icons.search, color: colorScheme.onSurfaceVariant),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                      tooltip: t.homepage.clear_search,
                      icon: Icon(Icons.clear,
                          color: colorScheme.onSurfaceVariant),
                      onPressed: () {
                        setState(() {
                          searchQuery = "";
                          searchController.clear();
                          filterSearchResults();
                        });
                      },
                    )
                        : null,
                    filled: true,
                    fillColor: colorScheme.surfaceVariant,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? (MediaQuery.of(context).size.width < 600 ? 2 : 3)
                        : 4,
                    childAspectRatio: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: hierarchyFiltered.length,
                  itemBuilder: (context, index) {
                    final item = hierarchyFiltered[index];
                    final isFav = (isFolderView && searchQuery.isEmpty)
                        ? false
                        : favoriteTools.contains(Hierarchy.toolMap.entries
                        .firstWhere((e) => e.value == item)
                        .key);

                    return TileCard(
                      title: item.name,
                      imageAssetPath: item.image,
                      isFavorite: isFav,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => item.page),
                        );
                        refreshFavoritesInContent();
                      },
                      onLongPress: () {
                        if (item.runtimeType == Tool) showFavoriteDialog(item);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
