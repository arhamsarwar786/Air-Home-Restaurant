import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ERestaurant3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ERestaurant3();
}

class _ERestaurant3 extends State<ERestaurant3> {
  MyWidget _myWidget;
  int value1;
  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    value1 = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      _myWidget.myAppBar(Constants.E_RESTAURANT3_TITLE, () {
        // Navigator.pop(context);
      }),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 250.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: _myWidget.myText(
                                Constants.E_RESTAURANT3_LABEL1,
                                15.0,
                                FontWeight.bold,
                                1,
                                Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, position) {
                            return listItem2(position);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _myWidget.myText(
                              Constants.E_RESTAURANT3_LABEL2,
                              15.0,
                              FontWeight.bold,
                              1,
                              Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, position) {
                              return listItem(position);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                  child: _myWidget.myText(
                      Constants.E_RESTAURANT3_BUTTON1, 12, FontWeight.bold, 1, Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem2(int position) {
    MyWidget _myWidget = new MyWidget();
    return Card(
      child: Container(
        height: 250.0,
        width: 250.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _myWidget.myText("Starter", 12,
                            FontWeight.bold, 1, Colors.black38),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:5.0),
                          child: _myWidget.myText("Product Title", 12,
                              FontWeight.bold, 1, Colors.black),
                        ),
                        _myWidget.myText("10.0", 12,
                            FontWeight.bold, 1, Colors.black),
                      ],
                    ),
                  ),

                  Container(
                    child: _myWidget.selectValue(
                            () {
                          setState(() {
                            value1++;
                            print("$value1");
                          });
                        },
                        value1,
                            () {
                          setState(() {
                            value1--;
                            print("$value1");
                          });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
