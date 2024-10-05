
import 'dart:async';

import 'package:dart_ping/dart_ping.dart';
import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class PingPage extends StatefulWidget {
  const PingPage({ super.key });
  @override
  State<PingPage> createState() => _PingPage();
}

class _PingPage extends State<PingPage> {
  final List<String> _results = [];
  final TextEditingController _hostController = TextEditingController();
  Ping? ping;
  StreamSubscription<PingData>? pingListener;

  Future<void> pingHost(String host) async {
    ping = Ping(host, count: 5);
    pingListener = ping?.stream.listen((event) {
      String resultString = "";
      if (event.error != null) {
        String errorMsg = t.tools.ping.error.unkown_error;
        switch(event.error?.error) {
          case ErrorType.requestTimedOut:
            errorMsg = t.tools.ping.error.request_timeout;
            break;
          case ErrorType.unknownHost:
            errorMsg = t.tools.ping.error.unkown_host;
            break;
          case ErrorType.noReply:
            errorMsg = t.tools.ping.error.no_reply;
            break;
          default:
            errorMsg = t.tools.ping.error.unkown_error;
            break;
        }
        resultString = "${t.generic.error}: $errorMsg";
      } else if (event.response != null) {
        String ttl = "?";
        String timeMs = "?";
        if (event.response!.ttl != null) {
          ttl = "${event.response!.ttl}";
        }
        if (event.response!.time != null) {
          timeMs = "${event.response!.time!.inMilliseconds}";
        }
        resultString = t.tools.ping.reply_from_host_time_ttl(host: host, time: timeMs, ttl: ttl);
      } else if (event.summary != null) {
        String packetTransmitted = "?";
        String packetReceived = "?";
        packetTransmitted = "${event.summary!.transmitted}";
        packetReceived = "${event.summary!.received}";
        resultString =
        t.tools.ping.x_packets_transmitted_y(transmitted: packetTransmitted, received: packetReceived);
      }
      setState(() {
        _results.add(resultString);
      });
    });
  }

  void pingPressed() {
    pingListener?.cancel();
    setState(() {
      _results.clear();
    });
    if (_hostController.text.isEmpty) {
      showOkTextDialog(context, t.generic.error,
          t.tools.ping.error.please_enter_a_domain_name_or_ip);
      return;
    }
    pingHost(_hostController.text);
  }

  @override
  void initState() {
    DartPingIOS.register();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.ping.title),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.tools.ping.enter_a_domain_name_or_ip,
                      ),
                      controller: _hostController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          child: Text(t.tools.ping.ping),
                          onPressed: () {
                            pingPressed();
                          }
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_results[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}