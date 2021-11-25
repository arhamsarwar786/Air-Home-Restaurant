import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:air_home_retaurant/UI/MainScreen.dart';
import 'package:image_picker/image_picker.dart';

import 'package:air_home_retaurant/ModelClasses/AddBlogPostResponseModel.dart';
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
import "package:http/http.dart" as http;

class AddPostBlog2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPostBlog2();
}

class _AddPostBlog2 extends State<AddPostBlog2> {
  MyWidget _myWidget;
  TextEditingController titletextcontroller,
      subtitletextcontroller,
      youtubetextcontroller,
      descriptiontextcontroller;
  int value1, value2;
  ProgressDialog _progressDialog;

// 1 Cucina Tradizionale
// 2 Cucina Etnica
// 3 Cibo e Natura

  List<XFile> imageFileList = [];

  List<ListItem> _selectedItemDropDown = [
    ListItem('1', 'Cucina Tradizionale'),
    ListItem('2', 'Cucina Etnica'),
    ListItem('3', 'Cibo e Natura'),
  ];

  List<DropdownMenuItem<ListItem>> _selectedCategoryList = [];
  ListItem _selectedCategory;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _progressDialog = ProgressDialog();

    titletextcontroller = new TextEditingController();
    subtitletextcontroller = new TextEditingController();
    youtubetextcontroller = new TextEditingController();
    descriptiontextcontroller = new TextEditingController();
    value2 = 1;
    value1 = 1;

    _selectedCategoryList = buildDropDownMenuItems(_selectedItemDropDown);
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
      appBar: _myWidget.myAppBar(Constants.ADD_POST_BLOG2_APPBAR_TITLE, () {
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
                                          Constants.ADD_POST_BLOG2_LABEL1,
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
                                        titletextcontroller,
                                        1,
                                        Constants
                                            .ADD_POST_BLOG2_TEXTFIELED1_HINT),
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
                                          Constants.ADD_POST_BLOG2_LABEL2,
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
                                        subtitletextcontroller,
                                        1,
                                        Constants
                                            .ADD_POST_BLOG2_TEXTFIELED2_HINT),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.ADD_POST_BLOG2_LABEL3,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: _myWidget.myTextInput(
                                        youtubetextcontroller,
                                        1,
                                        Constants
                                            .ADD_POST_BLOG2_TEXTFIELED3_HINT),
                                  ),
                                ),
                              ),
                              Container(
                                child: _myWidget.myText(
                                    Constants.ADD_POST_BLOG2_TEXT1,
                                    8,
                                    FontWeight.bold,
                                    1,
                                    Colors.black),
                              ),
                              Container(
                                child: _myWidget.myText(
                                    Constants.ADD_POST_BLOG2_TEXT2,
                                    8,
                                    FontWeight.bold,
                                    1,
                                    Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        InkWell(
                          onTap: () async {
                            final ImagePicker imagePicker = ImagePicker();

                            final List<XFile> selectedImages =
                                await imagePicker.pickMultiImage();
                            if (selectedImages.isNotEmpty) {
                              imageFileList.addAll(selectedImages);
                            }
                            print("Image List Length:" +
                                imageFileList.length.toString());
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
                                child: imageFileList.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: imageFileList.length,
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(
                                                  File(imageFileList[i].path)),
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
                                    descriptiontextcontroller,
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
                      FocusScope.of(context).requestFocus(new FocusNode());

                      bool status = true;

                      if (titletextcontroller.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_TITLE,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (subtitletextcontroller.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_SUBTITLE,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (descriptiontextcontroller.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_DESCRIPTION,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }
                      if (status) {
                        if (titletextcontroller.text.isNotEmpty &&
                            subtitletextcontroller.text.isNotEmpty &&
                            descriptiontextcontroller.text.isNotEmpty) {
                          callAddBlogPost(
                            context: context,
                            IDUser: GlobalState.userId,
                            Title: titletextcontroller.text.toString(),
                            Subtitle: subtitletextcontroller.text.toString(),
                            Video: youtubetextcontroller.text.toString(),
                            Text: descriptiontextcontroller.text.toString(),
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

  Future<void> callAddBlogPost(
      {@required int IDUser,
      @required int TypeID,
      @required String Title,
      @required String Text,
      @required String Subtitle,
      @required int CategoryID,
      @required String Video,
      @required BuildContext context}) async {
    _progressDialog.showProgressDialog(context,
        textToBeDisplayed: Constants.PLEASE_WAIT);

    Map<String, dynamic> _body_map = new HashMap();
    _body_map['IDUser'] = IDUser;
    _body_map['TipoID'] = TypeID;
    _body_map['Titolo'] = Title;
    _body_map['Testo'] = Text;
    _body_map['Sottotitolo'] = Subtitle;
    _body_map['IDCategoria'] = CategoryID;
    _body_map['Video'] = Video;

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: _body_map,
        url: Constants.ADD_ALL_Blog_API,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print(response.body);

          if (response != null) {
            var user =
                AddBlogPostResponseModel.fromJson(jsonDecode(response.body));

            if (response == "0") {
              //email Or Password wrong
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: "Something Went Wrong",
                  context: context,
                  type: Constants.FAILURE);
            } else {
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: Constants.SUCCESSFULLY_PUBLISHED,
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
        });
  }
}
