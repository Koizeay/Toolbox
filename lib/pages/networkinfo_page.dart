import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoPage extends StatefulWidget {
  const NetworkInfoPage({ Key? key }) : super(key: key);
  @override
  State<NetworkInfoPage> createState() => _NetworkInfoPage();
}

class _NetworkInfoPage extends State<NetworkInfoPage> {
  String publicIpAddress = "Loading...";
  String localIpAddress = "Loading...";
  String localSubmask = "Loading...";
  String localGatewayIP = "Loading...";
  String localBroadcastIP = "Loading...";
  String wifiName = "Loading...";
  String wifiBSSID = "Loading...";

  @override
  void initState() {
    askForPermission().then((value) {
      getIpAddress();
      getWifiInfo();
    });
    super.initState();
  }

  Future<void> askForPermission() async {
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
      http.Response response = await http.get(Uri.parse("https://jsonip.com/"));
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
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic.app_name} - ${t.tools.networkinfo.title}"),
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
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${t.tools.networkinfo.public_ip} :\n$publicIpAddress",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                            const Divider(
                              color: Colors.greenAccent, thickness: 3,),
                            Text(
                                "${t.tools.networkinfo.local_ip} :\n$localIpAddress",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                            const Divider(
                              color: Colors.greenAccent, thickness: 0.5,),
                            Text(
                                "${t.tools.networkinfo.local_subnet_mask} :\n$localSubmask",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                            const Divider(
                              color: Colors.greenAccent, thickness: 0.5,),
                            Text(
                                "${t.tools.networkinfo.local_gateway_ip} :\n$localGatewayIP",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                            const Divider(
                              color: Colors.greenAccent, thickness: 0.5,),
                            Text(
                                "${t.tools.networkinfo.local_broadcast_ip} :\n$localBroadcastIP",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                            const Divider(
                              color: Colors.greenAccent, thickness: 0.5,),
                            Text(
                                "${t.tools.networkinfo.wifi_name} :\n$wifiName",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                            const Divider(
                              color: Colors.greenAccent, thickness: 0.5,),
                            Text(
                                "${t.tools.networkinfo.wifi_bssid} :\n$wifiBSSID",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                        t.tools.networkinfo.note_location_permission,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.black
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