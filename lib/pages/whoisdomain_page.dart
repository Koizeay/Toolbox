
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class WhoisDomainPage extends StatefulWidget {
  const WhoisDomainPage({super.key});

  @override
  State<WhoisDomainPage> createState() => _WhoisDomainPage();
}

class _WhoisDomainPage extends State<WhoisDomainPage> {

  final TextEditingController _domainController = TextEditingController();

  final String ianaWhoisServer = 'whois.iana.org';

  List<Map<String, String>>? whoisResult;
  String whoisResultRawString = "";

  bool isLoading = false;
  bool isRawView = false;

  bool isDomainAnIpAddress(String domain) {
    final List<String> parts = domain.split('.');
    if (parts.length != 4) {
      return false;
    }

    for (final String part in parts) {
      if (part.isEmpty) {
        return false;
      }

      final int number = int.tryParse(part) ?? -1;
      if (number < 0 || number > 255) {
        return false;
      }
    }

    return true;
  }

  Future<String?> getWhoisServer(String tld) async {
    final Socket socket = await Socket.connect(ianaWhoisServer, 43);
    socket.write('$tld\r\n');

    final StringBuffer responseBuffer = StringBuffer();
    await socket.listen((List<int> data) {
      responseBuffer.write(utf8.decode(data));
    }).asFuture();
    socket.destroy();

    final String response = responseBuffer.toString();
    final List<String> lines = response.split('\n');

    for (final String line in lines) {
      if (line.startsWith('whois:')) {
        return line.split(':')[1].trim();
      }
    }

    return null;
  }

  Future<String> whois(String domain, {int port = 43}) async {
    if (isDomainAnIpAddress(domain)) {
      showOkTextDialog(
          context,
          t.tools.whoisdomain.ip_address_not_supported,
          t.tools.whoisdomain.ip_address_not_supported_description
      );
      return '';
    }

    final String tld = domain.split('.').last;
    final String? server = await getWhoisServer(tld);
    if (server == null) {
      return '';
    }

    final Socket socket = await Socket.connect(server, port);
    socket.write('$domain\r\n');

    final StringBuffer responseBuffer = StringBuffer();

    await socket.listen((List<int> data) {
      responseBuffer.write(utf8.decode(data));
    }).asFuture();

    socket.destroy();

    return responseBuffer.toString();
  }

  List<Map<String, String>> cleanupWhoisResult(String result) {
    result = result.replaceAll("\r", "");
    final List<String> lines = result.split('\n');
    final List<Map<String, String>> cleanedResult = [];

    String currentKey = "";
    String currentValue = "";

    for (int i = 0; i < lines.length; i++) {
      lines[i] = lines[i].trim();
      if (lines[i].startsWith(">>>")) {
        break;
      }
      if (lines[i].isEmpty || lines[i].startsWith('%') ||
          lines[i].startsWith('#')) {
        continue;
      } else {
        currentKey = lines[i]
            .split(": ")
            .first
            .trim();
        currentValue = lines[i].split(": ").sublist(1).join(": ").trim();
        if (currentValue.isEmpty) {
          if (lines[i].endsWith(":")) {
            currentKey = lines[i].substring(0, lines[i].length - 1);
            currentValue = "";
            while (i + 1 < lines.length &&
                (lines[i + 1].isEmpty || !lines[i + 1].contains(":"))) {
              currentValue += "${lines[i + 1].trim()}\n";
              i++;
            }
          }
        }
      }
      if (currentValue.endsWith("\n")) {
        currentValue =
            currentValue.substring(0, currentValue.length - 1).trim();
      }
      if (currentValue
          .trim()
          .isEmpty) {
        continue;
      }
      currentKey = currentKey[0].toUpperCase() + currentKey.substring(1);
      cleanedResult.add({currentKey: currentValue});
    }
    return cleanedResult;
  }

  Future<void> whoisLookupButtonPressed() async {
    final String domain = _domainController.text.trim();
    if (domain.isEmpty) {
      return;
    }

    if (mounted) {
      setState(() {
        whoisResult = null;
        whoisResultRawString = "";
        isLoading = true;
      });
    }

    try {
      whoisResultRawString = await whois(domain);
      if (mounted) {
        setState(() {
          whoisResult = cleanupWhoisResult(whoisResultRawString);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          whoisResult = [];
        });
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
              ),
              IconButton(
                icon: Icon(isRawView ? Icons.table_rows_outlined : Icons
                    .notes_outlined),
                tooltip: isRawView ? t.tools.whoisdomain.view_pretty : t.tools
                    .whoisdomain.view_raw,
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      isRawView = !isRawView;
                    });
                  }
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
                                whoisLookupButtonPressed();
                              },
                              child: Text(t.tools.whoisdomain.whois_lookup)
                          ),
                        ),
                        !isRawView ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: whoisResult == null
                                ? Text(
                                isLoading ? t.tools.whoisdomain.loading : "",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                            )
                                : whoisResult!.isEmpty
                                ? Column(
                              children: [
                                SizedBox(
                                  child: Text(
                                      t.tools.whoisdomain.no_result,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ),
                              ],
                            )
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
                        ) : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: whoisResult == null
                                ? Text(
                                isLoading ? t.tools.whoisdomain.loading : "",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                            )
                                : whoisResultRawString.isEmpty
                                ? Column(
                              children: [
                                SizedBox(
                                  child: Text(
                                      t.tools.whoisdomain.no_result,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ),
                              ],
                            )
                                : Column(
                              children: [
                                const Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 16, 0, 0),
                                  child: Text(
                                    whoisResultRawString,
                                    style: const TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
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