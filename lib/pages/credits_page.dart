
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';

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
    String imagesPrefix =  Theme.of(context).brightness == Brightness.dark ? "_white" : "";
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
                      t.credits.app_license(license: "Mozilla Public License 2.0"),
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
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(const ClipboardData(text: "me@koizeay.com"));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(t.credits.email_copied_to_clipboard))
                            );
                          },
                          icon: Image.asset("assets/images/specific/credits_email$imagesPrefix.png", width: 20, height: 20,)
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlInBrowser("https://instagram.com/koizeay.dev");
                          },
                          icon: Image.asset("assets/images/specific/credits_instagram$imagesPrefix.png", width: 20, height: 20,)
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlInBrowser("https://jtu.me/discord");
                          },
                          icon: Image.asset("assets/images/specific/credits_discord$imagesPrefix.png", width: 20, height: 20,)
                        ),
                      ],
                    )
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        launchUrlInBrowser("https://koizeay.com");
                      },
                      child: const Text(
                        "https://koizeay.com",
                        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: t.generic.app_name,
                    applicationLegalese: t.credits.app_license(license: "Mozilla Public License 2.0"),
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