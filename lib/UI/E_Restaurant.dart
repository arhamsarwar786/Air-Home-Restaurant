import 'dart:convert';
import 'dart:developer';

import 'package:air_home_retaurant/UI/E_Restaurant2.dart';
import 'package:air_home_retaurant/UI/E_Restaurant3.dart';
import 'package:air_home_retaurant/UI/E_Restaurant4.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chat.dart';

class ERestaurant extends StatefulWidget {
  final categoryPosts;
  ERestaurant(this.categoryPosts);
  @override
  State<StatefulWidget> createState() => _ERestaurant();
}

class _ERestaurant extends State<ERestaurant> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    getHostInfo();
  }

  var value1 = 1;

  //  MaxLine Toggle Buttons
  var maxLines = 3, overflow = TextOverflow.ellipsis;

  var toggleButton = Constants.E_RESTAURANT_BUTTON1;

  ////  Getting HostInfo
  dynamic hostInfo;

  getHostInfo() async {
    var data = await http
        .get(Uri.parse(Constants.VENDOR + '${widget.categoryPosts.hostId}'));
    hostInfo = jsonDecode(data.body);
    if (hostInfo['data'] != null) {
      hostInfo = hostInfo['data'][0];
    }
    setState(() {});
    // print(hostInfo['data']);
  }

  ////  Getting Book List
  dynamic bookList;

  getBookList() async {
    var data = await http
        .get(Uri.parse(Constants.BOOK_LIST + '${widget.categoryPosts.hostId}'));
    bookList = jsonDecode(data.body);
    // bookList = bookList['data'][0];
    setState(() {});
    print(bookList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: _myWidget.myAppBar(Constants.E_RESTAURANT_TITLE, () {
        Navigator.pop(context);
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
                         
                    decoration:  
                    BoxDecoration(
                        image:DecorationImage(
                            image: 
                            NetworkImage(
                                "${widget.categoryPosts.foto.isEmpty  ?'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg' : widget.categoryPosts.foto.elementAt(0).urlFoto}"),
                            fit: BoxFit.cover),
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10),
                        ),
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
                                          "${widget.categoryPosts.nome}",
                                          15,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                      _myWidget.myText(
                                          "${widget.categoryPosts.luogoCitta}",
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
                                                      const EdgeInsets.all(5.0),
                                                  child: _myWidget.myText(
                                                      "TAG Cuisine",
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
                                                      const EdgeInsets.all(5.0),
                                                  child: _myWidget.myText(
                                                      "TAG",
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
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: _myWidget.myText(
                                                "4.0",
                                                12,
                                                FontWeight.normal,
                                                1,
                                                Colors.white),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Container(
                                                height: 15.0,
                                                width: 15.0,
                                                child: ImageIcon(
                                                  AssetImage(
                                                      "assets/images/star.png"),
                                                  color: Color(0xFFFFFFFF),
                                                )),
                                          )
                                        ],
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
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: Color(0xFFE8E8E8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Chat()));
                  },
                  child: Padding(
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
                                child: (hostInfo == null)
                                    ? Container(
                                        height: 80.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(40.0)),
                                      )
                                    : Container(
                                        height: 80.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${hostInfo['UrlFoto']}"),
                                                fit: BoxFit.cover),
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
                                            Constants.E_RESTAURANT_LABEL1,
                                            12,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: _myWidget.myText(
                                              "${hostInfo == null ? '' : hostInfo['Nome']}, passion of sharing",
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: _myWidget.myText(Constants.E_RESTAURANT_LABEL2, 12,
                        FontWeight.bold, 1, Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: _myWidget.myText(
                      "${widget.categoryPosts.descrizioneIt}",
                      12,
                      FontWeight.normal,
                      maxLines,
                      Colors.black,
                      overflow,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      // MaXLines
                      if (toggleButton == Constants.E_RESTAURANT_BUTTON1) {
                        maxLines = null;
                        overflow = null;
                        toggleButton = Constants.E_RESTAURANT_BUTTON2;
                      } else {
                        maxLines = 3;
                        overflow = TextOverflow.ellipsis;
                        toggleButton = Constants.E_RESTAURANT_BUTTON1;
                      }
                      setState(() {});
                    },
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFF7878),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            child: Text(
                              (maxLines == 3 &&
                                      overflow == TextOverflow.ellipsis)
                                  ? Constants.E_RESTAURANT_BUTTON1
                                  : Constants.E_RESTAURANT_BUTTON2,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          eRestaurant2(),
          eRestaurant3(),
          eRestaurant4(),
        ],
      ),
    );
  }

  eRestaurant2() {
    return Container(
      // height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      Constants.E_RESTAURANT2_LABEL1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  Constants.E_RESTAURANT2_BUTTON2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
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
                          return Card(
                            child: Container(
                              height: 250.0,
                              width: 250.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _myWidget.myText(
                                                  "Starter",
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: _myWidget.myText(
                                                    "Product Title",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
                                              ),
                                              _myWidget.myText(
                                                  "10.0",
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
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
    );
  }

  eRestaurant3() {
    return Container(
      // width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _myWidget.myText(Constants.E_RESTAURANT3_LABEL2,
                        15.0, FontWeight.bold, 1, Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, position) {
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
                                        borderRadius:
                                            BorderRadius.circular(40.0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _myWidget.myText(
                                                      "Title $position",
                                                      12,
                                                      FontWeight.bold,
                                                      1,
                                                      Colors.black),
                                                  _myWidget.myText(
                                                      "Bercelona, Spagna",
                                                      10,
                                                      FontWeight.bold,
                                                      1,
                                                      Colors.black38),
                                                ],
                                              ),
                                            ),
                                            _myWidget.myText(
                                                "6 hourse ago",
                                                10,
                                                FontWeight.bold,
                                                1,
                                                Colors.black38),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Container(
                                            color: Colors.black,
                                            height: 30.0,
                                            width: 150.0,
                                          ),
                                        ),
                                        Container(
                                          // padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: _myWidget.myText(
                                              "Lorem Ipsum is simply dummy text ",
                                              10,
                                              FontWeight.bold,
                                              null,
                                              Colors.black38),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5.0),
                                                    child: Container(
                                                      height: 20.0,
                                                      width: 20.0,
                                                      color: Colors.black38,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: _myWidget.myText(
                                                        "Likes",
                                                        12,
                                                        FontWeight.bold,
                                                        1,
                                                        Colors.black38),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5.0),
                                                    child: Container(
                                                      height: 20.0,
                                                      width: 20.0,
                                                      color: Colors.black38,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: _myWidget.myText(
                                                        "Share",
                                                        12,
                                                        FontWeight.bold,
                                                        1,
                                                        Colors.black38),
                                                  ),
                                                ],
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  eRestaurant4() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: _myWidget.myText(Constants.E_RESTAURANT4_LABEL1, 15.0,
                  FontWeight.bold, 1, Colors.black),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: _myWidget.myTextInput(
                                  new TextEditingController(),
                                  1,
                                  Constants.E_RESTAURANT4_FIELD1_HINT),
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: _myWidget.myTextInput(
                                  new TextEditingController(),
                                  1,
                                  Constants.E_RESTAURANT4_FIELD2_HINT),
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: _myWidget.myTextInput(new TextEditingController(),
                          1, Constants.E_RESTAURANT4_FIELD3_HINT),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: _myWidget.myTextInput(new TextEditingController(),
                          5, Constants.E_RESTAURANT4_FIELD4_HINT),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    color: Colors.black,
                    height: 30.0,
                    width: 150.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          Constants.E_RESTAURANT4_BUTTON1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: _myWidget.myText(Constants.E_RESTAURANT4_LABEL2, 15,
                      FontWeight.bold, 1, Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: _myWidget.myText(Constants.E_RESTAURANT4_LABEL3, 20,
                      FontWeight.bold, 1, Colors.red),
                ),
                _myWidget.myText(
                    "CITY", 15, FontWeight.bold, 1, Colors.black38),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constants.E_RESTAURANT4_BUTTON2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/calendar.png"),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF2A2A40),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: _myWidget.myText(
                                Constants.E_RESTAURANT4_LABEL4,
                                20,
                                FontWeight.normal,
                                1,
                                Colors.white),
                          ),
                          Container(
                            child: _myWidget.myText(
                                Constants.E_RESTAURANT4_LABEL5,
                                25,
                                FontWeight.bold,
                                1,
                                Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
