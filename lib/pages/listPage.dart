import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_parking/components/app_bar.dart';
import 'package:projet_parking/components/menu.dart';
import 'package:projet_parking/models/parking.dart';
import 'package:projet_parking/services/http_service.dart';

import '../theme.dart';

class ListPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 1 - (120 + 20 + 16);
    return Scaffold(
      appBar: appBar(),
      drawer: Menu(context),
      body: FutureBuilder(
          future: httpService.getParkings(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFcad1d9),
                          )),
                      child: Row(children: [
                        Image.network('https://via.placeholder.com/120x230'),
                        Container(
                          width: c_width,
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 16, bottom: 10),
                                  child: Align(
                                    child: Text(
                                      snapshot.data[index].name,
                                      textAlign: TextAlign.left,
                                      style: heading6,
                                    ),
                                    alignment: Alignment.topLeft,
                                  )),
                              Container(
                                  width: c_width,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    child: Column(
                                      children: [
                                        Align(
                                          child: Text(
                                            snapshot.data[index].places
                                                    .toString() +
                                                ' Places disponibles',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Align(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 5),
                                            child: Text(
                                              'Tarif :',
                                              textAlign: TextAlign.left,
                                              style: heading6,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Align(
                                          child: Text(
                                            '1 heure : ' +
                                                snapshot.data[index].tarif1,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Align(
                                          child: Text(
                                            '2 heures : ' +
                                                snapshot.data[index].tarif2,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Align(
                                          child: Text(
                                            '3 heures : ' +
                                                snapshot.data[index].tarif3,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Align(
                                          child: Text(
                                            '4 heures : ' +
                                                snapshot.data[index].tarif4,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Align(
                                          child: Text(
                                            '10 heures : ' +
                                                snapshot.data[index].tarif10,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.topLeft,
                                  ))
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
