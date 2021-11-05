import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Allergies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Allergies();
}

class _Allergies extends State<Allergies> {
  MyWidget _myWidget;
  bool cbValue1, cbValue2, cbValue3, cbValue4, cbValue5, cbValue6, cbValue7,
      cbValue8,
      cbValue9, cbValue10, cbValue11, cbValue12, cbValue13, cbValue14,
      cbValue15, cbValue16;

  @override
  void initState() {
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.ALLERGIES_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL1, cbValue1)),
                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL2, cbValue2)),
                  ],
                ),
                Row(
                  children: [

                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL3, cbValue3)),
                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL4, cbValue4)),
                  ],
                ),
                Row(
                  children: [


                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL5, cbValue5)),
                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL6, cbValue6)),
                  ],
                ),
                Row(
                  children: [

                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL7, cbValue7)),
                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL8, cbValue8)),
                  ],
                ),
                Row(
                  children: [

                    Expanded(child: myCheckBox(Constants.ALLERGIES_LABEL9, cbValue9)),
                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL10, cbValue10)),
                  ],
                ),
                Row(
                  children: [

                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL11, cbValue11)),
                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL12, cbValue12)),
                  ],
                ),
                Row(
                  children: [

                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL13, cbValue13)),
                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL14, cbValue14)),
                  ],
                ),
                Row(
                  children: [

                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL15, cbValue15)),
                    Expanded(
                        child: myCheckBox(Constants.ALLERGIES_LABEL16, cbValue16)),
                  ],
                ),

                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
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
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: n,
              activeColor: Colors.red,
              onChanged: (bool value) {
                /// manage the state of each value
                setState(() {
                  switch (title) {
                    case Constants.ALLERGIES_LABEL1:
                      cbValue1 = value;
                      break;
                    case Constants.ALLERGIES_LABEL2:
                      cbValue2 = value;
                      break;
                    case Constants.ALLERGIES_LABEL3:
                      cbValue3 = value;
                      break;
                    case Constants.ALLERGIES_LABEL4:
                      cbValue4 = value;
                      break;
                    case Constants.ALLERGIES_LABEL5:
                      cbValue5 = value;
                      break;
                    case Constants.ALLERGIES_LABEL6:
                      cbValue6 = value;
                      break;
                    case Constants.ALLERGIES_LABEL7:
                      cbValue7 = value;
                      break;
                    case Constants.ALLERGIES_LABEL8:
                      cbValue8 = value;
                      break;
                    case Constants.ALLERGIES_LABEL9:
                      cbValue9 = value;
                      break;
                    case Constants.ALLERGIES_LABEL10:
                      cbValue10 = value;
                      break;
                    case Constants.ALLERGIES_LABEL11:
                      cbValue11 = value;
                      break;
                    case Constants.ALLERGIES_LABEL12:
                      cbValue12 = value;
                      break;
                    case Constants.ALLERGIES_LABEL13:
                      cbValue13 = value;
                      break;
                    case Constants.ALLERGIES_LABEL14:
                      cbValue14 = value;
                      break;
                    case Constants.ALLERGIES_LABEL15:
                      cbValue15 = value;
                      break;
                    case Constants.ALLERGIES_LABEL16:
                      cbValue16 = value;
                      break;
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child:_myWidget.myText(title, 15.0, FontWeight.bold, 2, Colors.black),
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
