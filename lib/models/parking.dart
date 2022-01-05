import 'package:flutter/foundation.dart';

class Parking {
  int id;
  String name;
  int places;
  int totalPlaces;
  double coordLat;
  double coordLong;

  Parking({
    @required this.id,
    @required this.name,
    @required this.places,
    @required this.totalPlaces,
    @required this.coordLat,
    @required this.coordLong,
  });

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      id: json['id'] as int,
      name: json['name'] as String,
      places: json['places'] as int,
      totalPlaces: json['totalPlaces'] as int,
      coordLat: json['coordLat'] as double,
      coordLong: json['coordLong'] as double,
    );
  }
}
