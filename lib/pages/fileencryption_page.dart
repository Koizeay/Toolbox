

import 'dart:io';
import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toolbox/gen/strings.g.dart';

class FileEncryptionPage extends StatefulWidget {
  const FileEncryptionPage({ Key? key }) : super(key: key);
  @override
  State<FileEncryptionPage> createState() => _FileEncryptionPage();
}

class _FileEncryptionPage extends State<FileEncryptionPage> {
  bool isEncrypting = false;
  File? selectedFile;
  String selectedFileName = "";
  var aesCrypt = AesCrypt();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    aesCrypt.setUserData(createdBy: t.generic.app_name,);
    selectedFileName = t.tools.fileencryption.no_file_selected;
    super.initState();
  }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      selectedFileName = result.files.single.name;
      return File(result.files.single.path ?? "");
    }
    return null;
  }

  Future<void> selectFileToEncrypt() async {
    File? file = await pickFile();
    if (file != null) {
      if (mounted) {
        setState(() {
          selectedFile = file;
        });
      }
    }
  }

  Future<void> encryptSelectedFile() async {
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.tools.fileencryption.enter_password))
      );
      return;
    }
    aesCrypt.setPassword(passwordController.text);
    aesCrypt.setOverwriteMode(AesCryptOwMode.on);
    String encryptedFileName = "${selectedFileName.replaceAll(
        RegExp(r"[^a-zA-Z0-9\-.]"), "_")}.aes";

    Uint8List? selectedFileBytes;
    try {
      selectedFileBytes = await selectedFile?.readAsBytes();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(t.tools.fileencryption.error.failed_to_read_file))
        );
      }
      return;
    }

    if (selectedFileBytes == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(t.tools.fileencryption.error.failed_to_read_file))
        );
      }
      return;
    }

    Directory tempSaveDirectory = await getTemporaryDirectory();

    Map<String, dynamic> args = {
      "aesCrypt": aesCrypt,
      "selectedFileBytes": selectedFileBytes,
      "tempSaveDirectory": tempSaveDirectory,
      "encryptedFileName": encryptedFileName,
    };

    String encryptedFilePath = await compute(_encryptFile, args);

    Uint8List encryptedFileBytes = await File(encryptedFilePath).readAsBytes();

    if (mounted) {
      await saveFile(encryptedFileName, encryptedFileBytes);
      setState(() {
        selectedFile = null;
        selectedFileName = t.tools.fileencryption.no_file_selected;
        passwordController.text = "";
      });
    }
  }

  Future<void> decryptSelectedFile() async {
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.tools.fileencryption.enter_password))
      );
      return;
    }
    aesCrypt.setPassword(passwordController.text);
    aesCrypt.setOverwriteMode(AesCryptOwMode.on);
    String decryptedFileName = selectedFileName.replaceAll(
        RegExp(r"[^a-zA-Z0-9\-.]"), "_");
    decryptedFileName =
        decryptedFileName.substring(0, decryptedFileName.length - 4);

    Uint8List? selectedFileBytes = await selectedFile?.readAsBytes();

    if (selectedFileBytes == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(t.tools.fileencryption.error.failed_to_read_file))
        );
      }
      return;
    }

    Directory tempSaveDirectory = await getTemporaryDirectory();

    for (FileSystemEntity file in tempSaveDirectory.listSync()) {
      if (file is File) {
        try {
          await file.delete();
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    }

    File tempFile = await File("${tempSaveDirectory.path}/$decryptedFileName")
        .writeAsBytes(selectedFileBytes);
    Uint8List decryptedFileBytes;
    Map<String, dynamic> args = {
      "aesCrypt": aesCrypt,
      "tempFile": tempFile,
    };
    try {
      decryptedFileBytes = await compute(_decryptFile, args);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                t.tools.fileencryption.error.failed_to_decrypt_file
            ))
        );
      }
      passwordController.text = "";
      return;
    }

    if (mounted) {
      await saveFile(decryptedFileName, decryptedFileBytes);
      setState(() {
        selectedFile = null;
        selectedFileName = t.tools.fileencryption.no_file_selected;
        passwordController.text = "";
      });
    }
  }

  Future<void> saveFile(String fileName, Uint8List fileBytes) async {
    final params = SaveFileDialogParams(data: fileBytes, fileName: fileName);
    final filePath = await FlutterFileDialog.saveFile(params: params);
    if (filePath != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(t.tools.fileencryption.file_saved_successfully))
        );
      }
    }
  }

  bool selectedFileIsAesExtension() {
    return selectedFileName.endsWith(".aes");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            // TODO: Replace this with the app name + tool's name
            title: Text(
                "${t.generic.app_name} - ${t.tools.fileencryption.title}"),
          ),
          body: SafeArea(
            child: isEncrypting
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: [
                      Text(
                        t.tools.fileencryption.home_hint,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                            onPressed: () {
                              setState(() {
                                selectedFile = null;
                                selectedFileName =
                                    t.tools.fileencryption.no_file_selected;
                              });
                              selectFileToEncrypt();
                            },
                            child: Text(t.tools.fileencryption.pick_a_file)
                        ),
                      ),
                      Center(
                          child: Text(
                            selectedFileName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          )
                      ), selectedFile == null
                          ? Container()
                          : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.tools.fileencryption
                                .encryption_password,
                          ),
                        ),
                      ),
                      selectedFile == null
                          ? Container()
                          : SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                            onPressed: () {
                              setState(() {
                                isEncrypting = true;
                              });
                              if (selectedFileIsAesExtension()) {
                                decryptSelectedFile().then((value) {
                                  if (mounted) {
                                    setState(() {
                                      isEncrypting = false;
                                    });
                                  }
                                });
                              } else {
                                encryptSelectedFile().then((value) {
                                  if (mounted) {
                                    setState(() {
                                      isEncrypting = false;
                                    });
                                  }
                                });
                              }
                            },
                            child: selectedFileIsAesExtension()
                                ? Text(t.tools.fileencryption.decrypt)
                                : Text(t.tools.fileencryption.encrypt)
                        ),
                      ),
                    ]
                ),
              ),
            ),
          )
      ),
    );
  }
}

Future<String> _encryptFile(Map<String, dynamic> args) async {
  return await args["aesCrypt"].encryptDataToFile(args["selectedFileBytes"], "${args["tempSaveDirectory"].path}/${args["encryptedFileName"]}");
}

Future<Uint8List> _decryptFile(Map<String, dynamic> args) async {
    return await args["aesCrypt"].decryptDataFromFile(args["tempFile"].path);
}