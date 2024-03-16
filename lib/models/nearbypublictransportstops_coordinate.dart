
class NearbyPublicTransportStopsCoordinate {
  String? type;
  double? x;
  double? y;

  NearbyPublicTransportStopsCoordinate(this.type, this.x, this.y);

  factory NearbyPublicTransportStopsCoordinate.fromJson(Map<String, dynamic> json) {
    return NearbyPublicTransportStopsCoordinate(
      json['type'],
      json['x'],
      json['y']
    );
  }
}