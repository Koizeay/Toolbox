import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  void showSwissDialog(BuildContext context) {
    showOkTextDialog(
      context,
      t.credits.made_with_love_in_switzerland,
      t.credits.made_with_love_in_switzerland_description
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(t.credits.title),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _InfoCard(
              icon: Icons.gavel_outlined,
              title: t.credits.app_license(license: "Mozilla Public License 2.0"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: t.generic.app_name,
                  applicationLegalese: t.credits.app_license(license: "Mozilla Public License 2.0"),
                  applicationIcon: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Image(
                      image: AssetImage("assets/images/icons/icon_rounded.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.palette_outlined,
              title: t.credits.app_icon(author: "Koizeay + Icons8"),
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.image_outlined,
              title: t.credits.tools_icons(author: "Icons8"),
              subtitle: "www.icons8.com",
              trailing: const Icon(Icons.open_in_new),
              onTap: () => launchUrlInBrowser("https://www.icons8.com/"),
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.translate,
              title: t.credits.translations.title,
              subtitle: "${t.credits.translations.english(author: "Koizeay")}\n${t.credits.translations.french(author: "Koizeay")}",
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      child: Icon(Icons.person, size: 32),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Koizeay",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => launchUrlInBrowser("https://koizeay.com"),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: Text(
                          "koizeay.com",
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          tooltip: "Email",
                          onPressed: () {
                            Clipboard.setData(const ClipboardData(text: "me@koizeay.com"));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(t.credits.email_copied_to_clipboard)),
                            );
                          },
                          icon: SvgPicture.asset(
                            "assets/images/specific/credits_email.svg",
                            colorFilter: ColorFilter.mode(
                              colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        IconButton(
                          tooltip: "Instagram",
                          onPressed: () => launchUrlInBrowser("https://instagram.com/koizeay.dev"),
                          icon: SvgPicture.asset(
                            "assets/images/specific/credits_instagram.svg",
                            colorFilter: ColorFilter.mode(
                              colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        IconButton(
                          tooltip: "Bluesky",
                          onPressed: () => launchUrlInBrowser("https://bsky.app/profile/koizeay.dev"),
                          icon: SvgPicture.asset(
                            "assets/images/specific/credits_bluesky.svg",
                            colorFilter: ColorFilter.mode(
                              colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        IconButton(
                          tooltip: "Discord",
                          onPressed: () => launchUrlInBrowser("https://jtu.me/discord"),
                          icon: SvgPicture.asset(
                            "assets/images/specific/credits_discord.svg",
                            colorFilter: ColorFilter.mode(
                              colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _ActionCard(
              icon: Icons.code,
              title: t.credits.contribute_on_github,
              color: colorScheme.primaryContainer,
              textColor: colorScheme.onPrimaryContainer,
              onTap: () => launchUrlInBrowser("https://github.com/Koizeay/Toolbox"),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.favorite,
              title: t.credits.made_with_love_in_switzerland,
              customContent: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    "assets/images/specific/credits_swiss_flag.png",
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              onTap: () => showSwissDialog(context),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.apps,
              title: t.credits.more_apps_and_services,
              color: colorScheme.primary,
              textColor: colorScheme.onPrimary,
              onTap: () => launchUrlInBrowser("https://jtu.me/projects"),
            ),
            if (Platform.isAndroid) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  t.credits.ads_disclaimer,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _InfoCard({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colorScheme.onPrimaryContainer, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  final Color? textColor;
  final Widget? customContent;
  final VoidCallback? onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    this.color,
    this.textColor,
    this.customContent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                icon,
                size: 36,
                color: textColor ?? colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor ?? colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              if (customContent != null) customContent!,
            ],
          ),
        ),
      ),
    );
  }
}