import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostBlog2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPostBlog2();
}

class _AddPostBlog2 extends State<AddPostBlog2> {
  MyWidget _myWidget;
  TextEditingController addCookingClassEvent2Controller,
      addCookingClassEvent2Controller2;
  int value1, value2;

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
    addCookingClassEvent2Controller = new TextEditingController();
    addCookingClassEvent2Controller2 = new TextEditingController();
    value2 = 1;
    value1 = 1;

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
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
      appBar: _myWidget.myAppBar(Constants.ADD_POST_BLOG2_APPBAR_TITLE, () {
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
                                      vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(Constants.ADD_POST_BLOG2_LABEL1, 12,
                                          FontWeight.bold, 1, Colors.black),
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
                                        Constants.ADD_POST_BLOG2_TEXTFIELED1_HINT),
                                  ),
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
                                      vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(Constants.ADD_POST_BLOG2_LABEL2, 12,
                                          FontWeight.bold, 1, Colors.black),
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
                                        Constants.ADD_POST_BLOG2_TEXTFIELED2_HINT),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(Constants.ADD_POST_BLOG2_LABEL3, 12,
                                          FontWeight.bold, 1, Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 10.0),
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
                                        Constants.ADD_POST_BLOG2_TEXTFIELED3_HINT),
                                  ),
                                ),
                              ),
                              Container(
                                child: _myWidget.myText(
                                    Constants.ADD_POST_BLOG2_TEXT1, 8, FontWeight.bold, 1, Colors.black),
                              ),
                              Container(
                                child: _myWidget.myText(
                                    Constants.ADD_POST_BLOG2_TEXT2, 8, FontWeight.bold, 1, Colors.black),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            width: double.infinity,
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
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

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                                            Constants.ADD_POST_BLOG2_LABEL4,
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
                          child: Padding(
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
                                    5,
                                   Constants.ADD_POST_BLOG2_TEXTFIELED4_HINT),
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
                    child: _myWidget.btnMain("Publish", () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AddNewEvent3()),
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
