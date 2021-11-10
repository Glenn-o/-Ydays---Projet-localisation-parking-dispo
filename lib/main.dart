import 'package:flutter/material.dart';
import 'package:projet_parking/pages/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   canvasColor: Colors.redAccent,
       ),
      home: Home(),
    );
  }
}
