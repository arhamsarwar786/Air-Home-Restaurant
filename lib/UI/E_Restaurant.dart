import 'dart:convert';
import 'package:air_home_retaurant/UI/MyReservations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import  'package:givestarreviews/givestarreviews.dart';
import 'package:intl/intl.dart';
import 'package:air_home_retaurant/ModelClasses/ReviewModal.dart';
import 'package:air_home_retaurant/UI/Allergies.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Chat2.dart';
import 'PaymentERestaurant.dart';
import 'PaymentHomeRestaurant.dart';
import 'chat.dart';

class ERestaurant extends StatefulWidget {
  final categoryPosts;
  ERestaurant(this.categoryPosts);
  @override
  State<StatefulWidget> createState() => _ERestaurant();
}

class _ERestaurant extends State<ERestaurant> {
  MyWidget _myWidget;
  int _currentPage = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    getHostInfo();
    getReview();
  }

  var value1 = 1;

  //  MaxLine Toggle Buttons
  var maxLines = 3, overflow = TextOverflow.ellipsis;

  var toggleButton = Constants.E_RESTAURANT_BUTTON1;

  ////  Getting HostInfo
  dynamic hostInfo, reviewInfo;

  getHostInfo() async {
    var data = await http
        .get(Uri.parse(Constants.VENDOR + '${widget.categoryPosts.hostId}'));
    hostInfo = jsonDecode(data.body);
    if (hostInfo['data'] != null) {
      hostInfo = hostInfo['data'][0];
    }
    setState(() {});
  }

  getReview() async {
    http.Response data =
        await http.get(Uri.parse(Constants.REVIEW + '${widget.categoryPosts.hostId}'));
    reviewInfo = ReviewModal.fromJson(jsonDecode(data.body));

    setState(() {});
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
     
      appBar: _myWidget.myAppBar(widget.categoryPosts.nome, () {
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
              widget.categoryPosts.foto.isEmpty ? Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(                                    
                                    'https://i.stack.imgur.com/y9DpT.jpg'
                                    ),
                                fit: BoxFit.cover),
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ) :  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.categoryPosts.foto.length,
                    onPageChanged: (int value) {
                      _currentPage = value;
                    },
                    itemBuilder: (context, index) => GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(                                    
                                   
                                    widget.categoryPosts.foto
                                        .elementAt(index)
                                        .urlFoto
                                    ),
                                fit: BoxFit.cover),
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () {}),
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
                                                "${widget.categoryPosts.valutazione}",
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
                      if(hostInfo == null){
                                  Fluttertoast.showToast(
                      msg: "Wait to LOAD",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                              }else
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> Chat2(hostInfo['ID'], {"name":hostInfo['Nome'],"picture":hostInfo['UrlFoto']})));
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
                                                      "${hostInfo == null ? '' : hostInfo['Valutazione']}",
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
          reviewInfo == null
              ? CircularProgressIndicator(
                  color: Colors.red,
                )
              : eRestaurant3(),
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
                         onTap: () {
                          var allergiesList =
                              getAllergies(widget.categoryPosts.allergie);
                          _myWidget.allergiesIntorancesBottomSheet(
                              context, allergiesList);
                        },
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
                    // Culinary Courses
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: widget.categoryPosts.menu.length,
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
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              "${widget.categoryPosts.menu.elementAt(position).urlFoto == '' ? 'https://i.stack.imgur.com/y9DpT.jpg' : widget.categoryPosts.menu.elementAt(position).urlFoto}",
                                            ),
                                            fit: BoxFit.cover),
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
                                                  "${widget.categoryPosts.menu.elementAt(position).categoria}",
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: _myWidget.myText(
                                                    "${widget.categoryPosts.menu.elementAt(position).portata}",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
                                              ),
                                              _myWidget.myText(
                                                  "${widget.categoryPosts.menu.elementAt(position).prezzo}€",
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
                    child: _myWidget.myText(
                        Constants.E_RESTAURANT3_LABEL2 +
                            " (${reviewInfo.data.length})",
                        15.0,
                        FontWeight.bold,
                        1,
                        Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: reviewInfo.data.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(child:  _myWidget.myText(
                                                  "No Reviews",
                                                  15,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38),),
                        )
                      : ListView.builder(
                          itemCount: reviewInfo.data.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, position) {
                            return Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  // decoration: BoxDecoration(color: Colors.black12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        _myWidget.myText(
                                                            "${reviewInfo.data.elementAt(position).nomeEvento}",
                                                            12,
                                                            FontWeight.bold,
                                                            1,
                                                            Colors.black),
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              _myWidget.myText(
                                                                  "${reviewInfo.data.elementAt(position).mittenteNome}, ${reviewInfo.data.elementAt(position).mittenteCognome}",
                                                                  10,
                                                                  FontWeight.bold,
                                                                  1,
                                                                  Colors.black38),

                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                      child: Container(
                                                                        child: _myWidget.myText(
                                                      "${DateFormat('yMMMMd').format(reviewInfo.data.elementAt(position).dataInizioEvento)}",
                                                      10,
                                                      FontWeight.bold,
                                                      1,
                                                      Colors.black38),
                                                                      ),
                                                                    ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                
                                                ],
                                              ),
                                              
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: Container(
                                                  // color: Colors.black,
                                                  height: 30.0,
                                                  width: 150.0,
                                                  child: Row(children: [
                                                    for(int i =1 ; i <= reviewInfo.data.elementAt(position).voto ; i++)
                                                    Icon(Icons.star,color : Colors.yellow),
                                                  ],),
                                                ),
                                              ),
                                              Container(
                                                // padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: _myWidget.myText(
                                                    "${reviewInfo.data.elementAt(position).testo}",
                                                    10,
                                                    FontWeight.bold,
                                                    null,
                                                    Colors.black38),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        5.0),
                                                            child: Icon(
                                                              Icons.thumb_up,
                                                              color: Colors.red,
                                                            )),
                                                        Container(
                                                          child: _myWidget.myText(
                                                              "${reviewInfo.data.elementAt(position).voto} Likes",
                                                              12,
                                                              FontWeight.bold,
                                                              1,
                                                              Colors.red),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        5.0),
                                                            child: Image.network("https://cdn.icon-icons.com/icons2/1372/PNG/512/share-1_90899.png",height: 12,)),
                                                        Container(
                                                          child:
                                                              _myWidget.myText(
                                                                  "Share",
                                                                  12,
                                                                  FontWeight
                                                                      .bold,
                                                                  1,
                                                                  Colors
                                                                      .black38),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              // color: Colors.red,
              child: GiveStarReviews(  
                spaceBetween: 0,
                starData: [
    GiveStarData(onChanged: (rate) {},text: ''),
 ],),
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
                  child: _myWidget.myText(widget.categoryPosts.nome, 20,
                      FontWeight.bold, 1, Colors.red),
                ),
                _myWidget.myText(
                    "${widget.categoryPosts.luogoCitta}", 15, FontWeight.bold, 1, Colors.black38),
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
                                  builder: (context) =>
                                      PaymentHomeRestaurant(widget.categoryPosts)),
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


    getAllergies(String allergies) {
    if (allergies != "") {
      var allergiesList = allergies.split(',');
      return allergiesList;
    }
  }
}
