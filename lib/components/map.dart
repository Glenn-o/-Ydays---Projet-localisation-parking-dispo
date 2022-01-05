import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_parking/services/http_service.dart';
import 'package:projet_parking/utils/utils.dart';

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
                infoWindow: InfoWindow(
                    title: snapshot.data[i].name,
                    snippet: snapshot.data[i].places.toString() +
                        ' Places disponibles'),
              ),
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
