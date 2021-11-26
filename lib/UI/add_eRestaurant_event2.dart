import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/UI/add_eRestaurant_event3.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddERestaurantEvent2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddERestaurantEvent2();
}

class _AddERestaurantEvent2 extends State<AddERestaurantEvent2> {
  MyWidget _myWidget;
  TextEditingController addERestaurantEvent2Controller,
      addERestaurantEvent2Controller2,
      addERestaurantEvent2Controller3,
       addERestaurantEvent2Controller4,
      addERestaurantEvent2Controller5;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  int value1, value2;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    addERestaurantEvent2Controller = new TextEditingController();
    addERestaurantEvent2Controller2 = new TextEditingController();
    addERestaurantEvent2Controller3 = new TextEditingController();
    addERestaurantEvent2Controller4 = new TextEditingController();
    addERestaurantEvent2Controller5 = new TextEditingController();
    value2 = 1;
    value1 = 1;

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Add e-Restaurant", () {
        Navigator.pop(context);
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
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          "CREATE YOUR E-RESTAURANT",
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Container(
                                    height: 40.0,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Container(
                                              height: 40.0,
                                              width: double.infinity,
                                              color: Colors.white,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<ListItem>(
                                                  value: _selectedItem,
                                                  items: _dropdownMenuItems,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedItem = value;
                                                    });
                                                  },
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
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: _myWidget.myTextInput(
                                          addERestaurantEvent2Controller,
                                          1,
                                          "Course main name"),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: _myWidget.myTextInput(
                                          addERestaurantEvent2Controller2,
                                          1,
                                          "Course main description"),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: _myWidget.myTextInput(
                                          addERestaurantEvent2Controller3,
                                          1,
                                          "Price per course"),
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
                                        Constants.E_RESTAURANT_EVENT2_ADD,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText("OPTIONS", 12,
                                          FontWeight.bold, 1, Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: _myWidget.myText(
                                        Constants
                                            .E_RESTAURANT_EVENT2_OPTIONS_INFO,
                                        12,
                                        FontWeight.bold,
                                        null,
                                        Colors.black)),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 10.0),
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
                                              addERestaurantEvent2Controller4,
                                              1,
                                              "10"),
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
                                                  "% on the total amount of the order for the cost of dishes",
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
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 10.0),
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
                                              addERestaurantEvent2Controller5,
                                              1,
                                              "10"),
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
                                                  "% of the total amount of the order for the services",
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
                      FocusScope.of(context).requestFocus(new FocusNode());
                      bool status = true;

                      if (addERestaurantEvent2Controller.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_COURSE_NAME,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (addERestaurantEvent2Controller2.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_COURSE_Description,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (addERestaurantEvent2Controller3.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_COURSE_PRICE,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }
                       else if (addERestaurantEvent2Controller4.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_OPTION_PRICE1,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }
                       else if (addERestaurantEvent2Controller5.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_OPTION_PRICE2,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }
                      if (status) {
                        if (addERestaurantEvent2Controller.text.isNotEmpty &&
                            addERestaurantEvent2Controller2.text.isNotEmpty &&
                            addERestaurantEvent2Controller3.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddERestaurantEvent3()),
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

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              listItem.name,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }
}
