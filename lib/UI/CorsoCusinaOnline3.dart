import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Utils/constants.dart';

class CorsoCusinaOnline3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CorsoCusinaOnline3();
}

class _CorsoCusinaOnline3 extends State<CorsoCusinaOnline3> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.CORSO_CUSINA_ONLINE3_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _myWidget.myText(Constants.CORSO_CUSINA_ONLINE3_LABEL1, 15.0,
                      FontWeight.bold, 1, Colors.black),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: _myWidget.myTextInput(
                                      new TextEditingController(),
                                      1,
                                      Constants.CORSO_CUSINA_ONLINE3_FIELD1_HINT),
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: _myWidget.myTextInput(
                                      new TextEditingController(),
                                      1,
                                      Constants.CORSO_CUSINA_ONLINE3_FIELD2_HINT),
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: _myWidget.myTextInput(
                              new TextEditingController(),
                              1,
                              Constants.CORSO_CUSINA_ONLINE3_FIELD3_HINT),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: _myWidget.myTextInput(
                              new TextEditingController(),
                              5,
                              Constants.CORSO_CUSINA_ONLINE3_FIELD4_HINT),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        color: Colors.black,
                        height: 30.0,
                        width: 150.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              Constants.CORSO_CUSINA_ONLINE3_BUTTON1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: _myWidget.myText(Constants.CORSO_CUSINA_ONLINE3_LABEL2,
                          15, FontWeight.bold, 1, Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                      child: _myWidget.myText(Constants.CORSO_CUSINA_ONLINE3_LABEL3, 20,
                          FontWeight.bold, 1, Colors.red),
                    ),
                    _myWidget.myText(
                        "50,00",
                        15,
                        FontWeight.bold,
                        1,
                        Colors.black),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Constants.CORSO_CUSINA_ONLINE3_BUTTON2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/calendar.png"),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF2A2A40),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                child: _myWidget.myText(
                                    Constants.CORSO_CUSINA_ONLINE3_LABEL4,
                                    20,
                                    FontWeight.normal,
                                    1,
                                    Colors.white),
                              ),
                              Container(
                                child: _myWidget.myText(
                                    Constants.CORSO_CUSINA_ONLINE3_LABEL5,
                                    25,
                                    FontWeight.bold,
                                    1,
                                    Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
