import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/hierarchy.dart';
import 'package:toolbox/pages/credits_page.dart';
import 'package:toolbox/widgets/home_tilecard.dart';


class HomePage extends StatefulWidget {
  final List<dynamic> content;

  const HomePage({ super.key, required this.content });
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<dynamic> hierarchy = [];
  List<dynamic> hierarchyFiltered = [];

  @override
  void initState() {
    super.initState();
    initTools();
    sortTools();
    hierarchyFiltered = hierarchy;
  }

  void initTools() {
    hierarchy = widget.content;
  }

  void sortTools() {
    hierarchy.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  void filterSearchResults(String query) {
    hierarchyFiltered = [];
    if (query.isNotEmpty) {
      for (var tile in hasPreviousPage() ? hierarchy : Hierarchy.getFlatHierarchy()) {
        if (tile.name.toLowerCase().contains(query.toLowerCase())) {
          hierarchyFiltered.add(tile);
        }
      }
    } else {
      hierarchyFiltered = hierarchy;
    }
    setState(() {});
  }

  bool hasPreviousPage() {
    return Navigator.canPop(context);
  }

  bool isFolderView() {
    return widget.content == Hierarchy.hierarchy;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.generic.app_name),
            actions: hasPreviousPage() ? [] : [
              IconButton(
                icon: Icon(
                    isFolderView() ? Icons.grid_view : Icons.folder_outlined),
                tooltip: t.homepage.switch_view,
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool(SHARED_PREFERENCES_CORE_HOMEPAGE_ISFOLDERVIEW, !isFolderView());
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          HomePage(content: isFolderView() ? Hierarchy
                              .getFlatHierarchy() : Hierarchy.hierarchy),
                    ),
                  );
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
            child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        decoration: InputDecoration(
                          labelText: hasPreviousPage() ? t.generic.search : t
                              .homepage.search_all_folders,
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      hierarchyFiltered[index].page
                                  ),
                                );
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