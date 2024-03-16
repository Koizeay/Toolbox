class NearbyPublicTransportStopsStationBoardResponse {
  List<NearbyPublicTransportStopsStationboard>? stationboard;

  NearbyPublicTransportStopsStationBoardResponse({this.stationboard});

  NearbyPublicTransportStopsStationBoardResponse.fromJson(
      Map<String, dynamic> json) {
    if (json['stationboard'] != null) {
      stationboard = <NearbyPublicTransportStopsStationboard>[];
      json['stationboard'].forEach((v) {
        stationboard!.add(NearbyPublicTransportStopsStationboard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stationboard != null) {
      data['stationboard'] = stationboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearbyPublicTransportStopsStationboard {
  Stop? stop;
  String? name;
  String? category;
  Null subcategory;
  Null categoryCode;
  String? number;
  String? operator;
  String? to;
  List<PassList>? passList;
  Null capacity1st;
  Null capacity2nd;

  NearbyPublicTransportStopsStationboard(
      {this.stop,
      this.name,
      this.category,
      this.subcategory,
      this.categoryCode,
      this.number,
      this.operator,
      this.to,
      this.passList,
      this.capacity1st,
      this.capacity2nd});

  NearbyPublicTransportStopsStationboard.fromJson(Map<String, dynamic> json) {
    stop = json['stop'] != null ? Stop.fromJson(json['stop']) : null;
    name = json['name'];
    category = json['category'];
    subcategory = json['subcategory'];
    categoryCode = json['categoryCode'];
    number = json['number'];
    operator = json['operator'];
    to = json['to'];
    if (json['passList'] != null) {
      passList = <PassList>[];
      json['passList'].forEach((v) {
        passList!.add(PassList.fromJson(v));
      });
    }
    capacity1st = json['capacity1st'];
    capacity2nd = json['capacity2nd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stop != null) {
      data['stop'] = stop!.toJson();
    }
    data['name'] = name;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['categoryCode'] = categoryCode;
    data['number'] = number;
    data['operator'] = operator;
    data['to'] = to;
    if (passList != null) {
      data['passList'] = passList!.map((v) => v.toJson()).toList();
    }
    data['capacity1st'] = capacity1st;
    data['capacity2nd'] = capacity2nd;
    return data;
  }
}

class Stop {
  Station? station;
  String? arrival;
  int? arrivalTimestamp;
  String? departure;
  int? departureTimestamp;
  int? delay;
  String? platform;
  Prognosis? prognosis;
  Null realtimeAvailability;
  Station? location;

  Stop(
      {this.station,
      this.arrival,
      this.arrivalTimestamp,
      this.departure,
      this.departureTimestamp,
      this.delay,
      this.platform,
      this.prognosis,
      this.realtimeAvailability,
      this.location});

  Stop.fromJson(Map<String, dynamic> json) {
    station =
        json['station'] != null ? Station.fromJson(json['station']) : null;
    arrival = json['arrival'];
    arrivalTimestamp = json['arrivalTimestamp'];
    departure = json['departure'];
    departureTimestamp = json['departureTimestamp'];
    delay = json['delay'];
    platform = json['platform'];
    prognosis = json['prognosis'] != null
        ? Prognosis.fromJson(json['prognosis'])
        : null;
    realtimeAvailability = null;
    location =
        json['location'] != null ? Station.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (station != null) {
      data['station'] = station!.toJson();
    }
    data['arrival'] = arrival;
    data['arrivalTimestamp'] = arrivalTimestamp;
    data['departure'] = departure;
    data['departureTimestamp'] = departureTimestamp;
    data['delay'] = delay;
    data['platform'] = platform;
    if (prognosis != null) {
      data['prognosis'] = prognosis!.toJson();
    }
    data['realtimeAvailability'] = realtimeAvailability;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Station {
  String? id;
  String? name;
  Null score;
  Coordinate? coordinate;
  Null distance;

  Station({this.id, this.name, this.score, this.coordinate, this.distance});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['score'] = score;
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    data['distance'] = distance;
    return data;
  }
}

class Coordinate {
  String? type;
  double? x;
  double? y;

  Coordinate({this.type, this.x, this.y});

  Coordinate.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class Prognosis {
  Null platform;
  String? arrival;
  String? departure;
  Null capacity1st;
  Null capacity2nd;

  Prognosis(
      {this.platform,
      this.arrival,
      this.departure,
      this.capacity1st,
      this.capacity2nd});

  Prognosis.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    arrival = json['arrival'];
    departure = json['departure'];
    capacity1st = json['capacity1st'];
    capacity2nd = json['capacity2nd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['platform'] = platform;
    data['arrival'] = arrival;
    data['departure'] = departure;
    data['capacity1st'] = capacity1st;
    data['capacity2nd'] = capacity2nd;
    return data;
  }
}

class Location {
  String? id;
  Null name;
  Null score;
  Coordinate? coordinate;
  Null distance;

  Location({this.id, this.name, this.score, this.coordinate, this.distance});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    coordinate = json['coordinate'] != null
        ? Coordinate.fromJson(json['coordinate'])
        : null;
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['score'] = score;
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    data['distance'] = distance;
    return data;
  }
}

class PassList {
  Station? station;
  String? arrival;
  int? arrivalTimestamp;
  String? departure;
  int? departureTimestamp;
  int? delay;
  String? platform;
  Prognosis? prognosis;
  Null realtimeAvailability;
  Station? location;

  PassList(
      {this.station,
      this.arrival,
      this.arrivalTimestamp,
      this.departure,
      this.departureTimestamp,
      this.delay,
      this.platform,
      this.prognosis,
      this.realtimeAvailability,
      this.location});

  PassList.fromJson(Map<String, dynamic> json) {
    station =
        json['station'] != null ? Station.fromJson(json['station']) : null;
    arrival = json['arrival'];
    arrivalTimestamp = json['arrivalTimestamp'];
    departure = json['departure'];
    departureTimestamp = json['departureTimestamp'];
    delay = json['delay'];
    platform = json['platform'];
    prognosis = json['prognosis'] != null
        ? Prognosis.fromJson(json['prognosis'])
        : null;
    realtimeAvailability = json['realtimeAvailability'];
    location =
        json['location'] != null ? Station.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (station != null) {
      data['station'] = station!.toJson();
    }
    data['arrival'] = arrival;
    data['arrivalTimestamp'] = arrivalTimestamp;
    data['departure'] = departure;
    data['departureTimestamp'] = departureTimestamp;
    data['delay'] = delay;
    data['platform'] = platform;
    if (prognosis != null) {
      data['prognosis'] = prognosis!.toJson();
    }
    data['realtimeAvailability'] = realtimeAvailability;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}
