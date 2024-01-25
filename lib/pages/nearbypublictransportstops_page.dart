import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fast_csv/fast_csv.dart' as fast_csv;
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/online_file.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/nearbypublictransportstops_stop.dart';


class NearbyPublicTransportStopsPage extends StatefulWidget {
  const NearbyPublicTransportStopsPage({Key? key}) : super(key: key);

  @override
  State<NearbyPublicTransportStopsPage> createState() =>
      _NearbyPublicTransportStopsPage();
}

class _NearbyPublicTransportStopsPage
    extends State<NearbyPublicTransportStopsPage> {
  final String csvFileUrl = "https://raw.githubusercontent.com/Koizeay/Sharing/main/Toolbox/nearbypublictransportstops_stops.csv";
  final String csvVersionFileUrl = "https://raw.githubusercontent.com/Koizeay/Sharing/main/Toolbox/nearbypublictransportstops_stops.version";

  final String csvFileName = "nearbypublictransportstops_stops.csv";
  final String csvVersionFileName = "nearbypublictransportstops_stops.version";

  bool isLoading = true;
  String error = "";
  List<NearbyPublicTransportStopsStop> stops = [];
  List<NearbyPublicTransportStopsStop> allStops = [];
  String csvFileContents = "";
  late LocationPermission permission;
  Position? currentLocation;
  bool initDialogAlreadyShown = false;

  @override
  void initState() {
    isLoading = true;
    initPage().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
          showInitDialog();
        });
      }
    });
    super.initState();
  }

  Future<void> initPage() async {
    await downloadCsvFile();
    await requestLocationPermission();
    await initCurrentPosition();
    await initPublicTransportStops();
    await initShouldShowInitDialog();
  }

  Future<void> downloadCsvFile() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    final directory = await getApplicationSupportDirectory();
    final filePath = "${directory.path}/$csvFileName";
    final versionFilePath = "${directory.path}/$csvVersionFileName";
    var file = File(filePath);
    if (await file.exists()) {
      if (connectivityResult == ConnectivityResult.none || await csvFileVersionIsUpToDate()) {
        csvFileContents = await file.readAsString();
        return;
      } else {
        await file.delete();
      }
    }
    try {
      await downloadFile(csvFileUrl, filePath);
      await downloadFile(csvVersionFileUrl, versionFilePath);
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          error = t.tools.nearbypublictransportstops.error.download_stops_failed;
        });
      }
    }
    try {
      csvFileContents = await file.readAsString();
    } catch (e) {
      if (error == "") {
        if (mounted) {
          setState(() {
            isLoading = false;
            error = t.tools.nearbypublictransportstops.error.read_stops_failed;
          });
        }
      }
    }
  }

  Future<bool> csvFileVersionIsUpToDate() async {
    final directory = await getApplicationSupportDirectory();
    final filePath = "${directory.path}/$csvVersionFileName";
    var file = File(filePath);
    if (await file.exists()) {
      try {
        String version = await file.readAsString();
        String currentVersion = await getOnlineFileTextContent(csvVersionFileUrl);
        return version == currentVersion;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return false;
  }

  Future<void> initShouldShowInitDialog() async {
    var prefs = await SharedPreferences.getInstance();
    initDialogAlreadyShown = prefs.getBool(
        SHARED_PREFERENCES_TOOL_NEARBYPUBLICTRANSPORTSTOPS_FIRSTDIALOGSHOWN) ?? false;
  }

  Future<void> requestLocationPermission() async {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  t.tools.nearbypublictransportstops.error.location_permission_denied
              ),
            )
        );
      }
    }
  }

  Future<void> initCurrentPosition() async {
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      return;
    }
    try {
      currentLocation = await Geolocator.getCurrentPosition();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> initPublicTransportStops() async {
    Map arguments = {};
    arguments["csvFileContents"] = csvFileContents;
    arguments["currentLocation"] = currentLocation;

    final parsed = await compute(
        parseCsv,
        arguments
    );

    if (parsed == []) {
      if (mounted) {
        setState(() {
          isLoading = false;
          error = t.tools.nearbypublictransportstops.error.parse_stops_failed;
        });
      }
      return;
    }

    if (currentLocation != null) {
      parsed.sort((a, b) {
        double distanceA = Geolocator.distanceBetween(
            currentLocation?.latitude ?? 0,
            currentLocation?.longitude ?? 0,
            a.lat,
            a.lon
        );
        double distanceB = Geolocator.distanceBetween(
            currentLocation?.latitude ?? 0,
            currentLocation?.longitude ?? 0,
            b.lat,
            b.lon
        );
        return distanceA.compareTo(distanceB);
      });
    } else {
      parsed.sort((a, b) {
        return a.name.compareTo(b.name);
      });
    }
    setState(() {
      stops = parsed;
      allStops = parsed;
    });
  }

  void filterStops(String term) {
    setState(() {
      stops = allStops.where((stop) =>
          stop.name.toLowerCase().contains(
              term.toLowerCase()
          )).toList();
    });
  }

  void openMaps(double lat, double lon) {
    MapsLauncher.launchCoordinates(lat, lon);
  }

  Future<void> showInitDialog() async {
    if (!initDialogAlreadyShown) {
      showOkTextDialog(
          context,
          t.tools.nearbypublictransportstops.initial_dialog_title,
          t.tools.nearbypublictransportstops.initial_dialog_message(source: "Open data platform mobility Switzerland")
      );
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool(
          SHARED_PREFERENCES_TOOL_NEARBYPUBLICTRANSPORTSTOPS_FIRSTDIALOGSHOWN, true
      );
    }
  }

  void showDataLicenseDialog() {
    List<TextButton> buttons = [
      TextButton(
        child: Text(t.tools.nearbypublictransportstops.data_license_dialog_open),
        onPressed: () {
          launchUrlInBrowser(
              "https://opentransportdata.swiss/"
          );
        },
      ),
      TextButton(
        child: Text(t.generic.ok),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
    showCustomButtonsTextDialog(
        context,
        t.tools.nearbypublictransportstops.data_license_dialog_title,
        t.tools.nearbypublictransportstops.data_license_dialog_message(source: "Open data platform mobility Switzerland", url: "https://opentransportdata.swiss/"),
        buttons);
  }

  void refreshPage() {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    initPage().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  String getFormattedDistanceString(double distance) {
    if (distance < 1000) {
      return "${distance.toStringAsFixed(2)} m";
    } else {
      return "${(distance / 1000).toStringAsFixed(2)} km";
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
            title: Text("${t.generic.app_name} - ${t.tools.nearbypublictransportstops.title}"),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: t.tools.nearbypublictransportstops.refresh,
                onPressed: () {
                  refreshPage();
                },
              ),
              IconButton(
                icon: const Icon(Icons.copyright),
                tooltip: t.tools.nearbypublictransportstops.data_source,
                onPressed: () {
                  showDataLicenseDialog();
                },
              ),
            ],
          ),
          body: SafeArea(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : error != "" ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(error, textAlign: TextAlign.center,),),
                  )
                  : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.generic.search,
                      ),
                      onChanged: (term) {
                        filterStops(term);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: stops.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            openMaps(stops[index].lat, stops[index].lon);
                          },
                          title: Text(stops[index].name),
                          subtitle: currentLocation == null
                              ? Container()
                              : Text(
                              getFormattedDistanceString(stops[index].distance)
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}

Future<List<NearbyPublicTransportStopsStop>> parseCsv(Map arguments) async {
  var parsed = [];
  try {
    parsed = fast_csv.parse(arguments["csvFileContents"]);
  } catch (e) {
    if (kDebugMode) {
      print("Error parsing CSV: $e");
    }
    return [];
  }
  List<NearbyPublicTransportStopsStop> stops = [];

  for (var row in parsed) {
    try {
      double lat = double.parse(row[2]);
      double lon = double.parse(row[3]);
      double distance = Geolocator.distanceBetween(
          arguments["currentLocation"]?.latitude ?? 0,
          arguments["currentLocation"]?.longitude ?? 0,
          lat,
          lon
      );
      if (!stops.any((stop) =>
      stop.name == row[1] || (stop.lat == lat && stop.lon == lon))) {
        stops.add(
            NearbyPublicTransportStopsStop(row[0], row[1], lat, lon, distance)
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing row: $row");
      }
    }
  }
  if (kDebugMode) {
    print("Parsed ${stops.length} stops");
  }
  return stops;
}