import 'package:flutter/material.dart';
import 'package:projet_parking/components/app_bar.dart';
import 'package:projet_parking/components/menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        drawer: Menu(context),
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            color: Colors.white,
          ),
        ));
  }
}
