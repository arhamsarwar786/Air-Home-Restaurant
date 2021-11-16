import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_classic_event2.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event2.dart';
import 'package:air_home_retaurant/UI/add_eRestaurant_event2.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddERestaurantEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddERestaurantEvent();
}

class _AddERestaurantEvent extends State<AddERestaurantEvent> {
  TextEditingController AddERestaurantEventController;
  MyWidget _myWidget;
  bool first, second, third;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    first = false;
    second = false;
    AddERestaurantEventController = new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Add e-Restaurant", () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF5F5F5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: _myWidget.myText(
                          Constants.E_RESTAURANT_EVENT1_INFO,
                          12,
                          FontWeight.bold,
                          null,
                          Colors.black)),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:10.0),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: _myWidget.myText(
                                    "YOUR E-RESTAURANT NAME", 12, FontWeight.bold, 1, Colors.black),
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
                                AddERestaurantEventController,
                                1,
                                "My Virtual Restaurant"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: _myWidget.selectCategory("CUISINE TYPE", () {}),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: _myWidget.selectCategory(
                          "ALLERGIES AND INTOLERANCES", () {}),
                    ),
                  ),
                ),

                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Checkbox(
                          value: first,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              first = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Recommended for families",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Checkbox(
                          value: second,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              second = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Not suitable for children",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),


                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Container(
                                height: 40.0,
                                width: double.infinity,
                                color: Colors.white,
                                child: DropdownButtonHideUnderline(
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
                          Flexible(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Container(
                                height: 40.0,
                                width: double.infinity,
                                color: Colors.white,
                                child: DropdownButtonHideUnderline(
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
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
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
                                          "ADD",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
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
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: _myWidget.btnCancelable("ITALIAN", () => null)),
                  ),
                )),
                Container(
                  child: Container(
                    child: _myWidget.btnMain("Continue", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddERestaurantEvent2()),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myCheckBox(String text, bool initValue) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: initValue,
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  initValue = value;
                });
              },
            ),
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
