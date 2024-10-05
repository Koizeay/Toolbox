
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({ super.key });
  @override
  State<CreditsPage> createState() => _CreditsPage();
}

class _CreditsPage extends State<CreditsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.credits.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      t.credits.app_license(license: "GNU GPLv3"),
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      t.credits.app_icon(author: "Koizeay + Icons8"),
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          t.credits.tools_icons(author: "Icons8"),
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrlInBrowser("https://www.icons8.com/");
                          },
                          child: const Text(
                            "https://www.icons8.com/",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          t.credits.translations.title,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          t.credits.translations.english(author: "Koizeay"),
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          t.credits.translations.french(author: "Koizeay"),
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: t.generic.app_name,
                    applicationLegalese: t.credits.app_license(license: "GNU GPLv3"),
                    applicationIcon: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image(image: AssetImage("assets/images/icons/icon_rounded.png"), width: 50, height: 50),
                    )
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        t.credits.view_licenses,
                        style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launchUrlInBrowser("https://github.com/Koizeay/Toolbox");
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        t.credits.contribute_on_github,
                        style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
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