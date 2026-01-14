

import 'dart:io';
import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toolbox/gen/strings.g.dart';

class FileEncryptionPage extends StatefulWidget {
  const FileEncryptionPage({ super.key });
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.fileencryption.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: isEncrypting
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        selectedFileIsAesExtension()
                            ? "Decrypting..."
                            : "Encrypting...",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Info Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, color: colorScheme.primary),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  t.tools.fileencryption.home_hint,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // File Selection Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.insert_drive_file, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "File Selection",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              if (selectedFile != null) ...[
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: selectedFileIsAesExtension()
                                        ? colorScheme.secondaryContainer
                                        : colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        selectedFileIsAesExtension()
                                            ? Icons.lock
                                            : Icons.description,
                                        color: selectedFileIsAesExtension()
                                            ? colorScheme.onSecondaryContainer
                                            : colorScheme.onPrimaryContainer,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          selectedFileName,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: selectedFileIsAesExtension()
                                                ? colorScheme.onSecondaryContainer
                                                : colorScheme.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton.icon(
                                  icon: const Icon(Icons.folder_open),
                                  label: Text(t.tools.fileencryption.pick_a_file),
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedFile = null;
                                      selectedFileName = t.tools.fileencryption.no_file_selected;
                                    });
                                    selectFileToEncrypt();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (selectedFile != null) ...[
                        const SizedBox(height: 16),
                        // Password Card
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.password, color: colorScheme.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      t.tools.fileencryption.encryption_password,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: colorScheme.surfaceVariant,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Enter password...",
                                    prefixIcon: Icon(Icons.lock_outline, color: colorScheme.onSurfaceVariant),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Action Button
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: Icon(selectedFileIsAesExtension() ? Icons.lock_open : Icons.lock),
                            label: Text(
                              selectedFileIsAesExtension()
                                  ? t.tools.fileencryption.decrypt
                                  : t.tools.fileencryption.encrypt,
                            ),
                            style: FilledButton.styleFrom(
                              backgroundColor: selectedFileIsAesExtension()
                                  ? colorScheme.secondary
                                  : colorScheme.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
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
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
        ),
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