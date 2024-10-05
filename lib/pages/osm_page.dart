
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toolbox/gen/strings.g.dart';

class OsmPage extends StatefulWidget {
  const OsmPage({ super.key });
  @override
  State<OsmPage> createState() => _OsmPage();
}

class _OsmPage extends State<OsmPage> {
  bool _loaded = false;

  MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 47.0, longitude: 10.0),
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () {
      _loaded = Platform.isIOS;
      if (!_loaded) {
        showLoadingDialog();
      }
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
                Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> goToUserLocation() async {
    if (!await Permission.location.request().isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            content: Text(t.tools.osm.error.location_permission_denied)
          ),
        );
      }
      return;
    }
    if (!await Geolocator.isLocationServiceEnabled()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            content: Text(t.tools.osm.error.location_services_disabled),
            action: SnackBarAction(
              label: t.generic.enable,
              textColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Geolocator.openLocationSettings();
              },
            ),
          ),
        );
      }
      return;
    }
    Position position = await Geolocator.getCurrentPosition();
    GeoPoint geoPoint = GeoPoint(latitude: position.latitude, longitude: position.longitude);
    mapController.moveTo(geoPoint);
    mapController.setZoom(zoomLevel: 18.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.osm.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.my_location),
                tooltip: t.tools.osm.go_to_my_location,
                onPressed: () async {
                  await goToUserLocation();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: OSMFlutter(
              controller: mapController,
              osmOption: const OSMOption(
                enableRotationByGesture: false,
                showContributorBadgeForOSM: true,
                zoomOption: ZoomOption(
                  initZoom: 3,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
              ),
              onMapIsReady: (_) {
                if(!_loaded) {
                  Navigator.of(context).pop();
                  _loaded = true;
                } else {
                  _loaded = true;
                }
              },
            ),
          )
      ),
    );
  }
}