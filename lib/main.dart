import 'package:flutter/material.dart';
import 'package:projet_parking/pages/home/home.dart';
import 'package:projet_parking/pages/listPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   canvasColor: Colors.redAccent,
          ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/liste': (BuildContext context) => new ListPage(),
      },
    );
  }
}
