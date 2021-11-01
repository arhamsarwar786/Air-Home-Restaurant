import 'package:air_home_retaurant/UI/PaymentERestaurant.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRestaurant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRestaurant();
}

class _HomeRestaurant extends State<HomeRestaurant> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _myWidget.myAppBar(Constants.HOME_RESTAURANT_TITLE, () {
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
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        _myWidget.myText(
                                            "Event Starter Title",
                                            15,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                        _myWidget.myText(
                                            "City, Country",
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
                                                        "TAG Cuisine",
                                                        10,
                                                        FontWeight.bold,
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
                                                        "TAG",
                                                        10,
                                                        FontWeight.bold,
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
                                            padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 10.0),
                                            child: Column(
                                              children: [
                                                _myWidget.myText(
                                                    "ADULTS",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
                                                _myWidget.myText(
                                                    "99,00 p.p",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
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
                                            padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 10.0),
                                            child: Column(
                                              children: [
                                                _myWidget.myText(
                                                    "Children",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
                                                _myWidget.myText(
                                                    "99,00 p.p",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color(0xFFEFEFEF),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///HomeRestaurant1

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
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
                                              Constants.HOME_RESTAURANT_LABEL1,
                                              12,
                                              FontWeight.bold,
                                              1,
                                              Colors.black),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
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
                                              padding:
                                                  const EdgeInsets.all(5.0),
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
                                    child:
                                        Image.asset("assets/images/chat.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        child: _myWidget.myText(
                            Constants.HOME_RESTAURANT_LABEL2,
                            15,
                            FontWeight.bold,
                            1,
                            Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        child: _myWidget.myText(
                            Constants.HOME_RESTAURANT_LABEL3,
                            12,
                            FontWeight.bold,
                            null,
                            Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        child: _myWidget.myText(
                            Constants.HOME_RESTAURANT_LABEL4,
                            15,
                            FontWeight.bold,
                            1,
                            Colors.black),
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
                                  Constants.HOME_RESTAURANT_BUTTON1,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: _myWidget.myText("1", 20.0,
                                      FontWeight.bold, 1, Colors.red),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                    child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: _myWidget.myText(
                                            "Course Name",
                                            12.0,
                                            FontWeight.bold,
                                            1,
                                            Colors.black),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: _myWidget.myText(
                                            "Course Description",
                                            12.0,
                                            FontWeight.bold,
                                            1,
                                            Colors.black38),
                                      ),
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///HomeRestaurant2
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              height: 50.0,
                              width: 50.0,
                              child:
                                  Image.asset("assets/images/food-tray.png")),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: _myWidget.myText("Starter", 12,
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
                              child: Image.asset(
                                  "assets/images/back-in-time.png")),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: _myWidget.myText("04h 00m", 12,
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
                              child:
                                  Image.asset("assets/images/translation.png")),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: _myWidget.myText(
                                    "Recommended for families",
                                    12,
                                    FontWeight.bold,
                                    1,
                                    Colors.black),
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
                        Constants.HOME_RESTAURANT2_LABEL1,
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
                          _myWidget.allergiesIntorancesBottomSheet(context);
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
                                  Constants.HOME_RESTAURANT2_BUTTON1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _myWidget.myText(
                                  Constants.HOME_RESTAURANT2_LABEL2,
                                  15.0,
                                  FontWeight.bold,
                                  1,
                                  Colors.black),
                            ),
                          ),
                          Container(
                            height: 200.0,
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return listItem(position);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///HomeRestaurant3
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _myWidget.myText(
                                    Constants.HOME_RESTAURANT3_LABEL1,
                                    15.0,
                                    FontWeight.bold,
                                    1,
                                    Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 200.0,
                            color: Colors.black12,
                          ),
                        ],
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
                                  Constants.HOME_RESTAURANT3_LABEL2,
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
                              return listItem2(position);
                            },
                          ),
                        ],
                      ),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _myWidget.myText(
                                Constants.HOME_RESTAURANT3_BUTTON1,
                                12,
                                FontWeight.bold,
                                1,
                                Colors.black),
                          ),
                        ),
                      ),
                    ),

                    ///HomeRestaurant4
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _myWidget.myText(
                              Constants.Home_RESTAURANT4_LABEL1,
                              15.0,
                              FontWeight.bold,
                              1,
                              Colors.black),
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
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: _myWidget.myTextInput(
                                              new TextEditingController(),
                                              1,
                                              Constants
                                                  .Home_RESTAURANT4_FIELD1_HINT),
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
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: _myWidget.myTextInput(
                                              new TextEditingController(),
                                              1,
                                              Constants
                                                  .Home_RESTAURANT4_FIELD2_HINT),
                                        ),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: _myWidget.myTextInput(
                                      new TextEditingController(),
                                      1,
                                      Constants.Home_RESTAURANT4_FIELD3_HINT),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: _myWidget.myTextInput(
                                      new TextEditingController(),
                                      5,
                                      Constants.Home_RESTAURANT4_FIELD4_HINT),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
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
                                      Constants.Home_RESTAURANT4_BUTTON1,
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
                              child: _myWidget.myText(
                                  Constants.Home_RESTAURANT4_LABEL2,
                                  15,
                                  FontWeight.bold,
                                  1,
                                  Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 10.0),
                              child: _myWidget.myText(
                                  Constants.Home_RESTAURANT4_LABEL3,
                                  20,
                                  FontWeight.bold,
                                  1,
                                  Colors.red),
                            ),
                            _myWidget.myText("City, Country", 15,
                                FontWeight.bold, 1, Colors.black38),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentERestaurant()),
                            );
                          },
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
                                    Constants.Home_RESTAURANT4_BUTTON2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/calendar.png"),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          child: _myWidget.myText(
                                              Constants.Home_RESTAURANT4_LABEL4,
                                              20,
                                              FontWeight.normal,
                                              1,
                                              Colors.white),
                                        ),
                                        Container(
                                          child: _myWidget.myText(
                                              Constants.Home_RESTAURANT4_LABEL5,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget listItem(int position) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Container(
        height: 200.0,
        width: 250.0,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(5.0)),
        // child: Image.asset(""),
      ),
    );
  }

  Widget listItem2(int position) {
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
                            _myWidget.myText("6 hourse ago", 10,
                                FontWeight.bold, 1, Colors.black38),
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
