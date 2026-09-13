import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/shared_preferences.dart';
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

  UrlShortenerResult? result;

  final TextEditingController urlController = TextEditingController();
  
  bool useAccount = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController accessPasswordController = TextEditingController();
  DateTime? expirationDate;

  @override
  void initState() {
    checkConnectionToServer().then((_) {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }).onError((error, stackTrace) {
      if (mounted) {
        setState(() => isLoading = false);
      }
    });
    loadAccountSettings();
    super.initState();
  }

  Future<void> loadAccountSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      useAccount = prefs.getBool(SHARED_PREFERENCES_TOOL_JTUME_USE_ACCOUNT) ?? false;
      emailController.text = prefs.getString(SHARED_PREFERENCES_TOOL_JTUME_EMAIL) ?? "";
      passwordController.text = prefs.getString(SHARED_PREFERENCES_TOOL_JTUME_PASSWORD) ?? "";
    });
  }

  Future<void> saveAccountSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SHARED_PREFERENCES_TOOL_JTUME_USE_ACCOUNT, useAccount);
    await prefs.setString(SHARED_PREFERENCES_TOOL_JTUME_EMAIL, emailController.text);
    await prefs.setString(SHARED_PREFERENCES_TOOL_JTUME_PASSWORD, passwordController.text);
  }

  Future<void> checkConnectionToServer() async {
    final response = await httpGet(serverUrl, {});
    if (response.statusCode == 200) {
      isServerAvailable = true;
    }
  }

  Future<void> shortenUrl(String url) async {
    String? token;

    if (useAccount) {
      await saveAccountSettings();

      final tokenResponse = await httpPost(
        "$serverUrl/_/api/getApiToken",
        {
          "email": emailController.text.trim(),
          "password": passwordController.text
        },
      ).onError((error, stackTrace) => Response("", 500));

      if (tokenResponse.statusCode == 200) {
        final json = jsonDecode(tokenResponse.body);
        token = json["api_token"];
      } else if (tokenResponse.statusCode == 401) {
        if (mounted) {
          showOkTextDialog(
            context,
            t.generic.error,
            t.tools.urlshortener.error.unauthorized,
          );
        }
        return;
      } else {
        if (mounted) {
          showOkTextDialog(
            context,
            t.generic.error,
            t.tools.urlshortener.error.failed_to_shorten_url,
          );
        }
        return;
      }
    }

    if (expirationDate != null) {
      final now = DateTime.now().toUtc();
      if (!expirationDate!.isAfter(now)) {
        if (mounted) {
          showOkTextDialog(
            context,
            t.generic.error,
            t.tools.urlshortener.error.invalid_expiration_date,
          );
        }
        return;
      }
    }

    final Map<String, String> body = {"url": url};
    if (token != null) {
      body["api_token"] = token;
    }
    if (accessPasswordController.text.isNotEmpty) {
      body["access_password"] = accessPasswordController.text;
    }
    if (expirationDate != null) {
      body["expiration_timestamp"] = (expirationDate!.millisecondsSinceEpoch ~/ 1000).toString();
    }

    final response = await httpPost(serverUrl + serverShortenApiEndpoint, body).onError((error, stackTrace) {
      return Response("", 500);
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      result = UrlShortenerResult(
        shortUrl: json["short_url"] ?? "",
        qrBase64: json["qr_base64"] ?? "",
        shortPath: json["short_path"] ?? "",
        managementPassword: json["management_password"] ?? "",
      );
    } else if (response.statusCode == 401) {
      result = null;
      if (mounted) {
        showOkTextDialog(
          context,
          t.generic.error,
          t.tools.urlshortener.error.unauthorized,
        );
      }
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
    final actions = [
      TextButton(
        onPressed: () {
          Share.share(
            shortUrl,
            sharePositionOrigin: Rect.fromLTWH(
              MediaQuery.of(context).size.width - 100,
              0,
              100,
              100,
            ),
          );
          Navigator.pop(context);
        },
        child: Text(t.tools.urlshortener.url),
      ),
      TextButton(
        onPressed: () {
          final qrXFile = XFile.fromData(
            base64Decode(qrBase64),
            name: "qr_code.png",
            mimeType: "image/png",
          );
          Share.shareXFiles(
            [qrXFile],
            sharePositionOrigin: Rect.fromLTWH(
              MediaQuery.of(context).size.width - 100,
              0,
              100,
              100,
            ),
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
      actions,
    );
  }

  void showMoreFeaturesDialog(BuildContext context) {
    final actions = [
      TextButton(
        onPressed: () => Navigator.pop(context),
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
      actions,
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  Widget _serverOfflineCard(ColorScheme colorScheme) {
    return Center(
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
                Icon(Icons.cloud_off_outlined, size: 64, color: colorScheme.error),
                const SizedBox(height: 16),
                Text(
                  t.tools.urlshortener.error.impossible_to_connect_to_the_server,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  t.tools.urlshortener.error.impossible_to_connect_to_the_server_message,
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
    );
  }

  Widget _infoAcceptTosBox(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.info_outlined, size: 16, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.tools.urlshortener.by_clicking_you_accept(url: "jtu.me"),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () => launchUrlInBrowser("$serverUrl$serverTosEndpoint"),
            child: Text(t.tools.urlshortener.terms_of_service),
          ),
        ],
      ),
    );
  }

  Widget _inputCard(ColorScheme colorScheme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.link_outlined, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  t.tools.urlshortener.url_to_shorten,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'https://example.com',
                prefixIcon: Icon(Icons.language_outlined,
                    color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 12),
            _infoAcceptTosBox(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _optionsCard(ColorScheme colorScheme) {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.settings_outlined, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  t.tools.urlshortener.options,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: accessPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: t.tools.urlshortener.access_password,
                prefixIcon: Icon(Icons.lock_outlined,
                    color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined, color: colorScheme.onSurfaceVariant),
              title: Text(expirationDate == null
                  ? t.tools.urlshortener.expiration_date
                  : expirationDate!.toUtc().toString().substring(0, 10)),
              trailing: expirationDate != null
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() => expirationDate = null);
                      },
                    )
                  : null,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: tomorrow,
                  firstDate: tomorrow,
                  lastDate: tomorrow.add(const Duration(days: 365)),
                );
                if (date != null) {
                  setState(() => expirationDate = DateTime.utc(date.year, date.month, date.day));
                }
              },
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: Text(t.tools.urlshortener.use_my_account),
              value: useAccount,
              onChanged: (value) {
                setState(() => useAccount = value);
              },
            ),
            if (useAccount) ...[
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: t.tools.urlshortener.email,
                  prefixIcon: Icon(Icons.email_outlined,
                      color: colorScheme.onSurfaceVariant),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: t.tools.urlshortener.password,
                  prefixIcon: Icon(Icons.password_outlined,
                      color: colorScheme.onSurfaceVariant),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showCustomButtonsTextDialog(
                      context,
                      t.tools.urlshortener.no_account,
                      t.tools.urlshortener.no_account_message,
                      [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(t.generic.cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            launchUrlInBrowser("https://jtu.me");
                            Navigator.pop(context);
                          },
                          child: Text(t.tools.urlshortener.open),
                        ),
                      ],
                    );
                  },
                  child: Text(t.tools.urlshortener.no_account),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _resultCard(ColorScheme colorScheme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outlined, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  t.tools.urlshortener.your_shortened_url_is,
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
                    label: Text(t.generic.copy),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
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
                    icon: const Icon(Icons.share_outlined),
                    label: Text(t.generic.share),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => showShareDialog(result?.shortUrl ?? "", result?.qrBase64 ?? ""),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _managementCard(ColorScheme colorScheme) {
    final managementPassword = result?.managementPassword ?? "";
    final hasManagementPassword = managementPassword.isNotEmpty && managementPassword != "-";

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.admin_panel_settings_outlined, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  t.tools.urlshortener.management_info,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Clipboard.setData(ClipboardData(text: result?.shortPath ?? ""));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(t.tools.urlshortener.link_id_copied_to_clipboard)),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.tools.urlshortener.the_link_id_is,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      result?.shortPath ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (hasManagementPassword) ...[
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: managementPassword));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.tools.urlshortener.link_password_copied_to_clipboard)),);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.tools.urlshortener.the_link_password_is,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        managementPassword,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
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
                  color: colorScheme.primaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outlined, size: 16, color: colorScheme.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        t.tools.urlshortener.link_password_hint_text,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outlined, size: 16, color: colorScheme.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        t.tools.urlshortener.manage_with_account,
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.tools.urlshortener.title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: isLoading ? const Center(child: CircularProgressIndicator())
              : isServerAvailable ? (result != null
              ? SingleChildScrollView(padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _resultCard(colorScheme),
                const SizedBox(height: 16),
                _managementCard(colorScheme),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.add),
                    label: Text(t.tools.urlshortener.shorten_another_url),
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      setState(() {
                        result = null;
                        urlController.clear();
                      });
                    },
                  ),
                ),
              ],
            ),
          ) : SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _inputCard(colorScheme),
                const SizedBox(height: 16),
                _optionsCard(colorScheme),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.compress),
                    label: Text(t.tools.urlshortener.shorten),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (urlController.text.trim().isEmpty) {
                        return;
                      }

                      setState(() {
                        result = null;
                        isLoading = true;
                      });

                      shortenUrl(urlController.text.trim()).then((_) {
                        if (mounted) {
                          setState(() => isLoading = false);
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  icon: const Icon(Icons.more_horiz_outlined,
                      size: 18),
                  label: Text(t.tools.urlshortener.more_features),
                  onPressed: () => showMoreFeaturesDialog(context),
                ),
              ],
            ),
          )) : _serverOfflineCard(colorScheme),
        ),
      ),
    );
  }
}
