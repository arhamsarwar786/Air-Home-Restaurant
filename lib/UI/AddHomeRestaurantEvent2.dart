import 'dart:io';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'AddHomeRestaurantEvent3.dart';

class AddNewEvent2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewEvent2();
}

class _AddNewEvent2 extends State<AddNewEvent2> {
  MyWidget _myWidget;
  TextEditingController addCookingClassEvent2Controller,
      addCookingClassEvent2Controller2;

  int value1, value2;
 List<XFile> imageFileList = [];

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    addCookingClassEvent2Controller = new TextEditingController();
    addCookingClassEvent2Controller2 = new TextEditingController();
    value2 = 1;
    value1 = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Add New Event", () {
        Navigator.pop(context);
      }),
      body:      Container(
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
                                                                         
                                                                           if (GlobalState.body_map
                                              .containsKey("PartecipantiMinimo"))
                                            GlobalState.body_map.update(
                                                "PartecipantiMinimo", (value) => value1);
                                          else
                                            GlobalState.body_map.putIfAbsent(
                                                "PartecipantiMinimo", () => value1);
                                                                        });
                                                                      },
                                                                      value1,
                                                                      () {
                                                                        setState(
                                                                            () {
                                                                          value1--;
                                                                            if (GlobalState.body_map
                                              .containsKey("PartecipantiMinimo"))
                                            GlobalState.body_map.update(
                                                "PartecipantiMinimo", (value) => value1);
                                          else
                                            GlobalState.body_map.putIfAbsent(
                                                "PartecipantiMinimo", () => value1);
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
                                                                          if (GlobalState.body_map
                                              .containsKey("PartecipantiMassimo"))
                                            GlobalState.body_map.update(
                                                "PartecipantiMassimo", (value) => value2);
                                          else
                                            GlobalState.body_map.putIfAbsent(
                                                "PartecipantiMassimo", () => value2);
                                                                        });
                                                                      },
                                                                      value2,
                                                                      () {
                                                                        setState(
                                                                            () {
                                                                          value2--;
                                                                              if (GlobalState.body_map
                                              .containsKey("PartecipantiMassimo"))
                                            GlobalState.body_map.update(
                                                "PartecipantiMassimo", (value) => value2);
                                          else
                                            GlobalState.body_map.putIfAbsent(
                                                "PartecipantiMassimo", () => value2);
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
                                              if (selectedImages.length >= 2) {
                                                imageFileList
                                                    .addAll(selectedImages);
                                              }else{
                                                   BaseClass.showSB(
                                msg: Constants.ADD_IMAGE_2,
                                context: context,
                                type: Constants.FAILURE);
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
                                                    itemCount: imageFileList.length ,                                                    
                                                    itemBuilder: (context,i){
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        // width: 100,
                                                        child: Stack(
                                                          children: [
                                                            Image.file(File(imageFileList[i].path),fit: BoxFit.cover,),
                                                            Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(15)
                                                                ),
                                                                child: InkWell(
                                                                  onTap: (){
                                                                setState(() {
                                                                imageFileList.removeAt(i);
                                                                  
                                                                });
                                                              },
                                                                  child: Image.asset("assets/images/delete-red.png",height: 15,width: 15,))),),
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
                                                physics: NeverScrollableScrollPhysics(),
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
                                // print(GlobalState.body_map);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddNewEvent3()),
                                );
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

  Widget menuListItem(int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0 ,vertical: 5.0),
          child: Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: _myWidget.myText("$position", 12.0, FontWeight.bold, 1, Colors.red),
                ),
              ),
              Container(child:
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _myWidget.myText(
                        "Course Title", 12.0, FontWeight.bold, 1, Colors.black),
                    _myWidget.myText(
                        "Course Description", 12.0, FontWeight.normal, 1, Colors.black),
                  ],
                ),
              )),
              Container(
                width: 50.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Image.asset("assets/images/delete-red.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

