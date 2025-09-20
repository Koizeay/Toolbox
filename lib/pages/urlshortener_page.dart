import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toolbox/core/colors.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/urlshortener_result.dart';

class UrlShortenerPage extends StatefulWidget {
  const UrlShortenerPage({super.key});

  @override
  State<UrlShortenerPage> createState() => _UrlShortenerPage();
}

class _UrlShortenerPage extends State<UrlShortenerPage> {
  bool isLoading = true;
  bool isServerAvailable = false;

  String serverUrl = "https://jtu.me";
  String serverShortenApiEndpoint = "/_/api/shorten";
  String serverTosEndpoint = "/_/tos";
  String serverStatisticsEndpoint = "/_/statistics";

  UrlShortenerResult? result;

  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    checkConnectionToServer().then((_) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }).onError((error, stackTrace) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  Future<void> checkConnectionToServer() async {
    var response = await httpGet(serverUrl, {});
    if (response.statusCode == 200) {
      isServerAvailable = true;
    }
  }

  Future<void> shortenUrl(String url) async {
    var response =
        await httpPost(serverUrl + serverShortenApiEndpoint, {"url": url})
            .onError((error, stackTrace) {
      return Response("", 500);
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result = UrlShortenerResult(
        shortUrl: json["short_url"] ?? "",
        qrBase64: json["qr_base64"] ?? "",
        shortPath: json["short_path"] ?? "",
        managementPassword: json["management_password"] ?? "",
      );
    } else {
      result = null;
      if (mounted) {
        showOkTextDialog(
          context,
          t.generic.error,
          t.tools.urlshortener.error.failed_to_shorten_url,
        );
      }
    }
  }

  void showShareDialog(String shortUrl, String qrBase64) {
    List<TextButton> actions = [
      TextButton(
        onPressed: () {
          Share.share(
              shortUrl,
              sharePositionOrigin:
              Rect.fromLTWH(MediaQuery.of(context).size.width - 100, 0, 100, 100)
          );
          Navigator.pop(context);
        },
        child: Text(t.tools.urlshortener.url),
      ),
      TextButton(
        onPressed: () {
          var qrXFile = XFile.fromData(base64Decode(qrBase64),
              name: "qr_code.png", mimeType: "image/png");
          Share.shareXFiles(
              [qrXFile],
              sharePositionOrigin:
                  Rect.fromLTWH(MediaQuery.of(context).size.width - 100, 0, 100, 100)
          );
          Navigator.pop(context);
        },
        child: Text(t.tools.urlshortener.qr_code),
      ),
    ];
    showCustomButtonsTextDialog(
      context,
      t.tools.urlshortener.share,
      t.tools.urlshortener.share_dialog_message,
      actions
    );
  }

  void showMoreFeaturesDialog(BuildContext context) {
    List<TextButton> actions = [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(t.generic.cancel),
      ),
      TextButton(
        onPressed: () {
          launchUrlInBrowser(serverUrl);
          Navigator.pop(context);
        },
        child: Text(t.tools.urlshortener.open),
      ),
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.urlshortener.more_features,
        t.tools.urlshortener.more_features_message,
        actions
    );
  }

  void showViewStatisticsDialog(BuildContext context) {
    List<TextButton> actions = [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(t.generic.cancel),
      ),
      TextButton(
        onPressed: () {
          launchUrlInBrowser("$serverUrl$serverStatisticsEndpoint");
          Navigator.pop(context);
        },
        child: Text(t.tools.pastebin.open),
      ),
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.pastebin.view_statistics_of_a_link,
        t.tools.pastebin.view_statistics_of_a_link_message,
        actions
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title:
                Text(t.tools.urlshortener.title),
          ),
          body: SafeArea(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : isServerAvailable
                    ? result != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                          t.tools.urlshortener.your_shortened_url_is,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)
                                      ),
                                      Text(
                                          result?.shortUrl ?? "",
                                          style: const TextStyle(fontStyle: FontStyle.italic)
                                      ),
                                      Image.memory(
                                        base64Decode(result?.qrBase64 ?? ""),
                                        width: 200,
                                        height: 200,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Clipboard.setData(ClipboardData(text: result?.shortUrl ?? ""));
                                              },
                                              icon: const Icon(Icons.copy),
                                              tooltip: t.tools.urlshortener
                                                  .copy_to_clipboard),
                                          const SizedBox(width: 8),
                                          IconButton(
                                              onPressed: () {
                                                showShareDialog(
                                                    result?.shortUrl ?? "",
                                                    result?.qrBase64 ?? ""
                                                );
                                              },
                                              icon: const Icon(Icons.share),
                                              tooltip: t.tools.urlshortener.share
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Divider(),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    t.tools.urlshortener.the_link_id_is,
                                                    style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13)
                                                ),
                                                const SizedBox(width: 4),
                                                GestureDetector(
                                                  onTap: () {
                                                    Clipboard.setData(ClipboardData(text: result?.shortPath ?? ""));
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(t.tools.urlshortener.link_id_copied_to_clipboard)
                                                      ),
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(4),
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                                      color: CustomColors.getLightGreyOnSurface(context),
                                                      child: Text(
                                                          result?.shortPath ?? "",
                                                          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13)
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    t.tools.urlshortener.the_link_password_is,
                                                    style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13)
                                                ),
                                                const SizedBox(width: 4),
                                                GestureDetector(
                                                  onTap: () {
                                                    Clipboard.setData(ClipboardData(text: result?.managementPassword ?? ""));
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(t.tools.urlshortener.link_password_copied_to_clipboard)
                                                      ),
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(4),
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                                      color: CustomColors.getLightGreyOnSurface(context),
                                                      child: Text(
                                                          result?.managementPassword ?? "",
                                                          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13)
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                                t.tools.urlshortener.link_password_hint_text,
                                                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Divider(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: FilledButton(
                                      onPressed: () {
                                        setState(() {
                                          result = null;
                                          urlController.clear();
                                        });
                                      },
                                      child: Text(t.tools.urlshortener
                                          .shorten_another_url),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        TextField(
                                          controller: urlController,
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            labelText: t.tools.urlshortener
                                                .url_to_shorten,
                                            hintText: "https://example.com",
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          t.tools.urlshortener
                                              .by_clicking_you_accept(
                                                  url: "jtu.me"),
                                          style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            launchUrlInBrowser(
                                                "$serverUrl$serverTosEndpoint");
                                          },
                                          child: Text(t.tools.urlshortener
                                              .terms_of_service),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: FilledButton(
                                        onPressed: () async {
                                          if (urlController.text.trim().isEmpty) {
                                            return;
                                          }
                                          setState(() {
                                            result = null;
                                            isLoading = true;
                                          });
                                          shortenUrl(urlController.text.trim())
                                              .then((response) {
                                            if (mounted) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                            }
                                          });
                                        },
                                        child: Text(t.tools.urlshortener.shorten),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showViewStatisticsDialog(context);
                                      },
                                      child: Text(
                                          t.tools.urlshortener.view_statistics_of_a_link,
                                          style: const TextStyle(
                                            fontSize: 13,
                                          )
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showMoreFeaturesDialog(context);
                                      },
                                      child: Text(
                                          t.tools.urlshortener.more_features,
                                          style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 12,
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          )
                    : SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  t.tools.urlshortener.error
                                      .impossible_to_connect_to_the_server,
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  t.tools.urlshortener.error
                                      .impossible_to_connect_to_the_server_message,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
          )),
    );
  }
}
