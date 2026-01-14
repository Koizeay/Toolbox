
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

  List<Widget> _buildGroupedWhoisCards(List<Map<String, String>> records, ColorScheme colorScheme) {
    // Group related fields
    Map<String, List<MapEntry<String, String>>> groups = {
      'Domain': [],
      'Registrar': [],
      'Dates': [],
      'Status': [],
      'Name Servers': [],
      'Contact': [],
      'Other': [],
    };

    for (var record in records) {
      for (var entry in record.entries) {
        String key = entry.key.toLowerCase();
        if (key.contains('domain') && !key.contains('status')) {
          groups['Domain']!.add(entry);
        } else if (key.contains('registrar') || key.contains('registry')) {
          groups['Registrar']!.add(entry);
        } else if (key.contains('date') || key.contains('created') || key.contains('updated') || key.contains('expir')) {
          groups['Dates']!.add(entry);
        } else if (key.contains('status')) {
          groups['Status']!.add(entry);
        } else if (key.contains('name server') || key.contains('nserver')) {
          groups['Name Servers']!.add(entry);
        } else if (key.contains('contact') || key.contains('admin') || key.contains('tech') || key.contains('email')) {
          groups['Contact']!.add(entry);
        } else {
          groups['Other']!.add(entry);
        }
      }
    }

    List<Widget> widgets = [];

    // Icon mapping
    Map<String, IconData> groupIcons = {
      'Domain': Icons.language,
      'Registrar': Icons.business,
      'Dates': Icons.calendar_today,
      'Status': Icons.info_outline,
      'Name Servers': Icons.dns,
      'Contact': Icons.contact_mail,
      'Other': Icons.more_horiz,
    };

    for (var groupEntry in groups.entries) {
      if (groupEntry.value.isNotEmpty) {
        widgets.add(
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          groupIcons[groupEntry.key] ?? Icons.info,
                          color: colorScheme.onPrimaryContainer,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        groupEntry.key,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...groupEntry.value.map((entry) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          entry.value,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        );
        widgets.add(const SizedBox(height: 12));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.whoisdomain.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
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
            if (whoisResult != null && whoisResult!.isNotEmpty)
              IconButton(
                icon: Icon(isRawView ? Icons.table_rows_outlined : Icons.notes_outlined),
                tooltip: isRawView ? t.tools.whoisdomain.view_pretty : t.tools.whoisdomain.view_raw,
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      isRawView = !isRawView;
                    });
                  }
                },
              ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          controller: _domainController,
                          decoration: InputDecoration(
                            labelText: t.tools.whoisdomain.domain_name,
                            hintText: "example.com",
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.language, color: colorScheme.onSurfaceVariant),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: whoisLookupButtonPressed,
                            icon: const Icon(Icons.search),
                            label: Text(t.tools.whoisdomain.whois_lookup),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (isLoading)
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: const Padding(
                      padding: EdgeInsets.all(32),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  )
                else if (whoisResult != null && whoisResult!.isEmpty)
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Icon(Icons.search_off, size: 48, color: colorScheme.onSurfaceVariant),
                          const SizedBox(height: 16),
                          Text(
                            t.tools.whoisdomain.no_result,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  )
                else if (whoisResult != null && whoisResult!.isNotEmpty)
                  if (!isRawView)
                    Column(
                      children: _buildGroupedWhoisCards(whoisResult!, colorScheme),
                    )
                  else
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.code, color: colorScheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  "Raw WHOIS Data",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceVariant,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SelectableText(
                                whoisResultRawString,
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
            ),
          ),
        ),
      ),
    );
  }
}