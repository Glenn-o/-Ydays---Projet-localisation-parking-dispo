import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
      toolbarHeight: 90,
      leadingWidth: 73,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Container(
        padding: EdgeInsets.only(left: 23),
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              fillColor: Colors.white,
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18.0,
                color: Color(0xff2972ff),
              ),
              elevation: 5.0,
              shape: const CircleBorder(),
            );
          },
        ),
      ));
}
