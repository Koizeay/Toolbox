import 'dart:io';

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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.sshclient.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            loading
              ? Container()
              : isConnected
                ? IconButton(
                    icon: const Icon(Icons.backspace_outlined),
                    tooltip: t.tools.sshclient.backspace,
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          shell?.stdin.add(Uint8List.fromList("\x7F".codeUnits));
                        });
                      }
                    },
                  )
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
            : loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Connection Info Card
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
                                  Icon(Icons.dns, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Connection",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: hostController,
                                autocorrect: false,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  labelText: t.tools.sshclient.host,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.computer, color: colorScheme.onSurfaceVariant),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextField(
                                      controller: usernameController,
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      decoration: InputDecoration(
                                        labelText: t.tools.sshclient.username,
                                        filled: true,
                                        fillColor: colorScheme.surfaceVariant,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Icon(Icons.person, color: colorScheme.onSurfaceVariant),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      controller: portController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      decoration: InputDecoration(
                                        labelText: t.tools.sshclient.port,
                                        filled: true,
                                        fillColor: colorScheme.surfaceVariant,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Icon(Icons.numbers, color: colorScheme.onSurfaceVariant),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Authentication Card
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
                                  Icon(
                                    usingSshKey ? Icons.key : Icons.lock,
                                    color: colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Authentication",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      usingSshKey ? "SSH Key" : "Password",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              if (usingSshKey) ...[
                                OutlinedButton.icon(
                                  onPressed: () {
                                    selectSshPrivateKey().then((value) {
                                      if (mounted) {
                                        setState(() {
                                          sshPrivateKey = value;
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    sshPrivateKey != null ? Icons.check_circle : Icons.upload_file,
                                    color: sshPrivateKey != null ? colorScheme.primary : null,
                                  ),
                                  label: Text(t.tools.sshclient.select_private_key),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: colorScheme.surfaceVariant,
                                    side: BorderSide.none,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceVariant.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        sshPrivateKey != null ? Icons.insert_drive_file : Icons.info_outline,
                                        size: 16,
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          sshPrivateKeyFileName ?? t.tools.sshclient.no_private_key_selected,
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextField(
                                  controller: passphraseController,
                                  obscureText: true,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  decoration: InputDecoration(
                                    labelText: t.tools.sshclient.passphrase,
                                    filled: true,
                                    fillColor: colorScheme.surfaceVariant,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(Icons.vpn_key, color: colorScheme.onSurfaceVariant),
                                  ),
                                ),
                              ] else ...[
                                TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  decoration: InputDecoration(
                                    labelText: t.tools.sshclient.password,
                                    filled: true,
                                    fillColor: colorScheme.surfaceVariant,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(Icons.lock, color: colorScheme.onSurfaceVariant),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Connect Button
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            connectToSsh();
                          },
                          icon: const Icon(Icons.power),
                          label: Text(t.tools.sshclient.connect),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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