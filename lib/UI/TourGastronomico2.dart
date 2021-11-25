import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:air_home_retaurant/ModelClasses/ReviewModal.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'Chat2.dart';
import 'PaymentERestaurant.dart';

class TourGastronomico2 extends StatefulWidget {
  final categoryPosts;
  TourGastronomico2(this.categoryPosts);
  @override
  State<StatefulWidget> createState() => _TourGastronomico2();
}

class _TourGastronomico2 extends State<TourGastronomico2> {
 var maxLines = 3, overflow = TextOverflow.ellipsis;
  var toggleButton = Constants.E_RESTAURANT_BUTTON1;

  MyWidget _myWidget;
  int _currentPage = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    getHostInfo();
    getReview();
    addMarker(LatLng(widget.categoryPosts.posx,widget.categoryPosts.posy));
  }
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

  ///  Google Map
  /// 
  ///// Marks
  final Set<Marker> markers = {};
   GoogleMapController mapController;
   


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    
  }

    ////// ADD MARKER
  void addMarker(getPosition){
    markers.clear();
      markers.add(
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              markerId: MarkerId(getPosition.toString(),),position: getPosition,
              draggable: true,
              onDragEnd: (endDrag){
                print(endDrag);
              }
              ),
              
            );
              setState(() {        
      });   
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
                                        vertical: 20.0),
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
                                                       "${widget.categoryPosts.valutazione}",
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

                   InkWell(
                     onTap: (){
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
                
                                      ///HomeRestaurant2
                    //Menu
                  
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
                                child: _myWidget.myText("${DateFormat('yMMMMd').format(widget.categoryPosts.dataCreazione)}", 12,
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
                                    if(widget.categoryPosts.lingue != "")
                   for (var i = 0; i < getLanguage(widget.categoryPosts.lingue.toString()).length; i++)                    
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
                                child: _myWidget.myText("${getLanguage(widget.categoryPosts.lingue.toString())[i]}", 12,
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
                                child: _myWidget.myText("MIN ${widget.categoryPosts.partecipantiMinimo} - MAX ${widget.categoryPosts.partecipantiMassimo}", 12,
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
                                    "${widget.categoryPosts.perFamiglie ?'Recommended for families' : 'Not Recommended for families'}",
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
                              var allergiesList = getAllergies(widget.categoryPosts.allergie);
                              print(allergiesList);
                          _myWidget.allergiesIntorancesBottomSheet(context,allergiesList);
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
                              itemCount: widget.categoryPosts.foto.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                            width: 200,
                            height: 200,
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                  image: NetworkImage(                                    
                                     
                                      widget.categoryPosts.foto
                                          .elementAt(position)
                                          .urlFoto
                                      ),
                                  fit: BoxFit.cover),
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tour 3rd
                     Padding(
            padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 5.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: ImageIcon(
                            AssetImage("assets/images/pinstart.png"),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: ImageIcon(
                            AssetImage("assets/images/curve-down-arrow.png"),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                          "Tour Step Title",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 5.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: ImageIcon(
                            AssetImage("assets/images/pinstart.png"),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform:  Matrix4.rotationY(math.pi),
                            child: ImageIcon(
                              AssetImage("assets/images/curve-down-arrow.png"),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Tour Step Title",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 5.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: ImageIcon(
                            AssetImage("assets/images/pinstart.png"),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: ImageIcon(
                            AssetImage("assets/images/curve-down-arrow.png"),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Tour Step Title",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 5.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: ImageIcon(
                            AssetImage("assets/images/pinstart.png"),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform:  Matrix4.rotationY(math.pi),
                            child: ImageIcon(
                              AssetImage("assets/images/curve-down-arrow.png"),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Tour Step Title",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
                  ] 
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
   getLanguage(String language) {
 
     if (language != "") {
      var languageList = language.split(',');
    return languageList;
                   
    }
  }

    getAllergies(String allergies) {
    if (allergies != "") {
      var allergiesList = allergies.split(',');
      return allergiesList;
    }
  }
}
