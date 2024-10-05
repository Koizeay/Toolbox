import 'dart:io';
import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:xterm/core.dart';
import 'package:xterm/ui.dart';

class SshClientPage extends StatefulWidget {
  const SshClientPage({ super.key });
  @override
  State<SshClientPage> createState() => _SshClientPage();
}

class _SshClientPage extends State<SshClientPage> {
  bool usingSshKey = false;
  bool isConnected = false;
  bool loading = false;
  File? sshPrivateKey;
  String? sshPrivateKeyFileName;

  TextEditingController hostController = TextEditingController();
  TextEditingController portController = TextEditingController(text: "22");
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passphraseController = TextEditingController();

  Terminal? terminal;
  SSHClient? client;
  SSHSession? shell;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadPreferences();
    });
  }

  @override
  void dispose() {
    shell?.kill(SSHSignal.QUIT);
    client?.close();
    super.dispose();
  }

  Future<void> loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        usingSshKey =
            prefs.getBool(SHARED_PREFERENCES_TOOL_SSHCLIENT_USINGKEY) ?? false;
        hostController.text =
            prefs.getString(SHARED_PREFERENCES_TOOL_SSHCLIENT_HOST) ?? "";
        usernameController.text =
            prefs.getString(SHARED_PREFERENCES_TOOL_SSHCLIENT_USERNAME) ?? "";
        portController.text =
            prefs.getInt(SHARED_PREFERENCES_TOOL_SSHCLIENT_PORT)?.toString() ??
                "22";
      });
    }
  }

  void initTerminal() {
    terminal?.onOutput = (output) {
      if (mounted) {
        Uint8List data = Uint8List.fromList(output.codeUnits);
        shell?.write(data);
      }
    };
    terminal?.onResize = ((w, h, pw, ph) {
      shell?.resizeTerminal(w, h);
    });
  }

  Future<void> initSshClient(String host, String username, String password,
      int port) async {
    client = SSHClient(
      await SSHSocket.connect(host, port),
      username: username,
      onPasswordRequest: () => password,
    );
    shell = await client?.shell();
    shell?.stdout.listen((data) {
      String dataString = String.fromCharCodes(data);
      terminal?.write(dataString);
    });
  }

  Future<void> initShhClientWithKeys(String host, String username,
      String privateKeyString, String? keyPassphrase, int port) async {
    client = SSHClient(
        await SSHSocket.connect(host, port),
        username: username,
        identities: SSHKeyPair.fromPem(privateKeyString, keyPassphrase)
    );
    shell = await client?.shell();
    shell?.stdout.listen((data) {
      String dataString = String.fromCharCodes(data);
      terminal?.write(dataString);
    });
  }

  Future<File?> selectSshPrivateKey() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      sshPrivateKeyFileName = result.files.single.name;
      return File(result.files.single.path ?? "");
    }
    return null;
  }

  Future<void> connectToSsh() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String host = hostController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    int port = 22;

    try {
      port = int.parse(portController.text);
    } catch (e) {
      if (mounted) {
        showOkTextDialog(
            context, t.generic.error, t.tools.sshclient.error.invalid_port);
      }
      return;
    }
    try {
      if (usingSshKey) {
        String? passphrase = passphraseController.text == ""
            ? null
            : passphraseController.text;
        await initShhClientWithKeys(
            host, username, await sshPrivateKey?.readAsString() ?? "", passphrase,
            port);
      } else {
        await initSshClient(host, username, password, port);
      }
      terminal = Terminal();
      initTerminal();

      await prefs.setBool(SHARED_PREFERENCES_TOOL_SSHCLIENT_USINGKEY, usingSshKey);
      await prefs.setString(SHARED_PREFERENCES_TOOL_SSHCLIENT_HOST, host);
      await prefs.setString(
          SHARED_PREFERENCES_TOOL_SSHCLIENT_USERNAME, username);
      await prefs.setInt(SHARED_PREFERENCES_TOOL_SSHCLIENT_PORT, port);

      if (mounted) {
        setState(() {
          isConnected = true;
        });
      }
    } on SSHAuthFailError catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.sshclient.error.authentication_failed);
      }
    } on ArgumentError catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.sshclient.error.invalid_passphrase);
      }
    } on FormatException catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.sshclient.error.invalid_private_key);
      }
    } on SSHKeyDecryptError catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.sshclient.error.invalid_passphrase);
      }
    } on SocketException catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.sshclient.error.connection_failed);
      }
    } catch (e) {
      if (mounted) {
        showOkTextDialog(context, t.generic.error,
            t.tools.sshclient.error.unknown_error);
      }
    } finally {
      passwordController.text = "";
      passphraseController.text = "";
      sshPrivateKeyFileName = null;
      sshPrivateKey = null;

      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
    await shell?.done;
    client?.close();
    if (mounted) {
      setState(() {
        isConnected = false;
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
            title: Text(t.tools.sshclient.title),
            actions: [ isConnected || loading
                ? Container()
                : IconButton(
                icon: Icon(usingSshKey ? Icons.password : Icons.key),
                tooltip: usingSshKey ? t.tools.sshclient.use_password : t.tools.sshclient.use_ssh_key,
                onPressed: () {
                  setState(() {
                    usingSshKey = !usingSshKey;
                  });
                },
              )
            ],
          ),
          body: SafeArea(
            child: isConnected
                ? TerminalView(terminal ?? Terminal())
                : loading ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: hostController,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: t.tools.sshclient.host
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: portController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.tools.sshclient.port,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: usernameController,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.tools.sshclient.username,
                      ),
                    ),
                    const SizedBox(height: 8),
                    usingSshKey
                        ? Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: () {
                                selectSshPrivateKey().then((value) {
                                  if (mounted) {
                                    setState(() {
                                      sshPrivateKey = value;
                                    });
                                  }
                                });
                              },
                              child: Text(t.tools.sshclient.select_private_key)
                          ),
                        ),
                        Text(
                          sshPrivateKeyFileName ?? t.tools.sshclient.no_private_key_selected,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: passphraseController,
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.tools.sshclient.passphrase,
                          ),
                        ),
                      ],
                    )
                        : TextField(
                      controller: passwordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.tools.sshclient.password,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          connectToSsh();
                        },
                        child: Text(t.tools.sshclient.connect),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}