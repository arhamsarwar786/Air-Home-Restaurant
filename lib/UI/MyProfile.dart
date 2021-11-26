import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:air_home_retaurant/ModelClasses/User.dart';
import 'package:air_home_retaurant/UI/MainScreen.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';

class MyProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  MyWidget _myWidget;

  ProgressDialog _progressDialog = ProgressDialog();

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _selectedLanguageMenuList = buildDropDownMenuItems(_selectedItemDropDown);
    _selectedLanguage = _selectedLanguageMenuList[0].value;
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

  List<ListItem> _selectedItemDropDown = [
    ListItem('IT', 'Italian'),
    ListItem('US', 'English'),
    ListItem('ES', 'Espanol'),
  ];

  var dateOfBirth;

  /// Gender
  var genderList = ["Male", "Female"];
  var _selectedGender = "Gender";

  /// Main Languages
  var languageList = ["Italian", "English", "Espanol"];
  ListItem _selectedLanguage;
  //////  Spoken Languages
  var spokenList = ["Italian", "English", "Espanol"];
  var _selectedSpokenLanguage = "Spoken Language";
  var selectedSpokenList = [];

  /// Qualiication
  var qualificationList = [
    "Diploma",
    "Academic Diploma",
    "Ph.D",
    "Degree",
    "Master's Degree"
  ];
  var _selectedQualification = "Qualifications";

  /// JOB
  var jobList = [
    "Blogger",
    "UnEmployed",
    "Employee",
    "Entrepreneur",
    "Freelance",
    "Student"
  ];
  var _selectedJob = "Job";

  ///  TextEditing Controllers
  var birthPlace = TextEditingController();
  var address = TextEditingController();
  var phoneNumber = TextEditingController();
  var postalCode = TextEditingController();

  /// Image Picker
  final picker = ImagePicker();
  File _image;
  bool isImageUploaded = false;
  String downloadUrl;

  // Language Code Selected
  var languageCode = '';

  List<DropdownMenuItem<ListItem>> _selectedLanguageMenuList = [];
  ListItem _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.MY_PROFILE_TITLE, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width - 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.height / 7),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.height / 7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 20.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image Picker
                            Container(
                              height: 150.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red, width: 1.0),
                                  color: Colors.black38,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${downloadUrl == null ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png' : downloadUrl}"),
                                      fit: BoxFit.cover)),
                              child: isImageUploaded
                                  ? CircularProgressIndicator(
                                      color: Colors.red,
                                    )
                                  : Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () {
                                          showMyDialogue(context: context);
                                        },
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/camera.png"),
                                          color: Colors.red,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                            ),
                            // Name Saved
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: _myWidget.myText(
                                  "${GlobalState.myUser.data.nome}",
                                  20.0,
                                  FontWeight.bold,
                                  1,
                                  Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: _myWidget.myTextInput(
                              new TextEditingController(),
                              1,
                              Constants.MY_PROFILE_TEXT_FIELD1),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: _myWidget.myTextInput(
                              new TextEditingController(),
                              1,
                              Constants.MY_PROFILE_TEXT_FIELD2),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: InkWell(
                        onTap: () async {
                          print("CLICKED");
                          dateOfBirth = await _selectDate(context);
                          // dateOfBirth = DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateOfBirth);
                          // print(dateOfBirth.runtimeType);
                          setState(() {});
                          // print(DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateOfBirth));
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              "${dateOfBirth == null ? 'Date of Birth' : DateFormat('yMMMMd').format(dateOfBirth)}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Gender DropDown
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 40.0,
                          width: double.infinity,
                          color: Colors.white,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedGender,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  _selectedGender = newValue;
                                });
                              },
                              items: genderList.map((String item) {
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: TextField(
                            autofocus: false,
                            controller: birthPlace,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.MY_PROFILE_TEXT_FIELD4,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                                  print(_selectedLanguage.value);
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
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 2,
                  width: 100.0,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          // height: 40.0,
                          width: double.infinity,
                          color: Colors.white,
                          child: DropdownButtonHideUnderline(
                            child: CountryListPick(
                              appBar: AppBar(
                                backgroundColor: Colors.red,
                                title: Text("Select Country"),
                              ),
                              onChanged: (val) {
                                languageCode = val.code;
                                print(languageCode);
                              },
                              initialSelection: 'PK',
                              theme: CountryTheme(
                                alphabetSelectedBackgroundColor: Colors.red,
                                labelColor: Colors.red,
                                alphabetTextColor: Colors.black,
                                isShowFlag: false,
                                isShowTitle: true,
                                isShowCode: false,
                                isDownIcon: false,
                                showEnglishName: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: TextField(
                            autofocus: false,
                            controller: address,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.MY_PROFILE_TEXT_FIELD5,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: TextField(
                            autofocus: false,
                            controller: postalCode,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.MY_PROFILE_TEXT_FIELD6,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: TextField(
                            onTap: () {
                              print(phoneNumber.text.length);
                              //             Fluttertoast.showToast(
                              // msg: "Add Last 10 Digits",
                              // toastLength: Toast.LENGTH_SHORT,
                              // gravity: ToastGravity.BOTTOM,
                              // timeInSecForIosWeb: 1,
                              // backgroundColor: Colors.red,
                              // textColor: Colors.white,
                              // fontSize: 10.0);
                            },
                            onChanged: (val) {
                              print(val);
                            },
                            autofocus: false,
                            controller: phoneNumber,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.MY_PROFILE_TEXT_FIELD7,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 40.0,
                          width: double.infinity,
                          color: Colors.white,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedQualification,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  _selectedQualification = newValue;
                                });
                              },
                              items: qualificationList.map((String item) {
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
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 40.0,
                          width: double.infinity,
                          color: Colors.white,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedJob,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  _selectedJob = newValue;
                                });
                              },
                              items: jobList.map((String item) {
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
                ],
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
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                      //// ADD Button Here
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
                                          selectedSpokenList.toSet().toList();
                                    });
                                  }
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF7878),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      Constants.MY_PROFILE2_BUTTON1,
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
            // Container(
            //     child: Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            //   child: Container(
            //     child: Align(
            //         alignment: Alignment.centerLeft,
            //         child: _myWidget.btnCancelable("ITALIAN", () => null)),
            //   ),
            // )),

            /// SAVE
            InkWell(
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                _progressDialog.showProgressDialog(context);
                bool status = true;

                if (downloadUrl == null) {
                  BaseClass.showSB(
                      msg: Constants.ADD_PICTURE,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } 
                else if (dateOfBirth == null) {
                  BaseClass.showSB(
                      msg: Constants.ADD_DATE_OF_BIRTH,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (birthPlace.text.isEmpty) {
                  BaseClass.showSB(
                      msg: Constants.ADD_BIRTH_PLACE,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (address.text.isEmpty) {
                  BaseClass.showSB(
                      msg: Constants.ADD_ADDRESS,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (postalCode.text.isEmpty) {
                  BaseClass.showSB(
                      msg: Constants.ADD_POSTCODE,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (phoneNumber.text.isEmpty) {
                  BaseClass.showSB(
                      msg: Constants.ADD_PHONE_NUMBERS,
                      context: context,
                      type: Constants.FAILURE);

                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (phoneNumber.text.length < 10) {
                  BaseClass.showSB(
                      msg: Constants.PHONE_NUMBERS_LENGTH,
                      context: context,
                      type: Constants.FAILURE);
                                        status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (_selectedQualification == "Qualifications") {
                  BaseClass.showSB(
                      msg: Constants.ADD_QUALIFICATION,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                } else if (_selectedJob == "Job") {
                  BaseClass.showSB(
                      msg: Constants.ADD_JOB,
                      context: context,
                      type: Constants.FAILURE);
                  status = false;
                  _progressDialog.dismissProgressDialog(context);
                }
                if (status) {
                  if ( downloadUrl != null && dateOfBirth != null &&
                      birthPlace.text.isNotEmpty &&
                      address.text.isNotEmpty &&
                      _selectedQualification != "Qualifications" &&
                      _selectedJob != "Job" &&
                      phoneNumber.text.isNotEmpty && phoneNumber.text.length > 9 &&
                      postalCode.text.isNotEmpty) {
                  // _progressDialog.showProgressDialog(context);

                    print("SuccessFul");

                    HttpServices httpServices = new HttpServices();
                    await httpServices.postJson(
                        body: {
                          "ID": "${GlobalState.userId}",
                          "Payoff": "",
                          "UrlFoto": "$downloadUrl",
                          "DataDiNascita": "$dateOfBirth",
                          // "NatoA": "Napoli",
                          // "Host": false,
                          // "Chef": true,
                          // "Guide": true,
                          // "Ambassador": true,
                          // "Airagency": true,
                          // "DisponibileXEventiPrivati": true,
                          "Telefono": "${phoneNumber.text}",
                          "Indirizzo": "${address.text}",
                          "Nazione": "${languageCode}",
                          "Citta": "${birthPlace.text}",
                          "CAP": "${postalCode.text}",
                          // "IdTitoloDiStudio": 3,
                          // "ListaAllergie": "I,J",
                          // "ListaTipiDiCucinaGuest": "I,J",
                          "ListaTipiDiCucinaHost": "",
                          // "ListaLingue": "IT,EN",
                          // "IdProfessione": 5,
                          "LinguaMadre": "${_selectedLanguage}",
                          // "Valuta": "EUR",
                          // "Valutazione": 0,
                          "Descrizione": "Arham Here",
                          // "IBAN": "123",
                          "RagioneSociale": "",
                          "SedeLegale": "",
                          "PIVA": "",
                          "CF": "",
                          "ReferenteAzienda": "",
                          "PEC": "",
                          "SDI": "",
                          // "ProfiloCompleto": 2,
                          // "Credito": 45,
                          // "RicaricoEvento": 20,
                          // "InAttesadiEssereEliminato": false,
                          "SitoWeb": "",
                          "UrlVideo": ""
                        },
                        url: Constants.UPDATE_USER_PROFILE,
                        onSuccess: (_streamedResponse) async {
                          var response =
                              await http.Response.fromStream(_streamedResponse);
                          print(response.body);

                          if (response != null) {
                            if (response == "0") {
                              //email Or Password wrong
                              _progressDialog.dismissProgressDialog(context);
                              BaseClass.showSB(
                                  msg: Constants.PROFILE_INFO_ERROR,
                                  context: context,
                                  type: Constants.FAILURE);
                            } else {
                              _progressDialog.dismissProgressDialog(context);
                              BaseClass.showSB(
                                  msg: Constants.SUCCESSFULLY_UPDATED,
                                  context: context,
                                  type: Constants.SUCCESS);
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> MainScreen() ));

                       
                            }
                          } else {
                            //empty response
                            _progressDialog.dismissProgressDialog(context);
                          }
                        },
                        onFailure: (_streamedResponse) async {
                          // _progressDialog.dismissProgressDialog(context);
                          var response =
                              await http.Response.fromStream(_streamedResponse);
                          print(response.body);
                          BaseClass.showSB(
                              msg: _streamedResponse.reasonPhrase,
                              context: context,
                              type: Constants.FAILURE);
                        });
                  } else {
                    // status = false;
                  _progressDialog.dismissProgressDialog(context);
                    BaseClass.showSB(
                        msg: "SomeThing Missing",
                        context: context,
                        type: Constants.FAILURE);

                  }
                }else{
                  _progressDialog.dismissProgressDialog(context);

                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        Constants.PASSWORD_CHANGE_BUTTON_MAIN,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 2,
                  width: 100.0,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 50.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Text(
                    Constants.MY_PROFILE2_TEXT,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteAccount(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {}

  // Select Date Of Birth
  _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime selected = await showDatePicker(
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red,
            accentColor: Colors.red,
            colorScheme: ColorScheme.light(primary: Colors.red),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
    return selectedDate;
  }

  ///  Upload An IMage
  showMyDialogue({@required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListView(
              shrinkWrap: true,
              children: [
                SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Camera'),
                    ),
                    onPressed: () {
                      selectOrTakePhoto(
                        context: context,
                        imageSource: ImageSource.camera,
                      );
                    }),
                Divider(
                  height: 5,
                ),
                SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Gallery'),
                    ),
                    onPressed: () {
                      selectOrTakePhoto(
                        context: context,
                        imageSource: ImageSource.gallery,
                      );
                    }),
              ],
            ),
          );
        });
  }

  /// Method for sending a selected or taken photo to the DialogBox
  Future selectOrTakePhoto({
    @required BuildContext context,
    @required ImageSource imageSource,
  }) async {
    var storage = FirebaseStorage.instance;
    picker.pickImage(source: imageSource, imageQuality: 10).then((value) async {
      isImageUploaded = true;
      setState(() {});
      Navigator.pop(context);
      // print("value Path = ${value.path}");
      if (value != null)
        _image = File(value.path);
      else {
        isImageUploaded = false;
        setState(() {});
      }
      print("Picture Path = $_image");
      if (_image != null) {
        // _progressDialog.showProgressDialog(context);
        String imageName =
            "AirHomeRestaurantUser_${GlobalState.userId}_Image.jpg";
        TaskSnapshot snapshot = await storage
            .ref()
            .child("${Constants.USER_PHOTOS}$imageName")
            .putFile(_image);
        if (snapshot.state == TaskState.success) {
          // _progressDialog.dismissProgressDialog(context);
          downloadUrl = await snapshot.ref.getDownloadURL();
          snapshot.ref.getMetadata().then((value) =>
              print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& ${value.fullPath}"));
          isImageUploaded = false;
          setState(() {});
          log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%% URL = $downloadUrl');
          if (downloadUrl != null) {
            log('%%%%%%%%%%%%%%%%%%%%%%%%%%%% downloadUrl = $downloadUrl');
            // _progressDialog.dismissProgressDialog(context);

          } else {
            // _progressDialog.dismissProgressDialog(context);

            // _notification.error(
            // message: 'غير قادر على تحميل الصورة المصغرة', context: context);
            Navigator.pop(context);
          }
          // _progressDialog.dismissProgressDialog(context);

        } else {
          _progressDialog.dismissProgressDialog(context);
          Navigator.pop(context);
          print('Error from image repo ${snapshot.state.toString()}');
          throw ('This file is not an image');
        }
      }
    });
  }

  getUserProfile({@required BuildContext context}) async {
    print("USER ID  : ${GlobalState.userId}");
    if (GlobalState.myUser == null) {
      HttpServices httpServices = new HttpServices();
      var res1 = await httpServices.getFutureJsonWithBody(
          url: Constants.USER_API + GlobalState.userId.toString());
      var response1 = await http.Response.fromStream(res1);

      if (response1.statusCode == 200) {
        print(" ${response1.body}");
        var responseList = MyUser.fromJson(jsonDecode(response1.body));
        if (responseList != null) {
          GlobalState.myUser = responseList;
        }
      } else {
        log("API STATUS CODE = ${response1.statusCode}");
      }
    }
  }
}
