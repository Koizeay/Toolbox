import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/core/http_requests.dart';
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
      http.Response response = await httpGet(apiEndpoint, {})
          .timeout(const Duration(seconds: 5));
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

  Widget _buildInfoCard(BuildContext context, String label, String value, IconData icon, {bool highlighted = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: highlighted ? 3 : 2,
      color: highlighted ? colorScheme.primaryContainer : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          if (value != "Loading..." && value != "?") {
            Clipboard.setData(ClipboardData(text: value));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$label copied to clipboard"),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: highlighted ? colorScheme.primary : colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: highlighted ? colorScheme.onPrimary : colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: highlighted ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: highlighted ? colorScheme.onPrimaryContainer : colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(t.tools.networkinfo.title),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildInfoCard(
                context,
                t.tools.networkinfo.public_ip,
                publicIpAddress,
                Icons.public,
                highlighted: true,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                context,
                t.tools.networkinfo.local_ip,
                localIpAddress,
                Icons.devices,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                context,
                t.tools.networkinfo.local_subnet_mask,
                localSubmask,
                Icons.security,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                context,
                t.tools.networkinfo.local_gateway_ip,
                localGatewayIP,
                Icons.router,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                context,
                t.tools.networkinfo.local_broadcast_ip,
                localBroadcastIP,
                Icons.broadcast_on_home,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                context,
                t.tools.networkinfo.wifi_name,
                wifiName,
                Icons.wifi,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                context,
                t.tools.networkinfo.wifi_bssid,
                wifiBSSID,
                Icons.fingerprint,
              ),
              if (!Platform.isIOS) ...[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    t.tools.networkinfo.note_location_permission,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}