import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_parking/pages/account/account.dart';
import 'package:projet_parking/MainPage.dart';
import 'package:projet_parking/pages/contact/contact.dart';
import 'package:projet_parking/pages/listPage.dart';
import 'package:projet_parking/pages/login/login.dart';
import 'package:projet_parking/pages/register/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/liste': (BuildContext context) => new ListPage(),
        '/compte': (BuildContext context) => new Account(),
        '/register': (BuildContext context) => new Register(),
        '/login': (BuildContext context) => new Login(),
        '/contact': (BuildContext context) => new Contact(),
      },
    );
  }
}
