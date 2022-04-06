import 'dart:convert';
import 'package:http/http.dart';
import 'package:projet_parking/models/parking.dart';

class HttpService {
  var url = Uri.parse(
      'https://data.bordeaux-metropole.fr/geojson?key=012HKQUWWY&typename=st_park_p');
  Future<List<Parking>> getParkings() async {
    Response res = await get(url);
    List<dynamic> listParking = [];

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      for (int i = 0; i < body['features'].length; i++) {
        listParking.add({
          'id': i,
          'name': body['features'][i]['properties']['nom'],
          'places': body['features'][i]['properties']['libres'],
          'totalPlaces': body['features'][i]['properties']['total'],
          'tarif1': body['features'][i]['properties']['th_heur'] != null
              ? body['features'][i]['properties']['th_heur']
                      .toStringAsFixed(2) +
                  "€"
              : "Pas d'information",
          'tarif2': body['features'][i]['properties']['th_2'] != null
              ? body['features'][i]['properties']['th_2'].toStringAsFixed(2) +
                  "€"
              : "Pas d'information",
          'tarif3': body['features'][i]['properties']['th_3'] != null
              ? body['features'][i]['properties']['th_3'].toStringAsFixed(2) +
                  "€"
              : "Pas d'information",
          'tarif4': body['features'][i]['properties']['th_4'] != null
              ? body['features'][i]['properties']['th_4'].toStringAsFixed(2) +
                  "€"
              : "Pas d'information",
          'tarif10': body['features'][i]['properties']['th_10'] != null
              ? body['features'][i]['properties']['th_10'].toStringAsFixed(2) +
                  "€"
              : "Pas d'information",
          'coordLat': body['features'][i]['geometry']['coordinates'][1],
          'coordLong': body['features'][i]['geometry']['coordinates'][0]
        });
      }
      List<Parking> parkings =
          listParking.map((dynamic item) => Parking.fromJson(item)).toList();
      return parkings;
    } else {
      throw "Probleme de connexion à l'API";
    }
  }
}
