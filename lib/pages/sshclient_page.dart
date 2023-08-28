import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:xterm/core.dart';
import 'package:xterm/ui.dart';

class SshClientPage extends StatefulWidget {
  const SshClientPage({ Key? key }) : super(key: key);
  @override
  State<SshClientPage> createState() => _SshClientPage();
}

class _SshClientPage extends State<SshClientPage> {
  bool isConnected = false;
  bool loading = false;
  TextEditingController hostController = TextEditingController();
  TextEditingController portController = TextEditingController(text: "22");
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Terminal? terminal;
  SSHClient? client;
  SSHSession? shell;

  @override
  void dispose() {
    shell?.kill(SSHSignal.QUIT);
    client?.close();
    super.dispose();
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

  Future<void> connectToSsh() async {
    String host = hostController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    int port = 22;
    try {
      port = int.parse(portController.text);
    } catch (e) {
      showOkTextDialog(context, t.generic.error, t.tools.sshclient.error.invalid_port);
      return;
    }
    try {
      await initSshClient(host, username, password, port);
      terminal = Terminal();
      initTerminal();
      if (mounted) {
        setState(() {
          isConnected = true;
        });
      }
    } on SSHAuthFailError catch (e) {
      showOkTextDialog(context, t.generic.error, t.tools.sshclient.error.authentication_failed);
    } catch (e) {
      showOkTextDialog(context, t.generic.error, t.tools.sshclient.error.connection_failed);
    } finally {
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
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic.app_name} - ${t.tools.sshclient.title}"),
        ),
        body: SafeArea(
          child: isConnected
              ? TerminalView(terminal ?? Terminal())
              : loading ? const Center(child: CircularProgressIndicator())
              : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: hostController,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    hintText: t.tools.sshclient.host
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
                    hintText: t.tools.sshclient.port,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: usernameController,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    hintText: t.tools.sshclient.username,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    hintText: t.tools.sshclient.password,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    connectToSsh();
                  },
                  child: Text(t.tools.sshclient.connect),
                ),
                const SizedBox(height: 8),
                Text(
                    t.tools.sshclient.note_key_auth_not_supported,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )
    );
  }
}