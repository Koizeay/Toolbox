import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoPage extends StatefulWidget {
  const NetworkInfoPage({ super.key });
  @override
  State<NetworkInfoPage> createState() => _NetworkInfoPage();
}

class _NetworkInfoPage extends State<NetworkInfoPage> {
  final String apiEndpoint = "https://toolbox.koizeay.com/networkinfo/ip";
  
  String publicIpAddress = "Loading...";
  String localIpAddress = "Loading...";
  String localSubmask = "Loading...";
  String localGatewayIP = "Loading...";
  String localBroadcastIP = "Loading...";
  String wifiName = "Loading...";
  String wifiBSSID = "Loading...";

  @override
  void initState() {
    askForLocationPermission().then((value) {
      getIpAddress();
      getWifiInfo();
    });
    super.initState();
  }

  Future<void> askForLocationPermission() async {
    if (Platform.isIOS) {
      return;
    }
    if (await Permission.location
        .request()
        .isDenied &&
        await Permission.locationWhenInUse
            .request()
            .isDenied &&
        await Permission.locationAlways
            .request()
            .isDenied) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.tools.networkinfo.location_permission_required),
        ));
      }
    }
  }

  Future<void> getIpAddress() async {
    try {
      http.Response response = await http.get(Uri.parse(apiEndpoint));
      var json = jsonDecode(response.body);
      publicIpAddress = json["ip"];
    } catch (e) {
      publicIpAddress = "?";
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getWifiInfo() async {
    final NetworkInfo networkInfo = NetworkInfo();
    localIpAddress = await networkInfo.getWifiIP() ?? "?";
    localSubmask = await networkInfo.getWifiSubmask() ?? "?";
    localGatewayIP = await networkInfo.getWifiGatewayIP() ?? "?";
    localBroadcastIP = await networkInfo.getWifiBroadcast() ?? "?";
    wifiName = await networkInfo.getWifiName() ?? "?";
    wifiBSSID = await networkInfo.getWifiBSSID() ?? "?";
    if (Platform.isIOS) {
      wifiName = t.tools.networkinfo.not_available_on_ios;
      wifiBSSID = t.tools.networkinfo.not_available_on_ios;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.tools.networkinfo.title}"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).colorScheme.secondary,
                                blurRadius: 2,
                                spreadRadius: 0.5,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${t.tools.networkinfo.public_ip}\n$publicIpAddress",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            Divider(thickness: 2, color: Theme.of(context).colorScheme.secondary),
                            Text(
                                "${t.tools.networkinfo.local_ip}\n$localIpAddress",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            Divider(thickness: 0.5, color: Theme.of(context).colorScheme.secondary),
                            Text(
                                "${t.tools.networkinfo.local_subnet_mask}\n$localSubmask",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            Divider(thickness: 0.5, color: Theme.of(context).colorScheme.secondary),
                            Text(
                                "${t.tools.networkinfo.local_gateway_ip}\n$localGatewayIP",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            Divider(thickness: 0.5, color: Theme.of(context).colorScheme.secondary),
                            Text(
                                "${t.tools.networkinfo.local_broadcast_ip}\n$localBroadcastIP",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            Divider(thickness: 0.5, color: Theme.of(context).colorScheme.secondary),
                            Text(
                                "${t.tools.networkinfo.wifi_name}\n$wifiName",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            Divider(thickness: 0.5, color: Theme.of(context).colorScheme.secondary),
                            Text(
                                "${t.tools.networkinfo.wifi_bssid}\n$wifiBSSID",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Platform.isIOS ? Container() : Text(
                        t.tools.networkinfo.note_location_permission,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic
                        )
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