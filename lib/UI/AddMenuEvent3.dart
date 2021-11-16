import 'package:air_home_retaurant/UI/AddMenuEvent4.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMenuEvent3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddMenuEvent3();
}

class _AddMenuEvent3 extends State<AddMenuEvent3> {
  MyWidget _myWidget;
  TextEditingController addERestaurantEvent2Controller,
      addERestaurantEvent2Controller2,
      addERestaurantEvent2Controller3;

  int value1, value2;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    value2 = 1;
    value1 = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.ADD_MENU_EVENT3_APPBAR_TITLE, () {
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
                          height: 300,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, position) {
                              return myMenu(position);
                            },
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: _myWidget.myText(
                                        Constants.ADD_MENU_EVENT3_LABEL1,
                                        12,
                                        FontWeight.bold,
                                        1,
                                        Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: _myWidget.myText(
                                        Constants.ADD_MENU_EVENT3_INFO,
                                        12,
                                        FontWeight.bold,
                                        null,
                                        Colors.black)),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
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
                                              addERestaurantEvent2Controller2,
                                              1,
                                              Constants
                                                  .ADD_MENU_EVENT3_TEXT_FIELD1_HINT),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .ADD_MENU_EVENT3_TEXT_FIELD1_INFO,
                                                  10,
                                                  FontWeight.normal,
                                                  1,
                                                  Colors.black38),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
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
                                              addERestaurantEvent2Controller2,
                                              1,
                                              Constants
                                                  .ADD_MENU_EVENT3_TEXT_FIELD2_HINT),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .ADD_MENU_EVENT3_TEXT_FIELD2_INFO,
                                                  10,
                                                  FontWeight.normal,
                                                  1,
                                                  Colors.black38),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                    child: _myWidget.btnMain("Continue", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMenuEvent4()),
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

  Widget myMenu(int position) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              _myWidget.myText("MENU ${position + 1}", 12.0, FontWeight.bold, 1,
                  Colors.black),
              Container(
                  height: 20.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset("assets/images/minus_round.png"),
                    ),
                  )),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: _myWidget.myTextInput(
                      new TextEditingController(), 1, "Menu Name"),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: _myWidget.myTextInput(
                      new TextEditingController(), 1, "Course main title"),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: _myWidget.myTextInput(new TextEditingController(), 1,
                      "Course main description"),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: _myWidget.myTextInput(
                      new TextEditingController(), 1, "Price"),
                ),
              ),
            ),
          ),
          Container(
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
                      Constants.ADD_MENU_EVENT3_BUTTON_SAVE,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
