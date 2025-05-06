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
import 'package:toolbox/pages/credits_page.dart';
import 'package:toolbox/widgets/home_tilecard.dart';


class HomePage extends StatefulWidget {
  final List<dynamic> content;
  final bool isFavoriteFolderShown;
  final bool checkForUpdate;

  const HomePage({ super.key, required this.content, this.isFavoriteFolderShown = false, this.checkForUpdate = true });
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<dynamic> hierarchy = [];
  List<dynamic> hierarchyFiltered = [];
  List<String> favoriteTools = [];
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
    widget.content.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  void filterSearchResults() {
    searchQuery = searchQuery.trim();
    hierarchyFiltered = [];
    if (searchQuery.isNotEmpty) {
      for (var tile in !isRootPage() ? hierarchy : Hierarchy.getFlatHierarchy()) {
        if (tile.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          hierarchyFiltered.add(tile);
        }
      }
    } else {
      hierarchyFiltered = hierarchy;
    }
    setState(() {});
  }

  bool isRootPage() {
    return isFolderView()
        ? widget.content.toSet().containsAll(Hierarchy.hierarchy.where((element) => element.runtimeType == Folder).toSet())
        : widget.content.toSet().containsAll(Hierarchy.getFlatHierarchy().toSet());
  }

  bool isFolderView() {
    return widget.content.toSet().containsAll(Hierarchy.hierarchy);
  }

  void showFavoriteDialog(Tool tool) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tool.name),
          content: Text(favoriteTools.contains(Hierarchy.findToolIdByInstance(tool))
                ? t.homepage.would_you_like_to_remove_this_tool_from_favorites
                : t.homepage.would_you_like_to_add_this_tool_to_favorites),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(t.generic.no),
            ),
            TextButton(
              onPressed: () async {
                String key = Hierarchy.findToolIdByInstance(tool);
                favoriteTools.contains(key)
                    ? await Hierarchy.removeFavoriteTool(key)
                    : await Hierarchy.addFavoriteTool(key);
                if (mounted) {
                  Navigator.pop(this.context);
                }
                refreshFavoritesInContent();
              },
              child: Text(t.generic.yes),
            ),
          ],
        );
      },
    );
  }

  Future<void> refreshFavoritesInContent() async {
    favoriteTools = await Hierarchy.getFavoriteTools();
    if (isFolderView()) {
      List<Tool> favoriteToolsObjects = favoriteTools.map((toolId) => Hierarchy.toolMap[toolId]).toList().whereType<Tool>().toList();
      widget.content.removeWhere((element) => element.runtimeType == Folder && (element as Folder).isFavoriteFolder);
      if (favoriteToolsObjects.isNotEmpty) {
        favoriteToolsObjects.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        if (mounted) {
          widget.content.insert(
              0,
              Folder(
                  t.homepage.favorites,
                  "assets/images/folders/folder_favorite.png",
                  favoriteToolsObjects,
                  isFavoriteFolder: true
              )
          );
        }
      } else {
        widget.content.removeWhere((element) => element.runtimeType == Folder && (element as Folder).isFavoriteFolder);
      }
    } else {
      List<Tool> favoriteToolsObjects = favoriteTools.map((toolId) => Hierarchy.toolMap[toolId]).toList().whereType<Tool>().toList();
      if (widget.isFavoriteFolderShown) {
        widget.content.clear();
      } else {
        favoriteToolsObjects.removeWhere((element) => !widget.content.contains(element));
      }
      favoriteToolsObjects.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
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
    const String versionCheckEndpoint = "https://toolbox.koizeay.com/general/version";
    final String currentVersion = packageInfo.version;
    final http.Response latestVersionResponse = await httpGet(versionCheckEndpoint, {});
    if (latestVersionResponse.statusCode == 200) {
      final String latestVersion = latestVersionResponse.body;
      if (currentVersion != latestVersion && mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.homepage.update_available),
              content: Text(t.homepage.update_available_message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(t.generic.ok),
                ),
              ],
            );
          },
        );
      }
    } else {
      if (kDebugMode) {
        print("Error: ${latestVersionResponse.statusCode}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.generic.app_name),
            actions: !isRootPage() ? [] : [
              IconButton(
                icon: Icon(
                    isFolderView() ? Icons.grid_view : Icons.folder_outlined),
                tooltip: t.homepage.switch_view,
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          HomePage(content: isFolderView()
                              ? Hierarchy.getFlatHierarchy()
                              : Hierarchy.hierarchy,
                            checkForUpdate: false),
                    ),
                  );
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool(SHARED_PREFERENCES_CORE_HOMEPAGE_ISFOLDERVIEW, !isFolderView());
                },
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                tooltip: t.credits.title,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreditsPage()
                    ),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            bottom: false,
            child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                            filterSearchResults();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: isRootPage() && isFolderView()
                              ? t.homepage.search_all_folders
                              : t.generic.search,
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery
                              .of(context)
                              .orientation == Orientation.portrait
                              ? MediaQuery
                              .of(context)
                              .size
                              .width < 600
                              ? 2
                              : 3
                              : 4,
                          childAspectRatio: 2,
                        ),
                        itemCount: hierarchyFiltered.length,
                        itemBuilder: (context, index) {
                          return TileCard(
                              title: hierarchyFiltered[index].name,
                              imageAssetPath: hierarchyFiltered[index].image,
                              isFavorite: (isFolderView() && searchQuery.isEmpty) ? false : favoriteTools.contains(
                                  Hierarchy.toolMap.entries
                                      .firstWhere((entry) => entry.value == hierarchyFiltered[index])
                                      .key),
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      hierarchyFiltered[index].page
                                  ),
                                );
                                refreshFavoritesInContent();
                              },
                              onLongPress: () {
                                if (hierarchyFiltered[index].runtimeType == Tool) {
                                  showFavoriteDialog(hierarchyFiltered[index]);
                                }
                              }
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
          )
      ),
    );
  }
}