import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_parking/components/app_bar.dart';
import 'package:projet_parking/components/map.dart';
import 'package:projet_parking/components/menu.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.of(context).pushNamed('/login');
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Menu(context),
      appBar: appBar(),
      body: map(context),
    );
  }
}
