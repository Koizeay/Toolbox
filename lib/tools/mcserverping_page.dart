
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class McServerPingPage extends StatefulWidget {
  const McServerPingPage({ super.key });
  @override
  State<McServerPingPage> createState() => _McServerPing();
}

class _McServerPing extends State<McServerPingPage> {
  late SharedPreferences prefs;

  String apiJavaEndpoint = "https://api.mcsrvstat.us/3/";
  String apiBedrockEndpoint = "https://api.mcsrvstat.us/bedrock/3/";
  String apiIconEndpoint = "https://api.mcsrvstat.us/icon/";

  bool isLoading = false;

  bool isJavaEdition = true;

  bool serverOnline = false;
  String? serverIp;
  String? serverPort;
  String? serverHostname;
  String? serverMotd;
  String? serverVersion;
  String? serverSoftware;
  String? serverId;
  String? serverIconUrl;
  int? serverPlayersOnline;
  int? serverPlayersMax;
  List<String> serverPlayersNameList = [];

  List<String> favoriteServers = [];

  TextEditingController ipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      if (mounted) {
        setState(() {
          favoriteServers = prefs.getStringList(SHARED_PREFERENCES_TOOL_MCSERVERPING_FAVORITES) ?? [];
          favoriteServers.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
        });
      }
    });
  }

  Future<void> pingServer() async {
    setState(() {
      isLoading = true;
    });
    String ipInput = ipController.text;
    if (ipInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.tools.mc_server_ping.error.please_enter_a_server_ip))
      );
      setState(() {
        isLoading = false;
      });
      return;
    }
    String endpoint = isJavaEdition ? apiJavaEndpoint : apiBedrockEndpoint;
    endpoint += ipInput;

    var response = await httpGet(endpoint, {}).onError(
            (error, stackTrace) => Response("error", 500));
    try {
      Map<String, dynamic> jsonResponse = {};
      jsonResponse = jsonDecode(response.body);
      if (jsonResponse["online"] != null && jsonResponse["online"] == true) {
        try {
          serverOnline = true;
          serverIp = jsonResponse["ip"].toString();
          serverPort = jsonResponse["port"].toString();
          serverHostname = jsonResponse["hostname"] ?? "";
          var tempServerMotd = "";
          jsonResponse["motd"]["clean"].forEach((element) {
            tempServerMotd += "${element.toString().trim()}\n";
          });
          serverMotd = tempServerMotd.trim();
          serverVersion = jsonResponse["version"];
          serverSoftware = jsonResponse["software"];
          serverId = jsonResponse["serverid"];
          serverIconUrl = apiIconEndpoint + ipInput.toString();
          try {
            serverPlayersOnline = jsonResponse["players"]["online"];
            serverPlayersMax = jsonResponse["players"]["max"];
          } catch (e) {
            serverPlayersOnline = null;
            serverPlayersMax = null;
          }
          serverPlayersNameList = [];
          if (jsonResponse["players"]["list"] != null) {
            jsonResponse["players"]["list"].forEach((element) {
              serverPlayersNameList.add(element["name"].toString());
            });
          }
          if (mounted) {
            setState(() {});
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.tools.mc_server_ping.error.server_offline_or_does_not_exist))
          );
        }
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.tools.mc_server_ping.error.please_check_your_internet_connection)
            )
        );
      }
      setState(() {
        isLoading = false;
      });
      return;
    }
  }

  void addToFavorites(String ip) {
    if (favoriteServers.contains(ip)) {
      return;
    }
    favoriteServers.add(ip);
    prefs.setStringList(SHARED_PREFERENCES_TOOL_MCSERVERPING_FAVORITES, favoriteServers);
    showOkTextDialog(
        context,
        t.tools.mc_server_ping.added_to_favorites,
        t.tools.mc_server_ping.added_to_favorites_description
    );
    favoriteServers.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }

  void removeFromFavorites(String ip) {
    if (!favoriteServers.contains(ip)) {
      return;
    }
    favoriteServers.remove(ip);
    prefs.setStringList(SHARED_PREFERENCES_TOOL_MCSERVERPING_FAVORITES, favoriteServers);
    showOkTextDialog(
        context,
        t.tools.mc_server_ping.removed_from_favorites,
        t.tools.mc_server_ping.removed_from_favorites_description
    );
  }

  Future<void> showConfirmRemoveFavoriteDialog(String ip) async {
    List<TextButton> buttons = [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          removeFromFavorites(ip);
          if (mounted) {
            setState(() {});
          }
        },
        child: Text(t.generic.yes),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(t.generic.no),
      )
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.mc_server_ping.remove_from_favorites,
        t.tools.mc_server_ping.remove_from_favorites_description,
        buttons
    );
  }

  bool isFavorite(String ip) {
    return favoriteServers.contains(ip);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.mc_server_ping.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            Tooltip(
              message: t.tools.mc_server_ping.api_used,
              child: IconButton(
                icon: const Icon(Icons.copyright),
                onPressed: () {
                  showCustomButtonsTextDialog(
                    context,
                    t.tools.mc_server_ping.about_the_api,
                    t.tools.mc_server_ping.about_the_api_description(source: "Minecraft Server Status API", website: "mcsrvstat.us"),
                    [
                      TextButton(
                        onPressed: () {
                          launchUrlInBrowser("https://api.mcsrvstat.us/");
                        },
                        child: Text(t.tools.mc_server_ping.about_open),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(t.generic.ok),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
        body: SafeArea(
          child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : serverOnline
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Server Info Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (serverIconUrl != null)
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(serverIconUrl!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if (serverHostname != null)
                                          Text(
                                            serverHostname!,
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        const SizedBox(height: 4),
                                        if (serverIp != null)
                                          Row(
                                            children: [
                                              Icon(Icons.dns, size: 16, color: colorScheme.onSurfaceVariant),
                                              const SizedBox(width: 4),
                                              Text(
                                                serverIp!,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  color: colorScheme.onSurfaceVariant,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (serverPort != null)
                                          Row(
                                            children: [
                                              Icon(Icons.settings_ethernet, size: 16, color: colorScheme.onSurfaceVariant),
                                              const SizedBox(width: 4),
                                              Text(
                                                serverPort!,
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  color: colorScheme.onSurfaceVariant,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (serverMotd != null) ...[
                                const SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceVariant,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    serverMotd!,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Server Details Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.info_outline, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Details",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              if (serverVersion != null)
                                _buildDetailRow(context, colorScheme, Icons.extension, "Version", serverVersion!),
                              if (serverSoftware != null) ...[
                                const SizedBox(height: 8),
                                _buildDetailRow(context, colorScheme, Icons.code, "Software", serverSoftware!),
                              ],
                              if (serverId != null) ...[
                                const SizedBox(height: 8),
                                _buildDetailRow(context, colorScheme, Icons.fingerprint, "Server ID", serverId!),
                              ],
                              if (serverPlayersOnline != null && serverPlayersMax != null) ...[
                                const SizedBox(height: 8),
                                _buildPlayersRow(context, colorScheme),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Action Buttons
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () {
                            if (isFavorite(ipController.text)) {
                              removeFromFavorites(ipController.text);
                            } else {
                              addToFavorites(ipController.text);
                            }
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          icon: Icon(isFavorite(ipController.text) ? Icons.star : Icons.star_border),
                          label: Text(
                            isFavorite(ipController.text)
                              ? t.tools.mc_server_ping.remove_from_favorites
                              : t.tools.mc_server_ping.add_to_favorites
                          ),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              serverOnline = false;
                              serverIp = null;
                              serverPort = null;
                              serverHostname = null;
                              serverMotd = null;
                              serverVersion = null;
                              serverSoftware = null;
                              serverId = null;
                              serverIconUrl = null;
                              ipController.clear();
                              isJavaEdition = true;
                            });
                          },
                          icon: const Icon(Icons.refresh),
                          label: Text(t.tools.mc_server_ping.ping_another_server),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Input Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.router, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Server Info",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: ipController,
                                decoration: InputDecoration(
                                  labelText: t.tools.mc_server_ping.server_ip,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.storage, color: colorScheme.onSurfaceVariant),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceVariant.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: isJavaEdition,
                                      onChanged: (value) {
                                        setState(() {
                                          isJavaEdition = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        t.tools.mc_server_ping.java_edition,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info_outline, size: 20, color: colorScheme.primary),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(t.tools.mc_server_ping.information_java),
                                              content: Text(t.tools.mc_server_ping.information_java_description),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(t.generic.ok),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Ping Button
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () {
                            pingServer();
                          },
                          icon: const Icon(Icons.radar),
                          label: Text(t.tools.mc_server_ping.ping),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      if (favoriteServers.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        // Favorites Card
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star, color: colorScheme.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Favorites",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ...favoriteServers.map((favorite) => Card(
                                  elevation: 0,
                                  color: colorScheme.surfaceVariant,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  child: ListTile(
                                    title: Text(favorite),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      tooltip: t.tools.mc_server_ping.remove_from_favorites,
                                      onPressed: () async {
                                        await showConfirmRemoveFavoriteDialog(favorite);
                                        if (mounted) {
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    onTap: () {
                                      ipController.text = favorite;
                                      pingServer();
                                    },
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, ColorScheme colorScheme, IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayersRow(BuildContext context, ColorScheme colorScheme) {
    bool hasPlayers = (serverPlayersOnline ?? 0) > 0;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: hasPlayers ? colorScheme.primaryContainer : colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.people,
            size: 20,
            color: hasPlayers ? colorScheme.onPrimaryContainer : colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              t.tools.mc_server_ping.x_y_players_online(
                playersOnline: serverPlayersOnline.toString(),
                playersMax: serverPlayersMax.toString(),
              ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: hasPlayers ? colorScheme.onPrimaryContainer : colorScheme.onErrorContainer,
              ),
            ),
          ),
          if (hasPlayers && serverPlayersNameList.isNotEmpty)
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: colorScheme.onPrimaryContainer,
              ),
              onPressed: () {
                showOkTextDialog(
                  context,
                  t.tools.mc_server_ping.online_players,
                  serverPlayersNameList.join(", "),
                );
              },
            ),
        ],
      ),
    );
  }
}