import 'dart:convert';
import 'dart:developer';

import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/ReservationsModel.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';

class MyReservations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyReservations();
}

class _MyReservations extends State<MyReservations> {
  MyWidget _myWidget;
  var status;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.MY_RESERVATIONS_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: FutureBuilder(
              future: getReservationList(context: context),
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  var list = snapshot.data as ReservationsModel;
                  return ListView.builder(
                    itemCount: list.data.length,
                    itemBuilder: (context, position) {
                      return listItem(position, list.data[position]);
                    },
                  );
                }
                else {
                  return Center(
                    child: Container(height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),),
                  );
                }
              }
          ),
        ),
      ),
    );
  }

  Future<ReservationsModel> getReservationList(
      {@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    ReservationsModel list;
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
      url: Constants.GET_ALL_Reservations_API + "492",);
    var response = await http.Response.fromStream(_streamedResponse);
    if (response != null) {
      log("fetch all reservations succeed");
      var reservations =
      ReservationsModel.fromJson(jsonDecode(response.body));
      GlobalState.reservationsModel = reservations;
      list = reservations;
    }
    return list;
  }

  Widget listItem(int position, Datum data) {
    MyWidget _myWidget = new MyWidget();
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _myWidget.myText(data.nomeEvento, 12, FontWeight.bold,
                              1, Colors.black),
                          _myWidget.myText("Bercelona, Spagna", 10,
                              FontWeight.bold, 1, Colors.black38),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  child: _myWidget.myText(
                                      "people ${data.numeroAdulti +
                                          data.numeroBambini} \n date ${data
                                          .dataPrenotazione}",
                                      10,
                                      FontWeight.bold,
                                      2,
                                      Colors.black),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(height: 30,width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                          BorderRadius.circular(5.0)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            data.stato == "P"
                                                ? "pending"
                                                :"completed",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
