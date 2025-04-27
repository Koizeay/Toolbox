import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class PastebinPage extends StatefulWidget {
  const PastebinPage({super.key});

  @override
  State<PastebinPage> createState() => _PastebinPage();
}

class _PastebinPage extends State<PastebinPage> {
  static const int maxPasteLength = 100000;

  bool isLoading = true;
  bool isServerAvailable = false;

  String serverUrl = "https://jtu.me";
  String serverPasteApiEndpoint = "/_/api/paste";
  String serverTosEndpoint = "/_/tos";

  String? shortUrl;
  String? qrBase64;

  TextEditingController textPasteController = TextEditingController();

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

  Future<void> sendText(String text) async {
    var response =
    await httpPost(serverUrl + serverPasteApiEndpoint, {"content": text})
        .onError((error, stackTrace) {
      return Response("", 500);
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      shortUrl = json["short_url"];
      qrBase64 = json["qr_base64"];
    } else {
      shortUrl = null;
      qrBase64 = null;
      if (mounted) {
        showOkTextDialog(
          context,
          t.generic.error,
          t.tools.pastebin.error.failed_to_obtain_short_link,
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
              Rect.fromLTWH(MediaQuery
                  .of(context)
                  .size
                  .width - 100, 0, 100, 100)
          );
          Navigator.pop(context);
        },
        child: Text(t.tools.pastebin.url),
      ),
      TextButton(
        onPressed: () {
          var qrXFile = XFile.fromData(
              base64Decode(qrBase64),
              name: "qr_code.png", mimeType: "image/png"
          );
          Share.shareXFiles(
              [qrXFile],
              sharePositionOrigin: Rect.fromLTWH(MediaQuery
                  .of(context)
                  .size
                  .width - 100, 0, 100, 100)
          );
          Navigator.pop(context);
        },
        child: Text(t.tools.pastebin.qr_code),
      ),
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.pastebin.share,
        t.tools.pastebin.share_dialog_message,
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
        child: Text(t.tools.pastebin.open),
      ),
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.pastebin.more_features,
        t.tools.pastebin.more_features_message,
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
            Text(t.tools.pastebin.title),
          ),
          body: SafeArea(
            child: isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : isServerAvailable
                ? shortUrl != null && qrBase64 != null
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                            t.tools.pastebin.your_short_link_is,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                            shortUrl ?? "",
                            style: const TextStyle(fontStyle: FontStyle.italic)
                        ),
                        Image.memory(
                          base64Decode(qrBase64 ?? ""),
                          width: 200,
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: shortUrl ?? "")
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(t.tools.pastebin.copied_to_clipboard),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.copy),
                                tooltip: t.tools.pastebin.copy_to_clipboard),
                            const SizedBox(width: 8),
                            IconButton(
                                onPressed: () {
                                  showShareDialog(shortUrl ?? "",
                                      qrBase64 ?? "");
                                },
                                icon: const Icon(Icons.share),
                                tooltip:
                                t.tools.pastebin.share
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          setState(() {
                            shortUrl = null;
                            qrBase64 = null;
                            textPasteController.clear();
                          });
                        },
                        child: Text(t.tools.pastebin.paste_another_text),
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
                            controller: textPasteController,
                            maxLines: 10,
                            minLines: 1,
                            maxLength: maxPasteLength,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: t.tools.pastebin.text_to_paste,
                              hintText: "${t.tools.pastebin.text_paste_field_hint}...",
                              counterText: ""
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t.tools.pastebin.by_clicking_you_accept(url: "jtu.me"),
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlInBrowser("$serverUrl$serverTosEndpoint");
                            },
                            child: Text(t.tools.pastebin.terms_of_service),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () async {
                            if (textPasteController.text
                                .trim()
                                .isEmpty) {
                              return;
                            }
                            setState(() {
                              shortUrl = null;
                              qrBase64 = null;
                              isLoading = true;
                            });
                            sendText(textPasteController.text.trim())
                                .then((response) {
                              if (mounted) {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            });
                          },
                          child: Text(t.tools.pastebin.send),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showMoreFeaturesDialog(context);
                        },
                        child: Text(
                            t.tools.pastebin.more_features,
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
                        t.tools.pastebin.error.impossible_to_connect_to_the_server,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t.tools.pastebin.error.impossible_to_connect_to_the_server_message,
                        style: const TextStyle(fontStyle: FontStyle.italic),
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