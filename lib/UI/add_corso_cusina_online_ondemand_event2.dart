import 'package:air_home_retaurant/UI/add_corso_cusina_classic_event3.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event3.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOnlineCookingClassEvent2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddOnlineCookingClassEvent2();
}

class _AddOnlineCookingClassEvent2 extends State<AddOnlineCookingClassEvent2> {
  MyWidget _myWidget;
  TextEditingController addCookingClassEvent2Controller,
      addCookingClassEvent2Controller2;

  int value1, value2;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    addCookingClassEvent2Controller = new TextEditingController();
    addCookingClassEvent2Controller2 = new TextEditingController();
    value2 = 1;
    value1 = 1;
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
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                      child: _myWidget.myText("EVENT TITLE", 12,
                                          FontWeight.bold, 1, Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: _myWidget.myTextInput(
                                        addCookingClassEvent2Controller,
                                        1,
                                        "My Online Cooking Class"),
                                  ),
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: _myWidget.myText(
                                            "NUMBER OF PEOPLE",
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:10.0),
                                  child: Row(children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Container(
                                            child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: _myWidget.myText("MIN", 12,
                                                FontWeight.bold, 1, Colors.black),
                                          ),
                                        )),
                                        Container(
                                            child: Expanded(
                                                child: Center(
                                                    child: _myWidget.selectValue(
                                                        () {
                                                          setState(() {
                                                            value1++;
                                                            print("$value1");
                                                          });
                                                        },
                                                        value1,
                                                        () {
                                                          setState(() {
                                                            value1--;
                                                            print("$value1");
                                                          });
                                                        })))),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Container(
                                            child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: _myWidget.myText("MAX", 12,
                                                FontWeight.bold, 1, Colors.black),
                                          ),
                                        )),
                                        Container(
                                            child: Expanded(
                                                child: Center(
                                                    child: _myWidget.selectValue(
                                                        () {
                                                          setState(() {
                                                            value2++;
                                                            print("$value2");
                                                          });
                                                        },
                                                        value2,
                                                        () {
                                                          setState(() {
                                                            value2--;
                                                            print("$value2");
                                                          });
                                                        })))),
                                      ],
                                    )),
                                  ]),
                                ),
                              ],
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
                                addCookingClassEvent2Controller2,
                                5,
                                "Enter the description of your online cooking course here"),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: _myWidget.myText(
                                            "UPLOAD AT LEAST 2 IMAGES",
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: DottedBorder(
                                    color: Colors.black38,
                                    strokeWidth: 1,
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                          child: Container(
                                              height: 80,
                                              width: 80,
                                              child: Image.asset(
                                                  "assets/images/camera.png"))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: _myWidget.btnMain("Continue", () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AddOnlineCookingClassEvent3()),
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
