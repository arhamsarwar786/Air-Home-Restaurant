import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/UI/Allergies.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_corso_cusina_classic_event2.dart';

class AddCookingClassEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCookingClassEvent();
}

class _AddCookingClassEvent extends State<AddCookingClassEvent> {
  MyWidget _myWidget;
  bool first, second, third;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
    ListItem(5, "Fifth Item"),
    ListItem(6, "Sixth Item")
  ];

  List<ListItem> _selectedItemDropDown = [
    ListItem('IT', 'Italian'),
    ListItem('US', 'English'),
    ListItem('ES', 'Espanol'),
  ];

  //////  Spoken Languages
  var spokenList = ["Italian", "English", "Espanol"];
  var _selectedSpokenLanguage = "Spoken Language";
  var selectedSpokenList = [];
  ListItem _selectedLanguage;

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  List<DropdownMenuItem<ListItem>> _selectedLanguageMenuList = [];

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Add a cooking class", () {
        Navigator.pop(context);
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                              "ALLERGIES AND INTOLERANCES", () async{
                                var getAllergies =await Navigator.push(context, MaterialPageRoute(builder: (_)=> Allergies()));
                                GlobalState.add_cooking_class.update("Allergie", (value) => getAllergies);
                                //  if (GlobalState.body_map
                                //                   .containsKey("Allergie"))
                                //                 GlobalState.body_map.update(
                                //                     "Allergie", (value) => getAllergies);
                                //               else
                                //                 GlobalState.body_map.putIfAbsent(
                                //                     "Allergie", () => getAllergies);
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
                                GlobalState.add_cooking_class.update("PerFamiglie", (value) => first);

                                      //    if (GlobalState.body_map
                                      //     .containsKey("PerFamiglie"))
                                      //   GlobalState.body_map.update(
                                      //       "PerFamiglie", (value) => first);
                                      // else
                                      //   GlobalState.body_map.putIfAbsent(
                                      //       "PerFamiglie", () => first);
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
                                       GlobalState.add_cooking_class.update("Nobambini", (value) => second);
                                      //  if (GlobalState.body_map
                                      //     .containsKey("Nobambini"))
                                      //   GlobalState.body_map
                                      //       .update("Nobambini", (value) => second);
                                      // else
                                      //   GlobalState.body_map
                                      //       .putIfAbsent("Nobambini", () => second);
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
                                              GlobalState.add_cooking_class.update("Smartbox", (value) => third);
                                              //   if (GlobalState.body_map
                                              //     .containsKey("Smartbox"))
                                              //   GlobalState.body_map.update(
                                              //       "Smartbox", (value) => third);
                                              // else
                                              //   GlobalState.body_map.putIfAbsent(
                                              //       "Smartbox", () => third);
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
                            padding: EdgeInsets.only(left: 10),
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

             
                 
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          child: _myWidget.btnMain("Continue", () {

                            GlobalState.add_cooking_class.update("Lingua", (value) => _selectedLanguage.value);
                              GlobalState.add_cooking_class.update("LuogoCitta", (value) => _selectedSpokenLanguage);

                              print(GlobalState.add_cooking_class);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCookingClassEvent2()),
                            );
                          }),
                        ),
                      ),
                    ),
          ),
        ],
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
