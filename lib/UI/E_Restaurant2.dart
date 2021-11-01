import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ERestaurant2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ERestaurant2();
}

class _ERestaurant2 extends State<ERestaurant2> {
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
      appBar: _myWidget.myAppBar(Constants.E_RESTAURANT2_TITLE, () {
        // Navigator.pop(context);
      }),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    height: 30.0,
                    width: 100.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFF7878),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              Constants.E_RESTAURANT2_BUTTON1,
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:40.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          Constants.E_RESTAURANT2_LABEL1,
                          textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 40.0,
                          width: 120.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF7878),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:5.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      Constants.E_RESTAURANT2_BUTTON2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 250.0,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _myWidget.myText(
                                  Constants.E_RESTAURANT2_LABEL2,
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
              ),
            ],
          ),
        ),
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
