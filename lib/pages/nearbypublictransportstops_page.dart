
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/core/http_requests.dart';
import 'package:toolbox/core/shared_preferences.dart';
import 'package:toolbox/core/url.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/nearbypublictransportstops_stationboard.dart';
import 'package:toolbox/models/nearbypublictransportstops_stop.dart';
import 'package:http/http.dart' as http;


class NearbyPublicTransportStopsPage extends StatefulWidget {
  const NearbyPublicTransportStopsPage({Key? key}) : super(key: key);

  @override
  State<NearbyPublicTransportStopsPage> createState() =>
      _NearbyPublicTransportStopsPage();
}

class _NearbyPublicTransportStopsPage extends State<NearbyPublicTransportStopsPage> {
  final String apiRootUrl = "https://transport.opendata.ch";

  late LocationPermission permission;

  final TextEditingController searchTextController = TextEditingController();

  bool isLoading = true;
  bool isLocationEnabled = false;
  String errorMessage = "";

  List<NearbyPublicTransportStopsStation> shownStops = [];
  List<NearbyPublicTransportStopsStation> emptySearchStops = [];

  bool initDialogAlreadyShown = false;
  Position? currentLocation;

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
    await deletePreviousVersionDownloadedFiles();
    await requestLocationPermission();
    await initCurrentPosition();
    await initPublicTransportNearbyStops();
    await sanitizePublicTransportShownStops();
    await initShouldShowInitDialog();
  }

  Future<void> deletePreviousVersionDownloadedFiles() async {
    final directory = await getApplicationSupportDirectory();
    const String csvFileName = "nearbypublictransportstops_stops.csv";
    const String csvVersionFileName = "nearbypublictransportstops_stops.version";

    final csvFile = File("${directory.path}/$csvFileName");
    final csvVersionFile = File("${directory.path}/$csvVersionFileName");

    if (await csvFile.exists()) {
      await csvFile.delete();
    }
    if (await csvVersionFile.exists()) {
      await csvVersionFile.delete();
    }
  }


  Future<void> initShouldShowInitDialog() async {
    var prefs = await SharedPreferences.getInstance();
    initDialogAlreadyShown = prefs.getBool(
        SHARED_PREFERENCES_TOOL_NEARBYPUBLICTRANSPORTSTOPS_FIRSTDIALOGSHOWN) ??
        false;
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
                  t.tools.nearbypublictransportstops.error
                      .location_permission_denied
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
      isLocationEnabled = true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void openMaps(double lat, double lon) {
    MapsLauncher.launchCoordinates(lat, lon);
  }

  Future<void> showInitDialog() async {
    if (!initDialogAlreadyShown) {
      showOkTextDialog(
          context,
          t.tools.nearbypublictransportstops.initial_dialog_title,
          t.tools.nearbypublictransportstops.initial_dialog_message(
              source: "Opendata.ch (Transport)")
      );
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool(
          SHARED_PREFERENCES_TOOL_NEARBYPUBLICTRANSPORTSTOPS_FIRSTDIALOGSHOWN,
          true
      );
    }
  }

  void showDataLicenseDialog() {
    List<TextButton> buttons = [
      TextButton(
        child: Text(
            t.tools.nearbypublictransportstops.data_license_dialog_open),
        onPressed: () {
          launchUrlInBrowser(
              "https://transport.opendata.ch"
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
        t.tools.nearbypublictransportstops.data_license_dialog_message(
            source: "Opendata.ch (Transport)",
            url: "https://transport.opendata.ch"),
        buttons);
  }

  void refreshPage() {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    errorMessage = "";
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
      return "${distance.toStringAsFixed(0)} m";
    } else {
      return "${(distance / 1000).toStringAsFixed(2)} km";
    }
  }

  Future<void> initPublicTransportNearbyStops() async {
    if (currentLocation == null) {
      return;
    }
    var url = "$apiRootUrl/v1/locations";
    var response = await httpGet(url, {
      "x": currentLocation!.latitude.toString(),
      "y": currentLocation!.longitude.toString(),
      "type": "station",
    }).onError((error, stackTrace) {
      errorMessage =
          t.tools.nearbypublictransportstops.error.check_internet_connection;
      return http.Response("", 503);
    });
    if (response.statusCode == 200) {
      if (response.body != "") {
        var json = response.body;
        if (json != "") {
          List<NearbyPublicTransportStopsStation> stops = [];
          var jsonList = jsonDecode(json)["stations"];
          for (var stop in jsonList) {
            stops.add(NearbyPublicTransportStopsStation.fromJson(stop));
          }
          emptySearchStops = stops;
          shownStops = emptySearchStops;
        } else {
          errorMessage =
              t.tools.nearbypublictransportstops.error.api_empty_response;
        }
      } else {
        errorMessage =
            t.tools.nearbypublictransportstops.error.api_empty_response;
      }
    } else if (errorMessage == "") {
      errorMessage = t.tools.nearbypublictransportstops.error.api_error_xxx(
          errorCode: response.statusCode);
    }
  }

  Future<void> sanitizePublicTransportShownStops() async {
    var sanitizedStops = <NearbyPublicTransportStopsStation>[];
    for (var stop in shownStops) {
      if (stop.id != null && stop.name != null && stop.coordinate?.x != null &&
          stop.coordinate?.y != null) {
        if (stop.distance == null && currentLocation != null) {
          var distance = Geolocator.distanceBetween(
              currentLocation!.latitude, currentLocation!.longitude,
              stop.coordinate!.x!, stop.coordinate!.y!);
          stop.distance = distance;
        }
        sanitizedStops.add(stop);
      }
    }
    sanitizedStops.sort((a, b) => (a.distance ?? 0).compareTo(b.distance ?? 0));
    shownStops = sanitizedStops;
  }

  Future<void> searchTransportStopsWithTerm(String term) async {
    term = term.trim();
    if (term.isEmpty || term == "") {
      shownStops = emptySearchStops;
      await sanitizePublicTransportShownStops();
      if (mounted) {
        setState(() {});
      }
      return;
    }
    var url = "$apiRootUrl/v1/locations";
    var response = await httpGet(url, {
      "query": term,
      "type": "station",
    }).onError((error, stackTrace) {
      errorMessage =
          t.tools.nearbypublictransportstops.error.check_internet_connection;
      if (mounted) {
        setState(() {});
      }
      return http.Response("", 503);
    });
    if (response.statusCode == 200) {
      if (response.body != "") {
        var json = response.body;
        if (json != "") {
          List<NearbyPublicTransportStopsStation> stops = [];
          var jsonList = jsonDecode(json)["stations"];
          for (var stop in jsonList) {
            stops.add(NearbyPublicTransportStopsStation.fromJson(stop));
          }
          shownStops = stops;
        } else {
          errorMessage =
              t.tools.nearbypublictransportstops.error.api_empty_response;
        }
      } else {
        errorMessage =
            t.tools.nearbypublictransportstops.error.api_empty_response;
      }
    } else if (errorMessage == "") {
      errorMessage = t.tools.nearbypublictransportstops.error.api_error_xxx(
          errorCode: response.statusCode);
    }
    await sanitizePublicTransportShownStops();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> showStationBoard(String id) async {
    showLoadingDialog(context);
    if (id.isEmpty) {
      return;
    }
    var url = "$apiRootUrl/v1/stationboard";
    var response = await httpGet(url, {
      "id": id,
    }).onError((error, stackTrace) {
      hideLoadingDialog(context);
      errorMessage =
          t.tools.nearbypublictransportstops.error.check_internet_connection;
      if (mounted) {
        setState(() {});
      }
      return http.Response("", 503);
    });
    if (response.statusCode == 200) {
      if (response.body != "") {
        var json = response.body;
        if (json != "") {
          var decodedJson = jsonDecode(json);
          NearbyPublicTransportStopsStation station = NearbyPublicTransportStopsStation
              .fromJson(decodedJson["station"]);
          var stationBoard = decodedJson["stationboard"];
          List<NearbyPublicTransportStopsStationboard> stationBoardList = [];
          for (var board in stationBoard) {
            stationBoardList.add(
                NearbyPublicTransportStopsStationboard.fromJson(board));
          }
          if (mounted) {
            hideLoadingDialog(context);
            showStationBoardDialog(context, station, stationBoardList);
          }
        } else {
          errorMessage =
              t.tools.nearbypublictransportstops.error.api_empty_response;
        }
      } else {
        errorMessage =
            t.tools.nearbypublictransportstops.error.api_empty_response;
      }
    } else if (errorMessage == "") {
      errorMessage = t.tools.nearbypublictransportstops.error.api_error_xxx(
          errorCode: response.statusCode);
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 8),
                Text(
                    t.tools.nearbypublictransportstops.loading,
                    textAlign: TextAlign.center
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showStationBoardDialog(BuildContext context,
      NearbyPublicTransportStopsStation station,
      List<NearbyPublicTransportStopsStationboard> stationBoardList) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(station.name ?? ""),
            content: SizedBox(
              width: double.maxFinite,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 500,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:
                  stationBoardList.isEmpty
                      ? Center(child: Text(
                    t.tools.nearbypublictransportstops.no_departures,
                    textAlign: TextAlign.center,))
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stationBoardList.length,
                    itemBuilder: (context, index) {
                      var board = stationBoardList[index];
                      return GestureDetector(
                        onTap: () {
                          showJourneyDetailsDialog(station, board);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "${board.category ?? ""}${board.number ??
                                    ""} - ${board.to ?? ""}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (board.stop?.departure != null)
                              SizedBox(
                                width: double.maxFinite,
                                child: Text(
                                    "${t.tools.nearbypublictransportstops
                                        .departure} ${formatTimeStamp(
                                        board.stop?.departureTimestamp ?? 0,
                                        true)}",
                                    textAlign: TextAlign.left
                                ),
                              ),
                            if (board.stop?.platform != null)
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                      "${t.tools.nearbypublictransportstops
                                          .platform} ${board.stop?.platform ??
                                          ""}",
                                      textAlign: TextAlign.left
                                  )
                              ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                child: Text(t.tools.nearbypublictransportstops.show_on_map),
                onPressed: () {
                  openMaps(
                      station.coordinate?.x ?? 0, station.coordinate?.y ?? 0
                  );
                },
              ),
              TextButton(
                child: Text(t.generic.ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void showJourneyDetailsDialog(NearbyPublicTransportStopsStation station,
      NearbyPublicTransportStopsStationboard board) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                "${board.category ?? ""}${board.number ?? ""} - ${board.to ??
                    ""}"),
            content: SizedBox(
              width: double.maxFinite,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (board.passList != null)
                        for (int i = 0; i < board.passList!.length; i++)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Text(
                                  i == 0 ? station.name ?? "" :
                                  board.passList?[i].station?.name ?? "",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (board.passList?[i].delay != null && board
                                  .passList![i].delay! > 1)
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    "+${board.passList?[i].delay}'",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                          Brightness.dark
                                          ? Colors.red[400]
                                          : Colors.red[900],
                                    ),
                                  ),
                                ),
                              if (board.passList?[i].arrival != null)
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                      "${t.tools.nearbypublictransportstops
                                          .arrival} ${formatTimeStamp(
                                          board.passList?[i].arrivalTimestamp ??
                                              0, false)}",
                                      textAlign: TextAlign.left
                                  ),
                                ),
                              if (board.passList?[i].departure != null)
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                      "${t.tools.nearbypublictransportstops
                                          .departure} ${formatTimeStamp(
                                          board.passList?[i]
                                              .departureTimestamp ?? 0,
                                          false)}",
                                      textAlign: TextAlign.left
                                  ),
                                ),
                              if (board.passList?[i].platform != null)
                                SizedBox(
                                    width: double.maxFinite,
                                    child: Text(
                                        "${t.tools.nearbypublictransportstops
                                            .platform} ${board.passList?[i]
                                            .platform ?? ""}",
                                        textAlign: TextAlign.left
                                    )
                                ),
                              const Divider(),
                            ],
                          ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                child: Text(t.generic.ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  String formatTimeStamp(int timestamp, bool showDate) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    if (showDate) {
      return "${date.hour.toString().padLeft(2, "0")}:${date.minute.toString()
          .padLeft(2, "0")} (${date.day.toString().padLeft(2, "0")}.${date.month
          .toString().padLeft(2, "0")}.${date.year})";
    } else {
      return "${date.hour.toString().padLeft(2, "0")}:${date.minute.toString()
          .padLeft(2, "0")}";
    }
  }

  String getStopIconImageAssetPath(NearbyPublicTransportStopsStation stop) {
    switch (stop.icon) {
      case "train":
        return "assets/images/specific/nearbypublictransportstops_train.png";
      case "bus":
        return "assets/images/specific/nearbypublictransportstops_bus.png";
      case "ship":
        return "assets/images/specific/nearbypublictransportstops_ship.png";
      case "tram":
        return "assets/images/specific/nearbypublictransportstops_tram.png";
      default:
        if (stop.name?.toLowerCase().contains("(funi)") ?? false) {
          return "assets/images/specific/nearbypublictransportstops_funi.png";
        }
        return "assets/images/specific/nearbypublictransportstops_unknown.png";
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
            title: Text(t.tools.nearbypublictransportstops.title),
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
                  : errorMessage != "" ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(errorMessage, textAlign: TextAlign.center,),),
              )
                  : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.generic.search,
                      ),
                      onChanged: (term) async {
                        await searchTransportStopsWithTerm(term);
                      },
                    ),
                  ),
                  Expanded(
                    child: shownStops.isNotEmpty
                        ? ListView.builder(
                      itemCount: shownStops.length,
                      itemBuilder: (context, index) {
                        var stop = shownStops[index];
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              showStationBoard(stop.id ?? "");
                            },
                            child: ListTile(
                              title: Text(stop.name ?? ""),
                              subtitle: isLocationEnabled
                                  ? Text(
                                  getFormattedDistanceString(
                                      stop.distance ?? 0))
                                  : null,
                              trailing: Image.asset(
                                  getStopIconImageAssetPath(stop),
                                  height: 40
                              ),
                            ),
                          ),
                        );
                      },
                    ) : searchTextController.text.trim().isNotEmpty
                        ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            t.tools.nearbypublictransportstops.error
                                .no_stops_found,
                            textAlign: TextAlign.center
                        ),
                      ),
                    )
                        : !isLocationEnabled ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            t.tools.nearbypublictransportstops.error
                                .location_permission_denied,
                            textAlign: TextAlign.center
                        ),
                      ),
                    ) : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            t.tools.nearbypublictransportstops.error
                                .no_stops_found,
                            textAlign: TextAlign.center
                        ),
                      ),
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}