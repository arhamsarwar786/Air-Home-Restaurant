import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewEvent();
}

class _AddNewEvent extends State<AddNewEvent> {
  MyWidget _myWidget;
  bool first, second, third;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  TextEditingController addCookingClassEvent2Controller =
      TextEditingController();
  TextEditingController addCookingClassEvent2Controller2 =
      TextEditingController();
  TextEditingController addCookingClassEvent3Controller =
      TextEditingController();
  TextEditingController addCookingClassEvent3Controller2 =
      TextEditingController();
  TextEditingController addCookingClassEvent3Controller3 =
      TextEditingController();

  int value1, value2;

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

  ////   DATA ABOUT DROPDOWN
  /// Main Languages
  var languageList = ["Italian", "English", "Espanol"];
  var _selectedLanguage = "Select Language";

  //////  Spoken Languages
  var spokenList = ["Italian", "English", "Espanol"];
  var _selectedSpokenLanguage = "Spoken Language";
  var selectedSpokenList = [];
  ////
 List<XFile> imageFileList = [];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Add New Event", () {
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
                      "It's time to meet with new people and share great food. Fill in all the fields correctly and create your event in 3 simple steps! the method is totally free, enter the price per person, compose the menu with the related images and you will receive the price indicated by you! Remember that AirHomeRestaurant will apply a maximum percentage of 20% that it will charge to end customers!",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: _myWidget.myText("EVENT TYPE", 12,
                                    FontWeight.bold, 1, Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                      ],
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
                      child: _myWidget.selectCategory("CUISINE TYPE", () {}),
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
                          "ALLERGIES AND INTOLERANCES", () {}),
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
                                      "SmartBoxEvent",
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
                                    child: DropdownButton(
                                      hint: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          _selectedLanguage,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _selectedLanguage = newValue;
                                        });
                                      },
                                      items: languageList.map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text("$item"),
                                        );
                                      }).toList(),
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
                                    child: DropdownButton(
                                      hint: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          _selectedSpokenLanguage,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _selectedSpokenLanguage = newValue;
                                        });
                                      },
                                      items: spokenList.map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text("$item"),
                                        );
                                      }).toList(),
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
                                  onTap: () {
                                    if (_selectedSpokenLanguage ==
                                        'Spoken Language') {
                                      BaseClass.showSB(
                                          msg: Constants.EMPTY_LIST_INFO_ERROR,
                                          context: context,
                                          type: Constants.FAILURE);
                                    } else {
                                      if (selectedSpokenList
                                          .contains(_selectedSpokenLanguage)) {
                                        BaseClass.showSB(
                                            msg: Constants
                                                .ALREADY_IN_LIST_INFO_ERROR,
                                            context: context,
                                            type: Constants.FAILURE);
                                      } else {
                                        setState(() {
                                          selectedSpokenList
                                              .add(_selectedSpokenLanguage);
                                          selectedSpokenList =
                                              selectedSpokenList
                                                  .toSet()
                                                  .toList();
                                        });
                                      }
                                    }
                                  },
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

                /// Here Use CHips
                ///
                Container(
                  height: 50,
                  child: ListView.builder(
                      itemCount: selectedSpokenList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFF7878),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: InputChip(
                              onDeleted: () {
                                setState(() {
                                  selectedSpokenList.removeAt(i);
                                });
                              },
                              backgroundColor: Color(0xFFFF7878),
                              label: Text('${selectedSpokenList[i]}',
                                  style: TextStyle(color: Colors.white)),
                              onSelected: (bool value) {},
                            ),
                          ),
                        );
                      }),
                ),

                ///  2nd Home Restaurant
                ///
                Container(
                  color: Color(0xFFF5F5F5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
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
                                                    "EVENT TITLE",
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: _myWidget.myTextInput(
                                                  addCookingClassEvent2Controller,
                                                  1,
                                                  "My Home Restaurant Event"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(children: [
                                              Expanded(
                                                  child: Row(
                                                children: [
                                                  Container(
                                                      child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5.0),
                                                      child: _myWidget.myText(
                                                          "MIN",
                                                          12,
                                                          FontWeight.bold,
                                                          1,
                                                          Colors.black),
                                                    ),
                                                  )),
                                                  Container(
                                                      child: Expanded(
                                                          child: Center(
                                                              child: _myWidget
                                                                  .selectValue(
                                                                      () {
                                                                        setState(
                                                                            () {
                                                                          value1++;
                                                                          print(
                                                                              "$value1");
                                                                        });
                                                                      },
                                                                      value1,
                                                                      () {
                                                                        setState(
                                                                            () {
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5.0),
                                                      child: _myWidget.myText(
                                                          "MAX",
                                                          12,
                                                          FontWeight.bold,
                                                          1,
                                                          Colors.black),
                                                    ),
                                                  )),
                                                  Container(
                                                      child: Expanded(
                                                          child: Center(
                                                              child: _myWidget
                                                                  .selectValue(
                                                                      () {
                                                                        setState(
                                                                            () {
                                                                          value2++;
                                                                          print(
                                                                              "$value2");
                                                                        });
                                                                      },
                                                                      value2,
                                                                      () {
                                                                        setState(
                                                                            () {
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: _myWidget.myTextInput(
                                          addCookingClassEvent2Controller2,
                                          5,
                                          "Enter your event description here"),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
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
                                          InkWell(
                                            onTap: () async {
                                              final ImagePicker imagePicker =
                                                  ImagePicker();

                                              final List<XFile> selectedImages =
                                                  await imagePicker
                                                      .pickMultiImage();
                                              if (selectedImages.isNotEmpty) {
                                                imageFileList
                                                    .addAll(selectedImages);
                                              }
                                              print("Image List Length:" +
                                                  imageFileList.length
                                                      .toString());
                                              setState(() {});
                                              print(imageFileList);
                                            },
                                            child: Container(
                                              child: DottedBorder(
                                                color: Colors.black38,
                                                strokeWidth: 1,
                                                child: Container(
                                                  height: 150,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                 child:  imageFileList.isNotEmpty ?  ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: 2,                                                    
                                                    itemBuilder: (context,i){
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: Image.asset("assets/images/camera.png"),
                                                      ),
                                                    );
                                                  })
                                               : Center(
                                                      child: Container(
                                                          height: 80,
                                                          width: 80,
                                                          child: Image.asset(
                                                              "assets/images/camera.png"))),
                                                ),
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
                                                child: _myWidget.myText(
                                                    "EVENT TITLE",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
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
                                                itemBuilder:
                                                    (context, position) {
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 100.0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFFF7878),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "ADD COURSE",
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
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              child: _myWidget.btnMain("Continue", () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => AddNewEvent3()),
                                // );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ////  3rd Home Restaurant
                ///
                Container(
                  color: Color(0xFFF5F5F5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .ADD_NEW_EVENT3_LABEL1,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: _myWidget.myTextInput(
                                              addCookingClassEvent3Controller,
                                              1,
                                              Constants
                                                  .ADD_NEW_EVENT3_TEXTFIELD1_HINT),
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
                                              vertical: 10.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .ADD_NEW_EVENT3_LABEL2,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: _myWidget.myTextInput(
                                              addCookingClassEvent3Controller,
                                              1,
                                              Constants
                                                  .ADD_NEW_EVENT3_TEXTFIELD2_HINT),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
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
                                                addCookingClassEvent3Controller,
                                                5,
                                                Constants
                                                    .ADD_NEW_EVENT3_TEXTFIELD3_HINT),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
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
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL3,
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL4,
                                                    "30/04/2021")),
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL5,
                                                    "09:15-10:15")),
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL6,
                                                    "15,00EUR")),
                                            Expanded(
                                                child: _myWidget.dataColumn(
                                                    Constants
                                                        .ADD_NEW_EVENT3_LABEL7,
                                                    "10,00EUR")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
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
                                                Constants
                                                    .ADD_NEW_EVENT3_BUTTON1,
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
                        // Publish
                        InkWell(
                          onTap: () {
                            // https://airhomerestaurant.com/api/v1/nuovoevento
                          },
                          child: Container(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                child: _myWidget.btnMain(
                                    Constants.ADD_NEW_EVENT3_BUTTON_MAIN, () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => AddMenuEvent()),
                                  // );
                                }),
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
