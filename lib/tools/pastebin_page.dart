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
import 'package:toolbox/models/pastebin_result.dart';

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
  String serverStatisticsEndpoint = "/_/statistics";

  PastebinResult? result;

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
      result = PastebinResult(
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.pastebin.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : isServerAvailable
                  ? result != null
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // Result Card
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check_circle, color: colorScheme.primary),
                                          const SizedBox(width: 8),
                                          Text(
                                            t.tools.pastebin.your_short_link_is,
                                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: colorScheme.primaryContainer,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SelectableText(
                                          result?.shortUrl ?? "",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Image.memory(
                                          base64Decode(result?.qrBase64 ?? ""),
                                          width: 200,
                                          height: 200,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: FilledButton.icon(
                                              icon: const Icon(Icons.content_copy),
                                              label: const Text("Copy"),
                                              style: FilledButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                              onPressed: () {
                                                Clipboard.setData(ClipboardData(text: result?.shortUrl ?? ""));
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text(t.tools.pastebin.copied_to_clipboard)),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: OutlinedButton.icon(
                                              icon: const Icon(Icons.share),
                                              label: const Text("Share"),
                                              style: OutlinedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                              onPressed: () {
                                                showShareDialog(result?.shortUrl ?? "", result?.qrBase64 ?? "");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Link Management Card
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
                                          Icon(Icons.admin_panel_settings, color: colorScheme.primary),
                                          const SizedBox(width: 8),
                                          Text(
                                            "Management Info",
                                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(text: result?.shortPath ?? ""));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(t.tools.pastebin.link_id_copied_to_clipboard)),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: colorScheme.surfaceVariant,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                t.tools.pastebin.the_link_id_is,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              Text(
                                                result?.shortPath ?? "",
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'monospace',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(text: result?.managementPassword ?? ""));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(t.tools.pastebin.link_password_copied_to_clipboard)),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: colorScheme.surfaceVariant,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                t.tools.pastebin.the_link_password_is,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              Text(
                                                result?.managementPassword ?? "",
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'monospace',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: colorScheme.surfaceVariant.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.info_outline, size: 16, color: colorScheme.onSurfaceVariant),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                t.tools.pastebin.link_password_hint_text,
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  color: colorScheme.onSurfaceVariant,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton.icon(
                                  icon: const Icon(Icons.add),
                                  label: Text(t.tools.pastebin.paste_another_text),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: colorScheme.secondary,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      result = null;
                                      textPasteController.clear();
                                    });
                                  },
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
                                          Icon(Icons.content_paste, color: colorScheme.primary),
                                          const SizedBox(width: 8),
                                          Text(
                                            t.tools.pastebin.text_to_paste,
                                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      TextField(
                                        controller: textPasteController,
                                        maxLines: 10,
                                        minLines: 5,
                                        maxLength: maxPasteLength,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: colorScheme.surfaceVariant,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: "${t.tools.pastebin.text_paste_field_hint}...",
                                          counterText: "",
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: colorScheme.surfaceVariant.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.info_outline, size: 16, color: colorScheme.onSurfaceVariant),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Text(
                                                    t.tools.pastebin.by_clicking_you_accept(url: "jtu.me"),
                                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                      color: colorScheme.onSurfaceVariant,
                                                      fontStyle: FontStyle.italic,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                launchUrlInBrowser("$serverUrl$serverTosEndpoint");
                                              },
                                              child: Text(t.tools.pastebin.terms_of_service),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton.icon(
                                  icon: const Icon(Icons.send),
                                  label: Text(t.tools.pastebin.send),
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (textPasteController.text.trim().isEmpty) {
                                      return;
                                    }
                                    setState(() {
                                      result = null;
                                      isLoading = true;
                                    });
                                    sendText(textPasteController.text.trim()).then((response) {
                                      if (mounted) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                    icon: const Icon(Icons.bar_chart, size: 18),
                                    label: Text(t.tools.pastebin.view_statistics_of_a_link),
                                    onPressed: () {
                                      showViewStatisticsDialog(context);
                                    },
                                  ),
                                ],
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.more_horiz, size: 18),
                                label: Text(t.tools.pastebin.more_features),
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontStyle: FontStyle.italic),
                                ),
                                onPressed: () {
                                  showMoreFeaturesDialog(context);
                                },
                              ),
                            ],
                          ),
                        )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.cloud_off,
                                  size: 64,
                                  color: colorScheme.error,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  t.tools.pastebin.error.impossible_to_connect_to_the_server,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.error,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  t.tools.pastebin.error.impossible_to_connect_to_the_server_message,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}