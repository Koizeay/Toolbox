
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:uuid/uuid.dart';

class UuidGeneratorPage extends StatefulWidget {
  const UuidGeneratorPage({ Key? key }) : super(key: key);
  @override
  State<UuidGeneratorPage> createState() => _UuidGeneratorPage();
}

class _UuidGeneratorPage extends State<UuidGeneratorPage> {
  var uuid = const Uuid();
  String uuidString = t.tools.uuidgenerator.default_uuid_text;


  void showV5UuidDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController namespaceController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t.tools.uuidgenerator.v5_generate_title),
            content: SizedBox(
              height: 130,
              child: Column(
                children: [
                  TextField(
                    controller: namespaceController,
                    decoration: InputDecoration(
                      hintText: t.tools.uuidgenerator.v5_namespace,
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: t.tools.uuidgenerator.v5_name,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.generic.cancel),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (namespaceController.text.isEmpty) {
                      namespaceController.text = uuid.v4();
                    }
                    try {
                      uuidString = uuid.v5(
                          namespaceController.text, nameController.text);
                    } on FormatException {
                      uuidString = t.tools.uuidgenerator.error.invalid_namespace;
                    }
                  });
                  Navigator.of(context).pop();
                },
                child: Text(t.tools.uuidgenerator.generate),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic
              .app_name} - ${t.tools.uuidgenerator.title}"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: uuidString));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                t.tools.uuidgenerator.copied_to_clipboard
                            ))
                        );
                      },
                      child: Text(
                        uuidString,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            uuidString = uuid.v1();
                          });
                        },
                        child: Text(t.tools.uuidgenerator.v1_uuid),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            uuidString = uuid.v4();
                          });
                        },
                        child: Text(t.tools.uuidgenerator.v4_uuid),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showV5UuidDialog();
                          });
                        },
                        child: Text(t.tools.uuidgenerator.v5_uuid),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}