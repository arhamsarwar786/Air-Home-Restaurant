import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';


class CorsoCusinaOnline2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CorsoCusinaOnline2();
}

class _CorsoCusinaOnline2 extends State<CorsoCusinaOnline2> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      _myWidget.myAppBar("Clase de cusina Online", () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFF7878),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          child: Text(
                            Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_BUTTON1,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/back-in-time.png")),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _myWidget.myText(
                                  "04h 00m", 12, FontWeight.bold, 1, Colors.black),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/translation.png")),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _myWidget.myText("English, Spanish", 12,
                                  FontWeight.bold, 1, Colors.black),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/group.png")),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _myWidget.myText("MIN 1 - MAX 10", 12,
                                  FontWeight.bold, 1, Colors.black),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/family.png")),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _myWidget.myText("Recommended for families",
                                  12, FontWeight.bold, 1, Colors.black),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                    child: Text(
                      Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_LABEL1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )
                  // _myWidget.myText(Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_LABEL2, 15, FontWeight.bold, null, Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // _myWidget.allergiesIntorancesBottomSheet(context);
                  },
                  child: Center(
                    child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF7878),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Text(
                            Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_BUTTON2,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _myWidget.myText(
                            Constants.CORSO_CUSINA3_ALLLEGIES_MODEL_LABEL2,
                            15.0,
                            FontWeight.bold,
                            1,
                            Colors.black),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        return listItem(position);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                    child: _myWidget.myText(
                        Constants.CORSO_CUSINA3_ALLLEGIES_MODEL_BUTTON1, 12, FontWeight.bold, 1, Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(int position) {
    MyWidget _myWidget = new MyWidget();
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          // decoration: BoxDecoration(color: Colors.black12),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(40.0)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _myWidget.myText("Title $position", 12,
                                      FontWeight.bold, 1, Colors.black),
                                  _myWidget.myText("Bercelona, Spagna", 10,
                                      FontWeight.bold, 1, Colors.black38),
                                ],
                              ),
                            ),
                            _myWidget.myText("6 hourse ago", 10, FontWeight.bold,
                                1, Colors.black38),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            color: Colors.black,
                            height: 30.0,
                            width: 150.0,
                          ),
                        ),
                        Container(
                          child: _myWidget.myText(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              10,
                              FontWeight.bold,
                              null,
                              Colors.black38),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        height: 20.0,
                                        width: 20.0,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    Container(
                                      child: _myWidget.myText("Likes", 12,
                                          FontWeight.bold, 1, Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        height: 20.0,
                                        width: 20.0,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    Container(
                                      child: _myWidget.myText("Share", 12,
                                          FontWeight.bold, 1, Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
}
