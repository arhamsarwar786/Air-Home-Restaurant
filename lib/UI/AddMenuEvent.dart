import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/UI/Allergies.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:http/http.dart' as http;
import 'package:air_home_retaurant/ModelClasses/VendorModal.dart';
import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/UI/AddMEnuEvent2.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMenuEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddMenuEvent();
}

class _AddMenuEvent extends State<AddMenuEvent> {
  MyWidget _myWidget;
  bool first, second, third;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];
  ListItem _selectedLanguage;
  List<DropdownMenuItem<ListItem>> _selectedLanguageMenuList = [];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  List<ListItem> _selectedItemDropDown = [
    ListItem('IT', 'Italian'),
    ListItem('US', 'English'),
    ListItem('ES', 'Espanol'),
  ];

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




//  Future<void> getMenu(
//       {@required String email,
//       @required String password,
//       @required BuildContext context}) async {
    
//     _progressDialog.showProgressDialog(context,
//         textToBeDisplayed: Constants.PLEASE_WAIT);
//     Map<String, dynamic> _body_map = new HashMap();
//     _body_map['email'] = email;
//     _body_map['password'] = password;

//     HttpServices httpServices = new HttpServices();
//     await httpServices.postJson(
//         body: _body_map,
//         url: Constants.EVENT_MENU,
//         onSuccess: (_streamedResponse) async {
//           var response = await http.Response.fromStream(_streamedResponse);
//           print(response);
//           print("this is in Login Success ${response.body}");
            
//           if (response != null) {

//             // var user = LogInResponce.fromJson(jsonDecode(response.body));
//             // GlobalState.userId = int.parse(user.data);
//             // if (Hive.box("userIdBox").get("userID") == null ||
//             //     Hive.box("userIdBox").get("userID") == '') {
//             //   Hive.box('userIdBox').put("userID", "${user.data}");
//             // }
//             if (response == "0") {
//               //email Or Password wrong
//               _progressDialog.dismissProgressDialog(context);
//               BaseClass.showSB(
//                   msg: Constants.LOGIN_INFO_ERROR,
//                   context: context,
//                   type: Constants.FAILURE);
//             } else {
//               _progressDialog.dismissProgressDialog(context);
//                BaseClass.showSB(
//               msg: Constants.SUCCESSFULLY_LOGGIN,
//               context: context,
//               type: Constants.SUCCESS);
//               Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MainScreen(),
//                     ));
         
//             }
//           } else {
//             //empty response
//             _progressDialog.dismissProgressDialog(context);
//           }
//         },
//         onFailure: (_streamedResponse) async{
//           _progressDialog.dismissProgressDialog(context);
//           var response = await http.Response.fromStream(_streamedResponse);
//           // var user = LogInResponce.fromJson(jsonDecode(response.body));
//           print("This is %%%%%%%%%%%%%%%%%%%%%% ${response.body}");
//           BaseClass.showSB(
//               // msg: user.message,
//               context: context,
//               type: Constants.FAILURE);
//           print("Login::login onFailure");

//           print("this is in OnFailure" + _streamedResponse.reasonPhrase);
//         });
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.ADD_MENU_EVENT_APPBAR_TITLE, () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: Color(0xFFF5F5F5),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          Constants.ADD_MENU_EVENT_INFO,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
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
                              Constants.ADD_MENU_EVENT_LABEL1, () {}),
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
                              Constants.ADD_MENU_EVENT_LABEL2, () async{
                               var getAllergies =await Navigator.push(context, MaterialPageRoute(builder: (_)=> Allergies()));
                                GlobalState.add_Events.update("Allergie", (value) => getAllergies);
                              }),
                        ),
                      ),
                    ),
                    Container(
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
                                GlobalState.add_Events.update("PerFamiglie", (value) => first);

                                });
                              },
                            ),
                          ),
                          Container(
                            child: Text(
                              Constants.ADD_MENU_EVENT_CHECKBOX,
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
                                GlobalState.add_Events.update("Nobambini", (value) => second);

                                });
                              },
                            ),
                          ),
                          Container(
                            child: Text(
                              Constants.ADD_MENU_EVENT_CHECKBOX2,
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      height: 40.0,
                                      width: double.infinity,
                                      color: Colors.white,
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
                                              Constants.ADD_MENU_EVENT_BUTTON1,
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                _myWidget.btnCancelable("ITALIAN", () => null)),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: _myWidget.btnMain(Constants.ADD_MENU_EVENT_BUTTON_MAIN,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddMenuEvent2()),
                    );
                  }),
                ),
              ),
            ),
          ],
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
