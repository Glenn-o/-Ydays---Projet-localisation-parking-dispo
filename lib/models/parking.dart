import 'package:flutter/foundation.dart';

class Parking {
  int id;
  String name;
  int places;
  int totalPlaces;
  String tarif1;
  String tarif2;
  String tarif3;
  String tarif4;
  String tarif10;
  double coordLat;
  double coordLong;

  Parking({
    @required this.id,
    @required this.name,
    @required this.places,
    @required this.totalPlaces,
    @required this.tarif1,
    @required this.tarif2,
    @required this.tarif3,
    @required this.tarif4,
    @required this.tarif10,
    @required this.coordLat,
    @required this.coordLong,
  });

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      id: json['id'] as int,
      name: json['name'] as String,
      places: json['places'] as int,
      totalPlaces: json['totalPlaces'] as int,
      tarif1: json['tarif1'] as String,
      tarif2: json['tarif2'] as String,
      tarif3: json['tarif3'] as String,
      tarif4: json['tarif4'] as String,
      tarif10: json['tarif10'] as String,
      coordLat: json['coordLat'] as double,
      coordLong: json['coordLong'] as double,
    );
  }
}
