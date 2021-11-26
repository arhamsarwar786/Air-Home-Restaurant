import 'dart:collection';
import 'package:air_home_retaurant/UI/MainScreen.dart';
import "package:http/http.dart" as http;

import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCookingClassEvent3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCookingClassEvent3();
}

class _AddCookingClassEvent3 extends State<AddCookingClassEvent3> {
  MyWidget _myWidget;
  TextEditingController addCookingClassEvent3Controller,
      addCookingClassEvent3Controller2,
      addCookingClassEvent3Controller3;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    addCookingClassEvent3Controller = new TextEditingController();
    addCookingClassEvent3Controller2 = new TextEditingController();
    addCookingClassEvent3Controller3 = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Add a cooking class", () {
        Navigator.pop(context);
      }),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: _myWidget.myText("CITY", 12,
                                        FontWeight.bold, 1, Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: _myWidget.myTextInput(
                                    addCookingClassEvent3Controller,
                                    1,
                                    "Napoli"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: _myWidget.myText("ADDRESS", 12,
                                        FontWeight.bold, 1, Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: _myWidget.myTextInput(
                                    addCookingClassEvent3Controller2,
                                    1,
                                    "Enter your address here"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: _myWidget.myTextInput(
                                      addCookingClassEvent3Controller3,
                                      5,
                                      "Tell your guests any information such as floor, staircase, intercom, nearby landmark etc."),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          "DATES,TIMES AND COSTS",
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          "DATE", "30/04/2021")),
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          "TIME", "09:15-10:15")),
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          "ADULTS", "15,00EUR")),
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          "CHILDREN", "10,00EUR")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 30.0,
                            width: 100.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF7878),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ADD A DATE",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: _myWidget.btnMain("Publish", () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      bool status = true;

                      if (addCookingClassEvent3Controller.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_CITY,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (addCookingClassEvent3Controller2
                          .text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_ADDRESS,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }

                      if (status) {
                        if (addCookingClassEvent3Controller.text.isNotEmpty &&
                            addCookingClassEvent3Controller2.text.isNotEmpty) {
                          GlobalState.add_cooking_class.update("LuogoCitta",
                              (value) => addCookingClassEvent3Controller.text);
                          GlobalState.add_cooking_class.update("Luogo",
                              (value) => addCookingClassEvent3Controller2.text);
                               GlobalState.add_cooking_class.update("LuogoNote_it",
                              (value) => addCookingClassEvent3Controller3.text);
                          print(GlobalState.add_cooking_class);
                          callAddCookingClass(
                              body_map: GlobalState.add_cooking_class,
                              context: context);

                          BaseClass.showSB(
                              msg:
                                  Constants.SUCCESSFULLY_PUBLISHED_ONLINE_CLASS,
                              context: context,
                              type: Constants.SUCCESS);
                              GlobalState.add_cooking_class.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        } else {
                          BaseClass.showSB(
                              msg: "SomeThing Missing",
                              context: context,
                              type: Constants.FAILURE);
                        }
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ProgressDialog _progressDialog = ProgressDialog();

  Future<void> callAddCookingClass(
      {@required body_map, @required BuildContext context}) async {
    _progressDialog.showProgressDialog(context);

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: body_map,
        url: Constants.ADD_EVENT,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print(response.body);

          if (response != null) {
            // var user =
            // AddBlogPostResponseModel.fromJson(jsonDecode(response.body));
            print(response.body);
            if (response == "0") {
              //email Or Password wrong
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: "Something Went Wrong",
                  context: context,
                  type: Constants.FAILURE);
            } else {
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: Constants.SUCCESSFULLY_PUBLISHED,
                  context: context,
                  type: Constants.SUCCESS);
              // Navigator.push(context, MaterialPageRoute(builder: (_)=> MainScreen()));
            }
          } else {
            //empty response
            _progressDialog.dismissProgressDialog(context);
          }
        },
        onFailure: (_streamedResponse) async {
          _progressDialog.dismissProgressDialog(context);
          var response = await http.Response.fromStream(_streamedResponse);
        });
  }
}
