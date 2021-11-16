import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/UI/AddTourGastronomicoEvent2.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_classic_event2.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddATour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddATour();
}

class _AddATour extends State<AddATour> {
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
    third = false;
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
      appBar: _myWidget.myAppBar(Constants.ADD_TOUR_APPBAR_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF5F5F5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text(
                      Constants.ADD_TOUR_INFO,
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: _myWidget.selectCategory(Constants.ADD_TOUR_LABEL1, () {}),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: _myWidget.selectCategory(
                          Constants.ADD_TOUR_LABEL2, () {}),
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
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
                              Constants.ADD_TOUR_LABEL3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
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
                              Constants.ADD_TOUR_LABEL4,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Checkbox(
                                      value: third,
                                      activeColor: Colors.red,
                                      onChanged: (bool value) {
                                        setState(() {
                                          third = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      Constants.ADD_TOUR_LABEL5,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Container(
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                              height: 20.0,
                                              child: Align(
                                                alignment:
                                                Alignment.centerRight,
                                                child: Image.asset(
                                                    "assets/images/information-button.png"),
                                              ))),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 6,
                                    child: Container(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            "assets/images/smartbox.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Container(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: _myWidget.btnCancelable("ITALIAN", () => null)),
                      ),
                    )),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      child: _myWidget.btnMain(Constants.ADD_TOUR_BUTTON_MAIN, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddATour2()),
                        );
                      }),
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
