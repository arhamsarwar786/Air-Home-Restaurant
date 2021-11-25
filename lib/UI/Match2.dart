import 'dart:collection';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'MainScreen.dart';

class Match2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Match2();
}

class _Match2 extends State<Match2> {
  MyWidget _myWidget;
  TextEditingController titleMatchController,
      cityMatchController,
      descriptionMatchController;
  int value1, value2;


// 1 Montagna
// 2 Mare
// 3 Citta'
// 4 Campagna 

  List<XFile> imageFileList = [];

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];
  List<ListItem> _selectedItemDropDownCategory = [
    ListItem('1', 'Montagna'),
    ListItem('2', 'Mare'),
    ListItem('3', 'Citta'),
    ListItem('4', 'Campagna'),
  ];
  List<DropdownMenuItem<ListItem>> _selectedCategoryList = [];
  ListItem _selectedCategory;
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    titleMatchController = new TextEditingController();
    cityMatchController = new TextEditingController();
    descriptionMatchController = new TextEditingController();
    value2 = 1;
    value1 = 1;

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;


  /// Categories 
  /// 
    _selectedCategoryList = buildDropDownMenuItems(_selectedItemDropDownCategory);
    _selectedCategory = _selectedCategoryList[0].value;
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
      appBar: _myWidget.myAppBar(Constants.MATCH2_APPBAR_TITLE, () {
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.MATCH2_LABEL1,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 10.0),
                              //   child: Container(
                              //     width: double.infinity,
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(5.0)),
                              //     child: Container(
                              //       height: 40.0,
                              //       width: double.infinity,
                              //       color: Colors.white,
                              //       child: DropdownButtonHideUnderline(
                              //         child: DropdownButton<ListItem>(
                              //           value: _selectedItem,
                              //           items: _dropdownMenuItems,
                              //           onChanged: (value) {
                              //             setState(() {
                              //               _selectedItem = value;
                              //             });
                              //           },
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                          
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.MATCH2_LABEL2,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Container(
                                    height: 40.0,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<ListItem>(
                                        value: _selectedCategory,
                                        items: _selectedCategoryList,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCategory = value;
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
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.MATCH2_LABEL3,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
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
                                        titleMatchController,
                                        1,
                                        Constants.MATCH2_TEXTFIELED1_HINT),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.MATCH2_LABEL4,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
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
                                        cityMatchController,
                                        1,
                                        Constants.MATCH2_TEXTFIELED2_HINT),
                                  ),
                                ),
                              ),
                            ],
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
                                            Constants.MATCH2_LABEL5,
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async{                              
                                   final ImagePicker imagePicker =
                                        ImagePicker();
                                    final List<XFile> selectedImages =
                                        await imagePicker.pickMultiImage();
                                    if (selectedImages.length >= 2) {
                                      imageFileList.addAll(selectedImages);
                                    } else {
                                      BaseClass.showSB(
                                          msg: Constants.ADD_IMAGE_2,
                                          context: context,
                                          type: Constants.FAILURE);
                                    }                                    
                                    setState(() {});
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
                                        child: imageFileList.isNotEmpty
                                            ? ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: imageFileList.length,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      // width: 100,
                                                      child: Stack(
                                                        children: [
                                                          Image.file(
                                                            File(
                                                                imageFileList[i]
                                                                    .path),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 0,
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        imageFileList
                                                                            .removeAt(i);
                                                                      });
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/delete-red.png",
                                                                      height:
                                                                          15,
                                                                      width: 15,
                                                                    ))),
                                                          ),
                                                        ],
                                                      ),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: _myWidget.myTextInput(
                                    descriptionMatchController,
                                    5,
                                    Constants.MATCH2_TEXTFIELED3_HINT),
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
                    child: _myWidget.btnMain(Constants.MATCH2_BUTTON_MAIN, () {
                       FocusScope.of(context).requestFocus(new FocusNode());

                      bool status = true;

                      if (titleMatchController.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_TITLE,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (cityMatchController.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_CITY,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (descriptionMatchController.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_DESCRIPTION,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }


                       if (status) {
                        if (titleMatchController.text.isNotEmpty &&
                            cityMatchController.text.isNotEmpty &&
                            descriptionMatchController.text.isNotEmpty) {

                          callAddMatch(
                            context: context,
                            IDUser: GlobalState.userId,
                            Title: titleMatchController.text.toString(),
                            city: cityMatchController.text.toString(),                       
                            Text: descriptionMatchController.text.toString(),
                            CategoryID: int.parse(_selectedCategory.value),
                            TypeID: int.parse(_selectedCategory.value),
                          );
                          
                        } else {
                          BaseClass.showSB(
                              msg: "SomeThing Missing",
                              context: context,
                              type: Constants.FAILURE);
                        }
                      }
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
  ProgressDialog _progressDialog = ProgressDialog();

  
  Future<void> callAddMatch(
      {@required int IDUser,
      @required int TypeID,
      @required String Title,
      @required String Text,
      @required String city,
      @required int CategoryID,
     
      @required BuildContext context}) async {
    _progressDialog.showProgressDialog(context,
        textToBeDisplayed: Constants.PLEASE_WAIT);

    Map<String, dynamic> _body_map = new HashMap();
    _body_map['IDUser'] = IDUser;
    _body_map['TipoID'] = TypeID;
    _body_map['Titolo'] = Title;
    _body_map['Testo'] = Text;
    _body_map['Citta'] = city;
    _body_map['CategoriaID'] = CategoryID;

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: _body_map,
        url: Constants.ADD_MATCH,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print(response.body);

          if (response != null) {
            // var user =
            //     AddBlogPostResponseModel.fromJson(jsonDecode(response.body));
  print(response.body);
            if (response == "0") {
              
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: "Something Went Wrong",
                  context: context,
                  type: Constants.FAILURE);
            } else {
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: Constants.SUCCESSFULLY_PUBLISHED_MATCH,
                  context: context,
                  type: Constants.SUCCESS);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MainScreen()));
            }
          } else {
            //empty response
            _progressDialog.dismissProgressDialog(context);
          }
        },
        onFailure: (_streamedResponse) async {
          _progressDialog.dismissProgressDialog(context);
          var response = await http.Response.fromStream(_streamedResponse);
          print(response.body);
        });
  }
}


// {"IDUser": 3730,"TipoID": 1,"Titolo":"Arham Add Title","Titolo":"Arham Add Match","Testo": "Testo Match","IDCategoria": 1,"Citta" : "Lahore"}