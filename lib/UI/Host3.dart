import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Host3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Host3();
}

class _Host3 extends State<Host3> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _myWidget.myAppBar(Constants.HOST3_TITLE, () {
          // Navigator.pop(context);
        }),
        body: ListView(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
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
                                        vertical: 20.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          _myWidget.myText(
                                              Constants.HOST3_LABEL1,
                                              20,
                                              FontWeight.bold,
                                              1,
                                              Colors.black),
                                          _myWidget.myText(
                                              Constants.HOST3_LABEL2,
                                              15,
                                              FontWeight.bold,
                                              1,
                                              Colors.black26),
                                        ],
                                      ),
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
                                          height: 30.0,
                                          width: 70.0,
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
                                      Container(
                                        height: 30.0,
                                        width: 70.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFF7878),
                                            borderRadius:
                                            BorderRadius.circular(5.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                              "assets/images/chat.png"),
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
              margin: EdgeInsets.only(top: 10.0),
              color: Color(0xFFE8E8E8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: _myWidget.myText("${Constants.HOST3_LABEL3} Alfredo", 15,
                          FontWeight.bold, 1, Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:20.0,left: 10.0),
                    child: Container(
                      height: 220.0,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return itemView(position);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
  Widget itemView(int position) {
    return Card(
      elevation: 5.0,
      child: Container(
        height: 220.0,
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
                        _myWidget.myText("Clase da Cusina mediterrenea", 12,
                            FontWeight.bold, 1, Colors.black),
                        _myWidget.myText("Barcelona, Spagna", 12,
                            FontWeight.bold, 1, Colors.black38),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.orange),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                            child: _myWidget.myText(
                                "4.0", 12, FontWeight.normal, 1, Colors.white),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                                height: 15.0,
                                width: 15.0,
                                child: ImageIcon(
                                  AssetImage("assets/images/star.png"),
                                  color: Color(0xFFFFFFFF),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black26),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: _myWidget.myText("Spagnola", 12,
                              FontWeight.normal, 1, Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black26),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: _myWidget.myText("Mediterranea", 12,
                              FontWeight.normal, 1, Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "90,0000",
                        textAlign: TextAlign.end,
                        style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
