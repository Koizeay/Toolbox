
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class WhoisDomainPage extends StatefulWidget {
  const WhoisDomainPage({super.key});

  @override
  State<WhoisDomainPage> createState() => _WhoisDomainPage();
}

class _WhoisDomainPage extends State<WhoisDomainPage> {

  final TextEditingController _domainController = TextEditingController();
  final String _whoisServerApi = "https://toolbox.koizeay.com/whoisdomain/query?domain=";
  List<Map<String, String>>? whoisResult;
  bool isLoading = false;

  List<Map<String, String>> cleanupWhoisResult(String result) {
    Map<String, dynamic> json = jsonDecode(result);
    if (json["result"] == null) {
      return [];
    } else {
      List<Map<String, String>> whoisResult = [];
      json["result"].forEach((key, value) {
        if (value is List) {
          value = value.join("\n");
        }
        if (value == null) {
          return;
        }
        whoisResult.add(
            {key.toString().replaceAll("_", " ").toUpperCase(): value});
      });
      return whoisResult;
    }
  }

  Future<void> whoisLookup() async {
    final String domain = _domainController.text.trim();
    if (domain.isEmpty) {
      return;
    }

    if (mounted) {
      setState(() {
        whoisResult = null;
        isLoading = true;
      });
    }

    final String url = "$_whoisServerApi$domain";
    http.Response response = await http.get(Uri.parse(url)).onError((error,
        stackTrace) {
      return http.Response("Error", 500);
    });
    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          whoisResult = cleanupWhoisResult(response.body);
        });
      }
    } else {
      if (mounted) {
        showOkTextDialog(
            context,
            t.generic.error,
            t.tools.whoisdomain.error.impossible_to_get_whois_information
        );
      }
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
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
            title: Text(t.tools.whoisdomain.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.warning_amber_outlined),
                tooltip: t.tools.whoisdomain.disclaimer,
                onPressed: () {
                  showOkTextDialog(
                      context,
                      t.tools.whoisdomain.disclaimer,
                      t.tools.whoisdomain.disclaimer_text
                  );
                },
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        TextField(
                          controller: _domainController,
                          decoration: InputDecoration(
                            labelText: t.tools.whoisdomain.domain_name,
                            hintText: "example.com",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: () {
                                whoisLookup();
                              },
                              child: Text(t.tools.whoisdomain.whois_lookup)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: whoisResult == null
                                ? Text(isLoading ? t.tools.whoisdomain.loading : "")
                                : whoisResult!.isEmpty
                                ? Text(t.tools.whoisdomain.no_result, style: TextStyle(fontWeight: FontWeight.bold))
                                : Column(
                              children: [
                                const Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: whoisResult!.map((
                                      Map<String, String> entry) {
                                    return Column(
                                      children: entry.keys.map((String key) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  4.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      key,
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      entry[key] ?? "",
                                                      style: const TextStyle(
                                                          color: Colors.grey
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: Colors.grey,
                                            )
                                          ],
                                        );
                                      }).toList(),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                )
            ),
          )),
    );
  }
}