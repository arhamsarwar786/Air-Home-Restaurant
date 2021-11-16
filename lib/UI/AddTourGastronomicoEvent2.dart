import 'package:air_home_retaurant/UI/AddHomeRestaurantEvent3.dart';
import 'package:air_home_retaurant/UI/AddTourGastronomicoEvent3.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddATour2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddATour2();
}

class _AddATour2 extends State<AddATour2> {
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
      appBar: _myWidget.myAppBar(Constants.ADD_TOUR2_APPBAR_TITLE, () {
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
                                      child: _myWidget.myText(
                                          Constants.ADD_TOUR2_LABEL1,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
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
                                        Constants.ADD_TOUR2_TEXT_FIELD1_HINT),
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
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: _myWidget.myText(
                                            Constants.ADD_TOUR2_LABEL2,
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Container(
                                            child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: _myWidget.myText(
                                                Constants.ADD_TOUR2_LABEL3,
                                                12,
                                                FontWeight.bold,
                                                1,
                                                Colors.black),
                                          ),
                                        )),
                                        Container(
                                            child: Expanded(
                                                child: Center(
                                                    child:
                                                        _myWidget.selectValue(
                                                            () {
                                                              setState(() {
                                                                value1++;
                                                                print(
                                                                    "$value1");
                                                              });
                                                            },
                                                            value1,
                                                            () {
                                                              setState(() {
                                                                value1--;
                                                                print(
                                                                    "$value1");
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
                                            child: _myWidget.myText(
                                                Constants.ADD_TOUR2_LABEL4,
                                                12,
                                                FontWeight.bold,
                                                1,
                                                Colors.black),
                                          ),
                                        )),
                                        Container(
                                            child: Expanded(
                                                child: Center(
                                                    child:
                                                        _myWidget.selectValue(
                                                            () {
                                                              setState(() {
                                                                value2++;
                                                                print(
                                                                    "$value2");
                                                              });
                                                            },
                                                            value2,
                                                            () {
                                                              setState(() {
                                                                value2--;
                                                                print(
                                                                    "$value2");
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: _myWidget.myTextInput(
                                addCookingClassEvent2Controller2,
                                5,
                                Constants.ADD_TOUR2_TEXT_FIELD2_HINT),
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
                                            Constants.ADD_TOUR2_LABEL5,
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
                        ),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(Constants.ADD_TOUR2_LABEL6, 12,
                                          FontWeight.bold, 1, Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 200.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Container(
                                    child: ListView.builder(
                                      itemCount: 3,
                                      itemBuilder: (context, position) {
                                        return menuListItem(position);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        Constants.ADD_TOUR2_BUTTON1,
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
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: _myWidget.btnMain(Constants.ADD_TOUR2_BUTTON_MAIN, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddATour3()),
                      );
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

  Widget menuListItem(int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: _myWidget.myText(
                      "$position", 12.0, FontWeight.bold, 1, Colors.red),
                ),
              ),
              Container(
                  child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _myWidget.myText(
                        "Course Title", 12.0, FontWeight.bold, 1, Colors.black),
                    _myWidget.myText("Course Description", 12.0,
                        FontWeight.normal, 1, Colors.black),
                  ],
                ),
              )),
              Container(
                width: 50.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset("assets/images/delete-red.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
