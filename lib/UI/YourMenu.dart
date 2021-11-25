import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/ReservationsModel.dart';
import 'package:air_home_retaurant/ModelClasses/VendorModal.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';

class YourMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YourMenu();
}

class _YourMenu extends State<YourMenu> {
  MyWidget _myWidget;
  ProgressDialog _progressDialog;
  var status;

  @override
  void initState() {
    super.initState();
    getMenu(context: context);
    _myWidget = new MyWidget();
    _progressDialog = ProgressDialog();
  }





 Future<VendorModal> getMenu({@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.YOUR_MENU);
    var response1 = await http.Response.fromStream(res1);
    var resDec1 = jsonDecode(response1.body);
    resDec1['data'] = resDec1['data'];
    VendorModal list;
    var response = resDec1;
    if (response1.statusCode == 200) {
      var responseList = VendorModal.fromJson(response);
      if (responseList != null) {
        GlobalState.vendorProfile = responseList;
        return list = responseList;
      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        // print(GlobalState.vendorProfile.data.);
      },),
      appBar: _myWidget.myAppBar(Constants.MY_RESERVATIONS_TITLE, () {
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

  Widget listItem(int position,  data) {
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



