
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class McServerPing extends StatefulWidget {
  const McServerPing({ super.key });
  @override
  State<McServerPing> createState() => _McServerPing();
}

class _McServerPing extends State<McServerPing> {
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

  TextEditingController ipController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.mc_server_ping.title),
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
                              child: Text(t.tools.mc_server_ping.about_open)
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(t.generic.ok),
                          )
                        ]
                    );
                  },
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : serverOnline
                  ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (serverIconUrl != null)
                      SizedBox(
                          width: 64,
                          height: 64,
                          child: Image.network(serverIconUrl!)
                      ),
                    const SizedBox(height: 4),
                    if (serverHostname != null)
                      Text("$serverHostname", style: const TextStyle(fontSize: 20)),
                    if (serverIp != null)
                      Text("$serverIp", style: const TextStyle(fontSize: 16)),
                    if (serverPort != null)
                      Text("$serverPort", style: const TextStyle(fontSize: 14)),
                    if (serverVersion != null)
                      Text("$serverVersion", style: const TextStyle(fontSize: 12)),
                    if (serverSoftware != null)
                      Text("$serverSoftware", style: const TextStyle(fontSize: 12)),
                    if (serverId != null)
                      Text(t.tools.mc_server_ping.the_server_id_is(id: serverId ?? ""), style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 8),
                    if (serverMotd != null)
                      Text("$serverMotd", style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
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
                        child: Text(t.tools.mc_server_ping.ping_another_server),
                      ),
                    ),
                  ],
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isJavaEdition,
                            onChanged: (value) {
                              setState(() {
                                isJavaEdition = value!;
                              });
                            }
                        ),
                        Text(t.tools.mc_server_ping.java_edition),
                        GestureDetector(
                          onTap: () {
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
                              }
                            );
                          },
                          child: const Text(" [?]", style: TextStyle(fontSize: 10)),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: ipController,
                      decoration: InputDecoration(
                        labelText: t.tools.mc_server_ping.server_ip,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          pingServer();
                        },
                        child: Text(t.tools.mc_server_ping.ping),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}