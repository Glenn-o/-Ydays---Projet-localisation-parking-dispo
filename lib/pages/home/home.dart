import 'package:flutter/material.dart';
import 'package:projet_parking/components/app_bar.dart';
import 'package:projet_parking/components/map.dart';
import 'package:projet_parking/components/menu.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      drawer: Menu(context),
      body: map(context),
    );
  }
}
