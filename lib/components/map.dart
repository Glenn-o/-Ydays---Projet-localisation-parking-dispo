import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_parking/services/http_service.dart';
import 'package:projet_parking/utils/utils.dart';

import '../theme.dart';

FutureBuilder map(BuildContext context) {
  final HttpService httpService = HttpService();
  Set<Marker> _markers = {};
  BitmapDescriptor pinLocationIconRed;
  BitmapDescriptor pinLocationIconGreen;
  BitmapDescriptor pinLocationIconOrange;
  LatLng _initialPosition = LatLng(44.837789, -0.57918);

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
  }

  void showModal(data) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 25, top: 30, bottom: 30),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(data.name, style: heading2),
              SizedBox(height: 5),
              Text(data.places.toString() + ' Places disponibles',
                  style: heading6),
              SizedBox(height: 15),
              Text(
                'Tarif :',
                textAlign: TextAlign.left,
                style: heading5,
              ),
              SizedBox(height: 10),
              Text(
                '1 heure : ' + data.tarif1,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '2 heures : ' + data.tarif2,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '3 heures : ' + data.tarif3,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '4 heures : ' + data.tarif4,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '10 heures : ' + data.tarif10,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              Align(
                  child: Material(
                    borderRadius: BorderRadius.circular(14.0),
                    elevation: 0,
                    child: Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(14.0),
                          child: Center(
                            child: Text(
                              'Fermer la fenêtre',
                              style: heading6.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.center)
            ],
          ),
        );
      },
    );
  }

  void setCustomMapPin() async {
    pinLocationIconRed = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/location-red.png',
    );
    pinLocationIconGreen = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/location-green.png',
    );
    pinLocationIconOrange = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/location-orange.png',
    );
  }

  setCustomMapPin();
  var pinLocation;

  return FutureBuilder(
    future: httpService.getParkings(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        for (int i = 0; i < snapshot.data.length; i++) {
          if (snapshot.data[i].places != null &&
              snapshot.data[i].totalPlaces != null) {
            if ((snapshot.data[i].places / snapshot.data[i].totalPlaces) *
                    100 <=
                5) {
              pinLocation = pinLocationIconOrange;
            } else {
              pinLocation = pinLocationIconGreen;
            }
            _markers.add(
              Marker(
                  markerId: MarkerId('id-$i'),
                  position: LatLng(
                      snapshot.data[i].coordLat, snapshot.data[i].coordLong),
                  icon: pinLocation,
                  infoWindow: InfoWindow(title: snapshot.data[i].name),
                  onTap: () => {showModal(snapshot.data[i])}),
            );
          } else {
            _markers.add(
              Marker(
                markerId: MarkerId('id-$i'),
                position: LatLng(
                    snapshot.data[i].coordLat, snapshot.data[i].coordLong),
                icon: pinLocationIconRed,
                infoWindow: InfoWindow(
                    title: snapshot.data[i].name,
                    snippet:
                        "Pas d\'information sur le nombre de places disponibles"),
              ),
            );
          }
        }
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 14,
          ),
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          markers: _markers,
        );
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}
