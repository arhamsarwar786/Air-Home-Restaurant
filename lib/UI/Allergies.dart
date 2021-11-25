import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Allergies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Allergies();
}

class _Allergies extends State<Allergies> {
  MyWidget _myWidget;
  bool cbValue1,
      cbValue2,
      cbValue3,
      cbValue4,
      cbValue5,
      cbValue6,
      cbValue7,
      cbValue8,
      cbValue9,
      cbValue10,
      cbValue11,
      cbValue12,
      cbValue13,
      cbValue14,
      cbValue15,
      cbValue16;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    cbValue1 = false;
    cbValue2 = false;
    cbValue3 = false;
    cbValue4 = false;
    cbValue5 = false;
    cbValue6 = false;
    cbValue7 = false;
    cbValue8 = false;
    cbValue9 = false;
    cbValue10 = false;
    cbValue11 = false;
    cbValue12 = false;
    cbValue13 = false;
    cbValue14 = false;
    cbValue15 = false;
    cbValue16 = false;
  }

  List selectedAllergieis = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.ALLERGIES_TITLE, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL1, cbValue1)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL2, cbValue2)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL3, cbValue3)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL4, cbValue4)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL5, cbValue5)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL6, cbValue6)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL7, cbValue7)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL8, cbValue8)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL9, cbValue9)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL10, cbValue10)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL11, cbValue11)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL12, cbValue12)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL13, cbValue13)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL14, cbValue14)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL15, cbValue15)),
                    Expanded(
                        child:
                            myCheckBox(Constants.ALLERGIES_LABEL16, cbValue16)),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () async {

                            print(selectedAllergieis);
                            var stringAllergies = selectedAllergieis.join(",");
                            print(stringAllergies);
                            // GlobalState.allergies.clear();
                            BaseClass.showSB(
                                msg: Constants.SAVED_ALLERGIES,
                                context: context,
                                type: Constants.SUCCESS,                                
                                );                        
                            Navigator.pop(context, stringAllergies);
                            // Future.delayed(Duration(seconds: 3000), () {
                            // });

                          },
                          child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  Constants.ALLERGIES_BUTTON_MAIN,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myCheckBox(String title, bool n) {
    // if (GlobalState.allergies.contains(title)) {
    //   n = true;
    // }
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: n,
              // value: n,
              activeColor: Colors.red,
              onChanged: (bool value) {
                // if (GlobalState.allergies.contains(title)) {
                //   if (n==true && value== false) {

                //   value = false;
                // print("I Click This : $value  $n");
                //   }
                // }

                /// manage the state of each value
                setState(() {
                  switch (title) {
                    case Constants.ALLERGIES_LABEL1:
                      cbValue1 = value;

                      if (cbValue1 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL1);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL1);
                      }

                      break;
                    case Constants.ALLERGIES_LABEL2:
                      cbValue2 = value;
                      if (cbValue2 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL2);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL2);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL3:
                      cbValue3 = value;
                      if (cbValue3 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL3);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL3);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL4:
                      cbValue4 = value;
                      if (cbValue4 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL4);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL4);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL5:
                      cbValue5 = value;
                      if (cbValue5 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL5);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL5);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL6:
                      cbValue6 = value;
                      if (cbValue6 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL6);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL6);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL7:
                      cbValue7 = value;
                      if (cbValue7 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL7);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL7);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL8:
                      cbValue8 = value;
                      if (cbValue8 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL8);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL8);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL9:
                      cbValue9 = value;
                      if (cbValue9 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL9);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL9);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL10:
                      cbValue10 = value;
                      if (cbValue10 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL10);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL10);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL11:
                      cbValue11 = value;
                      if (cbValue11 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL11);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL11);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL12:
                      cbValue12 = value;
                      if (cbValue12 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL12);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL12);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL13:
                      cbValue13 = value;
                      if (cbValue13 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL13);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL13);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL14:
                      cbValue14 = value;
                      if (cbValue14 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL14);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL14);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL15:
                      cbValue15 = value;
                      if (cbValue15 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL15);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL15);
                      }
                      break;
                    case Constants.ALLERGIES_LABEL16:
                      cbValue16 = value;
                      if (cbValue16 == false) {
                        selectedAllergieis.remove(Constants.ALLERGIES_LABEL16);
                      } else {
                        selectedAllergieis.add(Constants.ALLERGIES_LABEL16);
                      }
                      break;
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child: _myWidget.myText(
                  title, 15.0, FontWeight.bold, 2, Colors.black),
              // child: Text(
              //   title,
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 12,
              //       fontWeight: FontWeight.bold),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
