
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';

class HttpRequestPage extends StatefulWidget {
  const HttpRequestPage({ Key? key }) : super(key: key);
  @override
  State<HttpRequestPage> createState() => _HttpRequestPage();
}

class _HttpRequestPage extends State<HttpRequestPage> {
  bool isLoading = false;

  TextEditingController methodController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController headersController = TextEditingController();

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

  Future<HttpClientResponse> sendRequest(String method, Uri url, String body,
      Map<String, String> headers) async {
    HttpClient client = HttpClient();
    HttpClientRequest request = await client.openUrl(method, url);

    for (String key in headers.keys) {
      request.headers.set(key, headers[key] ?? "", preserveHeaderCase: true);
    }

    request.contentLength = body.length;
    request.write(body);
    HttpClientResponse response = await request.close();
    return response;
  }

  Future<void> sendButtonPressed() async {
    Map<String, String> headers = {};

    responseStatusCode = "";
    responseHeaders = "";
    responseBody = "";

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

    HttpClientResponse? response;
    String method = _method;
    if (_method == "...") {
      method = methodController.text;
    }
    try {
      response = await sendRequest(method, url, bodyController.text, headers);
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
              content: Text("${t.tools.httprequest.error.other_error}\n\n${e
                  .toString()}"),
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
    responseBody = await response.transform(utf8.decoder).join();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("${t.generic.app_name} - ${t.tools.httprequest.title}"),
          ),
          body: SafeArea(
            child: isLoading
                ? const Center(child: CircularProgressIndicator(),)
                : SingleChildScrollView(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            items: methods.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _method,
                            onChanged: (_) {
                              setState(() {
                                _method = _ ?? "GET";
                              });
                            },
                          )
                      ),
                      _method == "..." ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: methodController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.tools.httprequest.method,
                          ),
                        ),
                      ) : Container(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: urlController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.tools.httprequest.url,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: headersController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.tools.httprequest.headers,
                            hintText: "key1: value1\nkey2: value2",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: t.tools.httprequest.body,
                              hintText: "\n"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              child: Text(t.tools.httprequest.send_request),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                sendButtonPressed().then((value) {
                                  if (mounted) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                });
                              }
                          ),
                        ),
                      ),
                      responseStatusCode.isEmpty
                          ? Container()
                          : SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    t.tools.httprequest.response,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    t.tools.httprequest.status_code,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    responseStatusCode,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    t.tools.httprequest.headers,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    responseHeaders,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    t.tools.httprequest.body,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    responseBody,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]
                ),
              ),
            ),
          )
      ),
    );
  }
}