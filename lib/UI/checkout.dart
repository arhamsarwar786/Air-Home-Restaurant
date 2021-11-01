import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckOut();
}

class _CheckOut extends State<CheckOut> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.CHECKOUT_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.height / 7),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.height / 7),
                    ),
                    /*child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, position) {
                      return listItem(position);
                    },
                  ),*/
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          Container(
                            height: 30.0,
                          ),
                          Divider(),
                          Container(
                            height: 30.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                  child: Align(
                                alignment: Alignment.centerLeft,
                                child: _myWidget.myText(Constants.CHECKOUT_LABEL1, 12,
                                    FontWeight.bold, 1, Colors.black),
                              )),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: _myWidget.myText(Constants.CHECKOUT_LABEL2, 10,
                                          FontWeight.bold, 1, Colors.black38),
                                    ),
                                  ),
                                  Container(
                                    child: _myWidget.myText("90", 10,
                                        FontWeight.bold, 1, Colors.black38),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.CHECKOUT_LABEL3,
                                          10,
                                          FontWeight.bold,
                                          1,
                                          Colors.black38),
                                    ),
                                  ),
                                  Container(
                                    child: _myWidget.myText("50", 10,
                                        FontWeight.bold, 1, Colors.black38),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 30.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.CHECKOUT_LABEL8,
                                          10,
                                          FontWeight.bold,
                                          1,
                                          Colors.black38),
                                    ),
                                  ),
                                  Container(
                                    child: _myWidget.myText("10", 10,
                                        FontWeight.bold, 1, Colors.black38),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 30.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: _myWidget.myText( Constants.CHECKOUT_LABEL4, 12,
                                          FontWeight.bold, 1, Colors.black),
                                    ),
                                  ),
                                  Container(
                                    child: _myWidget.myText("150", 12,
                                        FontWeight.bold, 1, Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Container(
                    child: Text(
                  Constants.CHECKOUT_LABEL5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFF7878),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    Constants.CHECKOUT_BUTTON1,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Container(
                    child: Text(
                  Constants.CHECKOUT_LABEL6,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFFFFB700),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: _myWidget.myText(
                              "150", 15, FontWeight.bold, 1, Colors.black)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height: 20.0,
                                  width: 20.0,
                                  color: Colors.black38,
                                  child: Image.asset("")),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: _myWidget.myText(
                                      Constants.CHECKOUT_LABEL7,
                                      12,
                                      FontWeight.bold,
                                      1,
                                      Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF2A2A40),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                child: _myWidget.myText(Constants.CHECKOUT_LABEL9, 20,
                                    FontWeight.normal, 1, Colors.white),
                              ),
                              Container(
                                child: _myWidget.myText(Constants.CHECKOUT_LABEL10, 25,
                                    FontWeight.bold, 1, Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
