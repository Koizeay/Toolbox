import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HttpRequestPage extends StatefulWidget {
  const HttpRequestPage({ super.key });
  @override
  State<HttpRequestPage> createState() => _HttpRequestPage();
}

class _HttpRequestPage extends State<HttpRequestPage> {
  bool isLoading = false;
  bool renderHtml = false;
  bool htmlWebViewLoaded = io.Platform.isAndroid;

  bool allowBadCertificates = false;
  TextEditingController methodController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController headersController = TextEditingController();

  UniqueKey webViewKey = UniqueKey();

  WebViewController webViewController = WebViewController();

  List<String> methods = [
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH",
    "HEAD",
    "OPTIONS",
    "CONNECT",
    "TRACE",
    "..."
  ];

  String _method = "GET";

  String responseStatusCode = "";
  String responseHeaders = "";
  String responseBody = "";

  @override
  void initState() {
    super.initState();
    setWebViewSettings();
  }

  void resetWebView() {
    htmlWebViewLoaded = io.Platform.isAndroid;
    webViewController.clearCache();
    webViewController.clearLocalStorage();
    webViewController.loadRequest(Uri.parse("about:blank"));
  }

  void setWebViewSettings() {
    webViewController
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..clearCache()
      ..clearLocalStorage()
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (htmlWebViewLoaded) {
              return NavigationDecision.prevent;
            }
            if (request.url.startsWith("about:blank")) {
              return NavigationDecision.navigate;
            }
            htmlWebViewLoaded = true;
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  Future<io.HttpClientResponse> sendRequest(String method, Uri url, String body,
      Map<String, String> headers) async {
    io.HttpClient client = io.HttpClient();
    if (allowBadCertificates) {
      client.badCertificateCallback =
          (io.X509Certificate cert, String host, int port) => true;
    }
    io.HttpClientRequest request = await client.openUrl(method, url);

    for (String key in headers.keys) {
      request.headers.set(key, headers[key] ?? "", preserveHeaderCase: true);
    }

    request.contentLength = body.length;
    request.write(body);
    io.HttpClientResponse response = await request.close();
    return response;
  }

  Future<void> sendButtonPressed() async {
    Map<String, String> headers = {};

    responseStatusCode = "";
    responseHeaders = "";
    responseBody = "";
    resetWebView();

    if (urlController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t.generic.error),
            content: Text(t.tools.httprequest.error.url_cannot_be_empty),
            actions: [
              TextButton(
                child: Text(t.generic.ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    Uri? url;
    if (!urlController.text.startsWith("http://") &&
        !urlController.text.startsWith("https://")) {
      setState(() {
        urlController.text = "http://${urlController.text}";
      });
    }
    try {
      url = Uri.parse(urlController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t.generic.error),
            content: Text(t.tools.httprequest.error.invalid_url),
            actions: [
              TextButton(
                child: Text(t.generic.ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    if (headersController.text.isNotEmpty) {
      List<String> lines = headersController.text.split("\n");
      for (String line in lines) {
        List<String> parts = line.split(":");
        if (parts.length == 2) {
          headers[parts[0].trim()] = parts[1].trim();
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(t.generic.error),
                content: Text(t.tools.httprequest.error.invalid_headers),
                actions: [
                  TextButton(
                    child: Text(t.generic.ok),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          return;
        }
      }
    }

    io.HttpClientResponse response;
    String method = _method;
    if (_method == "...") {
      method = methodController.text;
    }
    try {
      response = await sendRequest(method, url, bodyController.text, headers)
          .timeout(const Duration(seconds: 10));
    } on FormatException catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.generic.error),
              content: Text(t.tools.httprequest.error.invalid_url),
              actions: [
                TextButton(
                  child: Text(t.generic.ok),
                  onPressed: () {
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      }
      return;
    } on TimeoutException catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.generic.error),
              content: Text(t.tools.httprequest.error.timeout),
              actions: [
                TextButton(
                  child: Text(t.generic.ok),
                  onPressed: () {
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      }
      return;
    } catch (e) {
      if (mounted) {
        if (kDebugMode) {
          print(e);
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.generic.error),
              content: Text("${t.tools.httprequest.error.other_error}\n\n${e.toString()}"),
              actions: [
                TextButton(
                  child: Text(t.generic.ok),
                  onPressed: () {
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      }
      return;
    }

    responseStatusCode = response.statusCode.toString();
    responseHeaders = response.headers.toString();
    responseBody = "";
    List<List<int>> responseBodyLists = await response.toList();
    for (List<int> list in responseBodyLists) {
      responseBody += utf8.decode(list, allowMalformed: true);
    }

    if (mounted) {
      setState(() {});
    }
  }



  void allowBadCertificatesChanged(bool shouldAllow) {
    if (shouldAllow) {
      showAllowBadCertificatesDialog();
    } else {
      setState(() {
        allowBadCertificates = false;
      });
    }
  }

  void showAllowBadCertificatesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.tools.httprequest.allow_bad_certificates),
          content: Text(t.tools.httprequest.allow_bad_certificates_description),
          actions: [
            TextButton(
              child: Text(t.tools.httprequest.i_know_what_i_am_doing),
              onPressed: () {
                setState(() {
                  allowBadCertificates = true;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(t.generic.cancel),
              onPressed: () {
                setState(() {
                  allowBadCertificates = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(String statusCode, ColorScheme colorScheme) {
    int code = int.tryParse(statusCode) ?? 0;
    if (code >= 200 && code < 300) return colorScheme.primary;
    if (code >= 300 && code < 400) return colorScheme.secondary;
    if (code >= 400) return colorScheme.error;
    return colorScheme.onSurfaceVariant;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.httprequest.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            if (responseBody.isNotEmpty)
              Tooltip(
                message: renderHtml ? t.tools.httprequest.back_to_details : t.tools.httprequest.render_html,
                child: IconButton(
                  icon: Icon(renderHtml ? Icons.short_text : Icons.html),
                  onPressed: () {
                    setState(() {
                      renderHtml = !renderHtml;
                      if (renderHtml) {
                        webViewController.loadHtmlString(responseBody);
                      }
                    });
                  },
                ),
              ),
          ],
        ),
        body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : renderHtml
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                WebViewWidget(
                  controller: webViewController,
                  key: webViewKey,
                ),
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    onLongPress: () {},
                    onDoubleTap: () {},
                  ),
                ),
              ],
            ),
          )
              : SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Request Configuration Card
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
                            Icon(Icons.send, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Request",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        DropdownMenu<String>(
                          dropdownMenuEntries: methods.map((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                          onSelected: (String? value) {
                            setState(() {
                              _method = value ?? _method;
                            });
                          },
                          label: Text(t.tools.httprequest.method),
                          width: MediaQuery.of(context).size.width - 64,
                          initialSelection: _method,
                          enableSearch: false,
                          enableFilter: false,
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        if (_method == "...") ...[
                          const SizedBox(height: 12),
                          TextField(
                            controller: methodController,
                            decoration: InputDecoration(
                              labelText: t.tools.httprequest.custom_method,
                              filled: true,
                              fillColor: colorScheme.surfaceVariant,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),
                        TextField(
                          controller: urlController,
                          decoration: InputDecoration(
                            labelText: t.tools.httprequest.url,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.link, color: colorScheme.onSurfaceVariant),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Headers Card
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
                            Icon(Icons.list_alt, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              t.tools.httprequest.headers,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: headersController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "key1: value1\nkey2: value2",
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Body Card
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
                            Icon(Icons.description, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              t.tools.httprequest.body,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: "Request body (JSON, XML, etc.)",
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Options Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    onTap: () => allowBadCertificatesChanged(!allowBadCertificates),
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: allowBadCertificates,
                            onChanged: (bool? value) {
                              allowBadCertificatesChanged(value ?? false);
                            },
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              t.tools.httprequest.allow_bad_certificates,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Icon(Icons.warning_amber, color: colorScheme.error),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Send Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.send),
                    label: Text(t.tools.httprequest.send_request),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                        renderHtml = false;
                        webViewController.clearCache();
                        webViewController.clearLocalStorage();
                        webViewController.loadRequest(Uri.parse("about:blank"));
                      });
                      sendButtonPressed().then((value) {
                        if (mounted) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      });
                    },
                  ),
                ),
                if (responseStatusCode.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  // Response Card
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
                              Icon(Icons.download, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                t.tools.httprequest.response,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(responseStatusCode, colorScheme),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  responseStatusCode,
                                  style: TextStyle(
                                    color: colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            t.tools.httprequest.headers,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SelectableText(
                              responseHeaders,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            t.tools.httprequest.body,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SelectableText(
                              responseBody,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
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
}