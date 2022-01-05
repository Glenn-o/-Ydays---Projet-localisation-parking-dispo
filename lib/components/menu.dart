import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container Menu(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
          child: Container(
        color: const Color(0xFF736bf5),
        child: ListView(
          children: [
            Container(
              alignment: FractionalOffset.center,
              //padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 5.0,
                    fillColor: Colors.white,
                    child: const Icon(
                      Icons.close,
                      size: 20.0,
                      color: Color(0xFF736bf5),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    shape: const CircleBorder(),
                  ),
                  Text("Menu",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.25)
                ],
              ),
            ),
            _createItem(Icons.map, 'Carte', () {
              Navigator.of(context).pushNamed('/');
            }),
            _createItem(Icons.format_list_bulleted_rounded, 'Liste', () {
              Navigator.of(context).pushNamed('/liste');
            }),
            _createItem(Icons.account_circle, 'Compte', () {}),
            _createItem(Icons.mail_outline_rounded, 'Nous contacter', () {}),
            _createItem(Icons.share, 'Partager l\'application', () {}),
            Divider(),
            _createFooterItem("Politique de confidentialité", () {}),
            _createFooterItem("Conditions d'utilisation", () {}),
            _createFooterItem("Source d'information", () {}),
          ],
        ),
      )));
}

Widget _createItem(IconData icon, String text, GestureTapCallback onTap) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget _createFooterItem(String text, GestureTapCallback onTap) {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: ListTile(
        title: Text(text,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white, fontSize: 15),
            )),
        onTap: onTap),
  );
}
