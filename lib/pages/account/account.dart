import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_parking/components/app_bar.dart';
import 'package:projet_parking/components/menu.dart';

import '../../theme.dart';

class Account extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      Navigator.of(context).pushNamed('/login');
    }
    return Scaffold(
      appBar: appBar(),
      drawer: Menu(context),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20, bottom: 50),
            child: Text(
              'Votre profil',
              style: heading2,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/avatar.png',
              height: 100,
              width: 100,
            ),
          ),
          Text(user.email),
          Text(user.phoneNumber.toString())
        ],
      ),
    );
  }
}
