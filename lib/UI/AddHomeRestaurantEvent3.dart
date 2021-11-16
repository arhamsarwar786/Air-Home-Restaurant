import 'dart:developer';

import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewEvent3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewEvent3();
}

class _AddNewEvent3 extends State<AddNewEvent3> {
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

      appBar: _myWidget.myAppBar(Constants.ADD_NEW_EVENT3_APPBAR_TITLE, () {
        Navigator.pop(context);
      }),
      body: Container(
                  color: Color(0xFFF5F5F5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),                   
                      child:  SingleChildScrollView(
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
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .ADD_NEW_EVENT3_LABEL1,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: _myWidget.myTextInput(
                                              addCookingClassEvent3Controller,
                                              1,
                                              Constants
                                                  .ADD_NEW_EVENT3_TEXTFIELD1_HINT),
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .ADD_NEW_EVENT3_LABEL2,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: _myWidget.myTextInput(
                                              addCookingClassEvent3Controller,
                                              1,
                                              Constants
                                                  .ADD_NEW_EVENT3_TEXTFIELD2_HINT),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: _myWidget.myTextInput(
                                                addCookingClassEvent3Controller,
                                                5,
                                                Constants
                                                    .ADD_NEW_EVENT3_TEXTFIELD3_HINT),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
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
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL3,
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
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL4,
                                                    "30/04/2021")),
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL5,
                                                    "09:15-10:15")),
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL6,
                                                    "15,00EUR")),
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL7,
                                                    "10,00EUR")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  // color: Color(0xFFFF7878),
                               onPressed: (){
                                  print("Arham");
                               },child: Text("Arham"),
                                
                                  // ,child: Text(
                                  //         Constants
                                  //             .ADD_NEW_EVENT3_BUTTON1,
                                  //         style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontSize: 12),
                                  //       ),
                                        ),
                              
                              ],
                            ),
                          ),
                        ),
                        // Publish
                        // InkWell(
                        //   onTap: () {
                        //     // https://airhomerestaurant.com/api/v1/nuovoevento
                        //   },
                        //   child: Container(
                        //     child: Align(
                        //       alignment: Alignment.bottomCenter,
                        //       child: Container(
                        //         child: _myWidget.btnMain(
                        //             Constants.ADD_NEW_EVENT3_BUTTON_MAIN, () {
                        //                   print("Add Date");
                        //           // Navigator.push(
                        //           //   context,
                        //           //   MaterialPageRoute(
                        //           //       builder: (context) => AddMenuEvent()),
                        //           // );
                        //         }),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                    
                  ),
                ),
         );
  }
}
