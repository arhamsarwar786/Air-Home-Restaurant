import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event.dart';
import 'package:air_home_retaurant/UI/add_eRestaurant_event.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOnlineCookingClassEvent3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddOnlineCookingClassEvent3();
}

class _AddOnlineCookingClassEvent3 extends State<AddOnlineCookingClassEvent3> {
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
      appBar: _myWidget.myAppBar("Add an online cooking class", () {
        // Navigator.pop(context);
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
                                    child: _myWidget.myText(
                                        "LINK", 12, FontWeight.bold, 1, Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: _myWidget.myTextInput(
                                    addCookingClassEvent3Controller, 1, "https://exapmle.com"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _myWidget.myText(Constants.ONLINE_COOKING_CLASS_EVENT3_INFO, 12, FontWeight.bold, null, Colors.black)
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:10.0),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          "DATES,TIMES AND COSTS", 12, FontWeight.bold, 1,Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Row(children: [
                                Expanded(child: _myWidget.dataColumn("DATE", "30/04/2021")),
                                Expanded(child: _myWidget.dataColumn("TIME", "09:15-10:15")),
                                Expanded(child: _myWidget.dataColumn("ADULTS", "15,00EUR")),
                                Expanded(child: _myWidget.dataColumn("CHILDREN", "10,00EUR")),
                              ],),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:10.0),
                          child: Container(
                            height: 30.0,
                            width: 100.0,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF7878),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ADD A DATE",
                                      style: TextStyle(color: Colors.white, fontSize: 12),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AddERestaurantEvent()),
                      // );
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
}
