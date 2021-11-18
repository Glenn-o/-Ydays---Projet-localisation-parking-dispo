import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_parking/components/app_bar.dart';
import 'package:projet_parking/components/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: Colors.transparent,
      appBar: appBar(),
      drawer: Menu(context),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(44.837789, -0.57918),
          zoom: 14,
        ),
      ),
    );
  }
}
