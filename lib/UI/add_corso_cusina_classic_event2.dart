import 'dart:io';

import 'package:air_home_retaurant/UI/add_corso_cusina_classic_event3.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCookingClassEvent2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCookingClassEvent2();
}

class _AddCookingClassEvent2 extends State<AddCookingClassEvent2> {
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
      appBar: _myWidget.myAppBar("Add a cooking class", () {
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText("EVENT TITLE", 12,
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
                                        "My Classic Cooking Class"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                            padding: const EdgeInsets.symmetric(
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
                                                    child:
                                                        _myWidget.selectValue(
                                                            () {
                                                              setState(() {
                                                                value1++;
                                                                print(
                                                                    "$value1");
                                                                GlobalState
                                                                    .add_cooking_class
                                                                    .update(
                                                                        "PartecipantiMinimo",
                                                                        (value) =>
                                                                            value1);
                                                              });
                                                            },
                                                            value1,
                                                            () {
                                                              setState(() {
                                                                value1--;
                                                                GlobalState
                                                                    .add_cooking_class
                                                                    .update(
                                                                        "PartecipantiMinimo",
                                                                        (value) =>
                                                                            value1);

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
                                            padding: const EdgeInsets.symmetric(
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
                                                    child:
                                                        _myWidget.selectValue(
                                                            () {
                                                              setState(() {
                                                                value2++;
                                                                GlobalState
                                                                    .add_cooking_class
                                                                    .update(
                                                                        "PartecipantiMassimo",
                                                                        (value) =>
                                                                            value2);

                                                                print(
                                                                    "$value2");
                                                              });
                                                            },
                                                            value2,
                                                            () {
                                                              setState(() {
                                                                value2--;
                                                                GlobalState
                                                                    .add_cooking_class
                                                                    .update(
                                                                        "PartecipantiMassimo",
                                                                        (value) =>
                                                                            value1);

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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: _myWidget.myTextInput(
                                addCookingClassEvent2Controller2,
                                5,
                                "Enter the description of your cooking class here"),
                          ),
                        ),
                        InkWell(
                          onTap: ()async{
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
                              
                        
                        )
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
                      print(GlobalState.add_cooking_class);

                      FocusScope.of(context).requestFocus(new FocusNode());
                      bool status = true;

                      if (addCookingClassEvent2Controller.text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_TITLE,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      } else if (addCookingClassEvent2Controller2
                          .text.isEmpty) {
                        BaseClass.showSB(
                            msg: Constants.ADD_DESCRIPTION,
                            context: context,
                            type: Constants.FAILURE);
                        status = false;
                      }

                      if (status) {
                        if (addCookingClassEvent2Controller.text.isNotEmpty &&
                            addCookingClassEvent2Controller2.text.isNotEmpty) {
                          GlobalState.add_cooking_class.update("Nome",
                              (value) => addCookingClassEvent2Controller.text);
                          GlobalState.add_cooking_class.update("Descrizione_it",
                              (value) => addCookingClassEvent2Controller2.text);
                          // if (GlobalState.body_map
                          //               .containsKey("Nome"))
                          //             GlobalState.body_map.update(
                          //                 "Nome", (value) => addCookingClassEvent2Controller.text);
                          //           else
                          //             GlobalState.body_map.putIfAbsent(
                          //                 "Nome", () => addCookingClassEvent2Controller.text);

                          //     if (GlobalState.body_map
                          //               .containsKey("Descrizione_it"))
                          //             GlobalState.body_map.update(
                          //                 "Descrizione_it", (value) => addCookingClassEvent2Controller2.text);
                          //           else
                          //             GlobalState.body_map.putIfAbsent(
                          //                 "Descrizione_it", () => addCookingClassEvent2Controller2.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCookingClassEvent3()),
                          );
                        } else {
                          // status = false;
                          BaseClass.showSB(
                              msg: "SomeThing Missing",
                              context: context,
                              type: Constants.FAILURE);
                        }
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AddCookingClassEvent3()),
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
