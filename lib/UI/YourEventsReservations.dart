import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:air_home_retaurant/ModelClasses/ReservationsModel.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YourEventsReservations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YourEventsReservations();
}

class _YourEventsReservations extends State<YourEventsReservations> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.YOUR_EVENTS_RESERVATIONS_TITLE, () {
        Navigator.pop(context);
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
                      child: CircularProgressIndicator(color:Colors.red)),
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
    // print("%%%%%%%%%%%%%%%%%%%%% ${reservations.data}");
    }

    return list;
  }


  Widget listItem(int position, Datum data) {
    MyWidget _myWidget = new MyWidget();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                    child: Image.network(data.immagineEvento),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5.0)),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: _myWidget.myText(data.nomeEvento,
                          12, FontWeight.bold, 1, Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: _myWidget.myText(
                          "${DateFormat('yMMMMd').format(data.dataPrenotazione)}", 12, FontWeight.bold, 1, Colors.black38),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: _myWidget.myText(
                          "${data.nominativoUtente}",
                          12,
                          FontWeight.bold,
                          1,
                          Colors.red),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "Adults: ${data.numeroAdulti}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "Children: ${data.numeroBambini}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Text(
                          data.stato == "P"
                                                ? "pending"
                                                :"completed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
