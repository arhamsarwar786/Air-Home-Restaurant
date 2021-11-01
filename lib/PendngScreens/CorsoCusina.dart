import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CorsoCusina extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CorsoCusina();
}

class _CorsoCusina extends State<CorsoCusina> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _myWidget.myAppBar(Constants.CORSO_CUSINA_TITLE, () {
          // Navigator.pop(context);
        }),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 50,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 50.0),
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        _myWidget.myText(
                                            Constants.CORSO_CUSINA_LABEL1,
                                            15,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                        _myWidget.myText(
                                            "Barcelona, Spagna",
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black26),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFE5E5E5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: _myWidget.myText(
                                                        "Mediterranea",
                                                        10,
                                                        FontWeight.normal,
                                                        1,
                                                        Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFE5E5E5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: _myWidget.myText(
                                                        "Spagnola",
                                                        10,
                                                        FontWeight.normal,
                                                        1,
                                                        Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.orange),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5.0),
                                                  child: _myWidget.myText(
                                                      "4.0",
                                                      12,
                                                      FontWeight.normal,
                                                      1,
                                                      Colors.white),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5.0),
                                                  child: Container(
                                                      height: 15.0,
                                                      width: 15.0,
                                                      child: ImageIcon(
                                                        AssetImage(
                                                            "assets/images/star.png"),
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: Color(0xFFE5E5E5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: _myWidget.myText(
                                                  "99,00 p.p",
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10.0),
              color: Color(0xFFE8E8E8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFDBDADA),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                    height: 80.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _myWidget.myText(
                                            Constants.CORSO_CUSINA_LABEL2,
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical:10.0),
                                          child: _myWidget.myText(
                                              "ALFREDO, passion of sharing",
                                              12,
                                              FontWeight.bold,
                                              2,
                                              Colors.black),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              color: Colors.orange),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0),
                                                  child: _myWidget.myText(
                                                      "4.0",
                                                      12,
                                                      FontWeight.normal,
                                                      1,
                                                      Colors.white),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0),
                                                  child: Container(
                                                      height: 15.0,
                                                      width: 15.0,
                                                      child: ImageIcon(
                                                        AssetImage(
                                                            "assets/images/star.png"),
                                                        color:
                                                        Color(0xFFFFFFFF),
                                                      )),
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
                              Container(
                                height: 30.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF7878),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset("assets/images/chat.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: _myWidget.myText(
                          Constants.CORSO_CUSINA_LABEL3, 12, FontWeight.bold, 1, Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: _myWidget.myText(
                          Constants.CORSO_CUSINA_LABEL4, 12, FontWeight.bold, null, Colors.black),
                    ),
                  ),
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
                                Constants.CORSO_CUSINA_BUTTON1,
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
