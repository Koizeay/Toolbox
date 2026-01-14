import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

enum DnsProvider {
  google('Google DNS', 'https://dns.google/resolve'),
  cloudflare('Cloudflare DNS', 'https://cloudflare-dns.com/dns-query'),
  native('Native DNS', '');

  final String name;
  final String endpoint;
  const DnsProvider(this.name, this.endpoint);
}

class NslookupPage extends StatefulWidget {
  const NslookupPage({super.key});
  @override
  State<NslookupPage> createState() => _NslookupPage();
}

class _NslookupPage extends State<NslookupPage> {
  bool loading = false;
  Map<String, List<String>> _dnsRecords = {};
  final TextEditingController _domainController = TextEditingController();
  DnsProvider _selectedProvider = DnsProvider.google;

  Future<Map<String, List<String>>> getDnsRecordsNative(String domain) async {
    Map<String, List<String>> records = {};

    try {
      // Native DNS only supports A/AAAA lookups
      final addresses = await InternetAddress.lookup(domain);

      List<String> ipv4 = [];
      List<String> ipv6 = [];

      for (var address in addresses) {
        if (address.type == InternetAddressType.IPv4) {
          ipv4.add(address.address);
        } else if (address.type == InternetAddressType.IPv6) {
          ipv6.add(address.address);
        }
      }

      if (ipv4.isNotEmpty) records['A'] = ipv4;
      if (ipv6.isNotEmpty) records['AAAA'] = ipv6;
    } catch (e) {
      // Failed to resolve
    }

    return records;
  }

  Future<Map<String, List<String>>> getDnsRecordsDoH(String domain, String endpoint) async {
    Map<String, List<String>> records = {};

    // Record types to query
    final recordTypes = ['A', 'AAAA', 'MX', 'TXT', 'NS', 'CNAME', 'SOA'];

    // Map DNS type numbers to names
    final Map<int, String> typeMap = {
      1: 'A',
      28: 'AAAA',
      15: 'MX',
      16: 'TXT',
      2: 'NS',
      5: 'CNAME',
      6: 'SOA',
    };

    for (String type in recordTypes) {
      try {
        final response = await http.get(
          Uri.parse('$endpoint?name=$domain&type=$type'),
          headers: {'accept': 'application/dns-json'},
        ).timeout(const Duration(seconds: 5));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['Answer'] != null) {
            List<String> values = [];
            for (var answer in data['Answer']) {
              // Check if the answer type matches the requested type
              int answerType = answer['type'];
              String answerTypeName = typeMap[answerType] ?? 'UNKNOWN';

              // Only include answers that match the requested type
              if (answerTypeName == type) {
                String value = answer['data'].toString();
                values.add(value);
              }
            }
            if (values.isNotEmpty) {
              records[type] = values;
            }
          }
        }
      } catch (e) {
        // Continue with next record type if one fails
      }
    }

    return records;
  }

  Future<Map<String, List<String>>> getDnsRecords(String domain) async {
    if (_selectedProvider == DnsProvider.native) {
      return getDnsRecordsNative(domain);
    } else {
      return getDnsRecordsDoH(domain, _selectedProvider.endpoint);
    }
  }

  IconData _getIconForRecordType(String recordType) {
    switch (recordType) {
      case 'A':
      case 'AAAA':
        return Icons.dns;
      case 'MX':
        return Icons.email;
      case 'TXT':
        return Icons.text_fields;
      case 'NS':
        return Icons.dns_outlined;
      case 'CNAME':
        return Icons.link;
      case 'SOA':
        return Icons.admin_panel_settings;
      default:
        return Icons.info;
    }
  }

  List<Widget> _buildDnsRecordCards(ColorScheme colorScheme) {
    final allRecordTypes = ['A', 'AAAA', 'MX', 'TXT', 'NS', 'CNAME', 'SOA'];
    List<Widget> cards = [];

    for (String recordType in allRecordTypes) {
      final records = _dnsRecords[recordType];
      final hasRecords = records != null && records.isNotEmpty;
      final isNativeUnsupported = _selectedProvider == DnsProvider.native &&
                                  recordType != 'A' && recordType != 'AAAA';

      cards.add(
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
                        color: hasRecords
                            ? colorScheme.primaryContainer
                            : colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getIconForRecordType(recordType),
                        color: hasRecords
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "$recordType Records",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: hasRecords ? null : colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    if (!isNativeUnsupported)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: hasRecords
                              ? colorScheme.secondaryContainer
                              : colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          hasRecords ? "${records!.length}" : "0",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: hasRecords
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                if (isNativeUnsupported)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 16, color: colorScheme.onSurfaceVariant),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Not supported by Native DNS",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (hasRecords)
                  ...records!.map((record) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            record,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                else
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "No records found",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
      cards.add(const SizedBox(height: 12));
    }

    return cards;
  }

  @override
  void initState() {
    super.initState();
  }

  void lookup() {
    if (_domainController.text.isEmpty) {
      showOkTextDialog(context, t.generic.error, t.tools.nslookup.error.please_enter_a_domain_name);
      return;
    }
    setState(() {
      loading = true;
      _dnsRecords.clear();
    });
    getDnsRecords(_domainController.text).then((value) {
      setState(() {
        _dnsRecords = value;
        loading = false;
      });
      if (_dnsRecords.isEmpty) {
        showOkTextDialog(context, t.generic.error, t.tools.nslookup.error.no_address_associated_with_domain);
      }
    }).catchError((error) {
      setState(() {
        loading = false;
      });
      showOkTextDialog(context, t.generic.error, t.tools.nslookup.error.no_address_associated_with_domain);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.nslookup.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _domainController,
                          decoration: InputDecoration(
                            labelText: t.tools.nslookup.enter_a_domain_name,
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
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<DnsProvider>(
                                value: _selectedProvider,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.dns, color: colorScheme.onSurfaceVariant),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                                items: DnsProvider.values.map((provider) {
                                  return DropdownMenuItem(
                                    value: provider,
                                    child: Text(provider.name),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedProvider = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: lookup,
                            icon: const Icon(Icons.search),
                            label: Text(t.tools.nslookup.lookup),
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
              ),
              if (loading)
                const Expanded(child: Center(child: CircularProgressIndicator()))
              else if (_dnsRecords.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      children: _buildDnsRecordCards(colorScheme),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}