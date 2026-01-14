
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
  final List<int> _pingTimes = [];
  final TextEditingController _hostController = TextEditingController();
  Ping? ping;
  StreamSubscription<PingData>? pingListener;
  double? _averagePing;

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
          _pingTimes.add(event.response!.time!.inMilliseconds);
        }
        resultString = t.tools.ping.reply_from_host_time_ttl(host: host, time: timeMs, ttl: ttl);
      } else if (event.summary != null) {
        String packetTransmitted = "?";
        String packetReceived = "?";
        packetTransmitted = "${event.summary!.transmitted}";
        packetReceived = "${event.summary!.received}";
        resultString =
        t.tools.ping.x_packets_transmitted_y(transmitted: packetTransmitted, received: packetReceived);

        // Calculate average ping
        if (_pingTimes.isNotEmpty) {
          _averagePing = _pingTimes.reduce((a, b) => a + b) / _pingTimes.length;
        }
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
      _pingTimes.clear();
      _averagePing = null;
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.ping.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _hostController,
                          decoration: InputDecoration(
                            labelText: t.tools.ping.enter_a_domain_name_or_ip,
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.signal_cellular_alt, color: colorScheme.onSurfaceVariant),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: pingPressed,
                            icon: const Icon(Icons.radar),
                            label: Text(t.tools.ping.ping),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (_results.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Results",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: _results.length,
                                      separatorBuilder: (context, index) => const Divider(),
                                      itemBuilder: (context, index) {
                                        final result = _results[index];
                                        final isError = result.contains(t.generic.error);

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4),
                                          child: Row(
                                            children: [
                                              Icon(
                                                isError ? Icons.error_outline : Icons.check_circle_outline,
                                                color: isError ? colorScheme.error : colorScheme.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Text(
                                                  result,
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    fontFamily: 'monospace',
                                                    color: isError ? colorScheme.error : null,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_averagePing != null) ...[
                          const SizedBox(height: 12),
                          Card(
                            elevation: 2,
                            color: colorScheme.primaryContainer,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.speed, color: colorScheme.onPrimaryContainer),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Average Ping: ",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${_averagePing!.toStringAsFixed(1)} ms",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 16),
                      ],
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