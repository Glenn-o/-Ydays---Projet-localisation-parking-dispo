import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
      toolbarHeight: 90,
      leadingWidth: 73,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: RawMaterialButton(
        onPressed: () {},
        fillColor: Colors.white,
        child: const Icon(
          Icons.search_rounded,
          size: 20.0,
          color: Color(0xFF736bf5),
        ),
        elevation: 5.0,
        padding: EdgeInsets.all(15),
        shape: const CircleBorder(),
      ),
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
                color: Color(0xFF736bf5),
              ),
              elevation: 5.0,
              shape: const CircleBorder(),
            );
          },
        ),
      ));
}
