
import 'package:toolbox/models/nearbypublictransportstops_coordinate.dart';

class NearbyPublicTransportStopsStation {
  String? id;
  String? name;
  String? score;
  NearbyPublicTransportStopsCoordinate? coordinate;
  double? distance;
  String? icon;

  NearbyPublicTransportStopsStation(this.id, this.name, this.score, this.coordinate, this.distance, this.icon);

  factory NearbyPublicTransportStopsStation.fromJson(Map<String, dynamic> json) {
    return NearbyPublicTransportStopsStation(
      json['id'],
      json['name'],
      json['score'],
      NearbyPublicTransportStopsCoordinate.fromJson(json['coordinate'] ?? {}),
      json['distance'] is int ? (json['distance'] as int).toDouble() : json['distance'],
      json['icon']
    );
  }
}