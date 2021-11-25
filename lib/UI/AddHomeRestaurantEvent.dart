import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/UI/Allergies.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'AddHomeRestaurantEvent2.dart';

class AddNewEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewEvent();
}

class _AddNewEvent extends State<AddNewEvent> {
  MyWidget _myWidget;
  bool first, second, third;

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

  int value1 = 0, value2 = 0;
  ProgressDialog _progressDialog = ProgressDialog();

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems = [];
  ListItem _selectedItem;
  List<DropdownMenuItem<ListItem>> _selectedLanguageMenuList = [];

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    fetchCategoriesData();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;

    _selectedLanguageMenuList = buildDropDownMenuItems(_selectedItemDropDown);
    _selectedLanguage = _selectedLanguageMenuList[0].value;
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

  List<ListItem> _dropdownItems = [];

  fetchCategoriesData() {
    GlobalState.category.data.forEach((element) {
      _dropdownItems.add(ListItem(element.id, element.en));
    });
  }

  /// DATA ABOUT DROPDOWN
  /// Main Languages
  // var languageList = ["Italian", "English", "Espanol"];

  List<ListItem> _selectedItemDropDown = [
    ListItem('IT', 'Italian'),
    ListItem('US', 'English'),
    ListItem('ES', 'Espanol'),
  ];

  // var _selectedLanguage = "Select Language";
  ListItem _selectedLanguage;

  //////  Spoken Languages
  var spokenList = ["Italian", "English", "Espanol"];
  var _selectedSpokenLanguage = "Spoken Language";
  var selectedSpokenList = [];
  ////
  List<XFile> imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(GlobalState.body_map);
          // GlobalState.body_map.clear();
        },
      ),
      appBar: _myWidget.myAppBar("Add New Event", () {
        Navigator.pop(context);
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
                                  // if (GlobalState.body_map
                                  //     .containsKey("TipoeventoID"))
                                  //   GlobalState.body_map.update("TipoeventoID",
                                  //       (value) => _selectedItem.value);
                                  // else
                                  //   GlobalState.body_map.putIfAbsent(
                                  //       "TipoeventoID",
                                  //       () => _selectedItem.value);
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
                          "ALLERGIES AND INTOLERANCES", () async {
                        var getAllergies = await Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Allergies()));
                        GlobalState.add_Events
                            .update("Allergie", (value) => getAllergies);
                      }),
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
                                  GlobalState.add_Events
                                      .update("PerFamiglie", (value) => first);
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
                                  GlobalState.add_Events
                                      .update("Nobambini", (value) => second);
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
                                          GlobalState.add_Events.update(
                                              "Smartbox", (value) => third);
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
                                    child: DropdownButton<ListItem>(
                                      hint: Padding(
                                        padding: EdgeInsets.all(8.0),
                                      ),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedLanguage = newValue;
                                          if (GlobalState.body_map
                                              .containsKey("Lingua"))
                                            GlobalState.body_map.update(
                                                "Lingua",
                                                (value) =>
                                                    _selectedLanguage.value);
                                          else
                                            GlobalState.body_map.putIfAbsent(
                                                "Lingua",
                                                () => _selectedLanguage.value);
                                        });
                                      },
                                      items: _selectedLanguageMenuList,
                                      value: _selectedLanguage,
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
                selectedSpokenList.isEmpty
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                      )
                    : Container(
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

                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: _myWidget.btnMain("Continue", () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        GlobalState.add_Events.update(
                            "Lingua", (value) => _selectedLanguage.value);
                        GlobalState.add_Events.update(
                            "LuogoCitta", (value) => _selectedSpokenLanguage);
                        GlobalState.add_Events.update(
                            "TipoeventoID", (value) => _selectedItem.value);
                        // print(GlobalState.body_map);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewEvent2()),
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

// {"HostID": 1,"Lingua": "IT","TipoeventoID": 1,"Smartbox": false,"Nome": "Nome evento","PartecipantiMinimo": 1,"PartecipantiMassimo": 3,"LuogoCitta":"Napoli","LuogoCittaID":"ChIJ6_p622YIOxMRfriMZcxDOtI","Descrizione_it":"Descrizione evento in italiano","Lingue":"IT,EN","Nobambini": true,"PerFamiglie": false,"Cucina":"I","Allergie": "","Luogo": "Via Michelangelo da Caravaggio, 70b, 80126 Napoli NA, Italia","LuogoNote_it": "Sotto la statua",}