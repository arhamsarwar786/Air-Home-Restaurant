import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/Menu/MenuHamburger.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:air_home_retaurant/ModelClasses/NEW_MODEL.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'MainScreen.dart';

class NotificationLay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Notification();
}

class _Notification extends State<NotificationLay> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();

    if (GlobalState.newsModelData == null) getNews(context: context);
  }

  ///////////////////////
  ///  GET NEWS

  Future getNews({@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(url: Constants.NEWS);
    var response1 = await http.Response.fromStream(res1);
    var resDec1 = jsonDecode(response1.body);
    var response = resDec1;
    if (response1.statusCode == 200) {
      var responseList = NewsModel.fromJson(response);
      if (responseList != null) {
        GlobalState.newsModelData = responseList;
        setState(() {});
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
    }
  }

  Future<bool> _onWillPop() async {
    return Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen())) ??
        false;
  }

// POPUP SHOW

  void _showDialog(data) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  margin: EdgeInsets.only(top: 13.0, right: 18.0, left: 18.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Html(
                        data: data,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
     key: _scaffoldKey,
     drawer: MenuHamBurger(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageIcon(
                AssetImage("assets/images/menu_icon.png"),
                color: Color(0XFFFFFFFF),
              ),
            )),
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: GlobalState.newsModelData == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : GlobalState.newsModelData.data.isEmpty
                ? Center(child: Text("No Nofification's"),)
                : Stack(
                    children: [
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                          ),
                        ),
                      ),
                      GlowingOverscrollIndicator(
                        color: Colors.red,
                        axisDirection: AxisDirection.down,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 150.0,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: GlobalState.newsModelData.data.length,
                              itemBuilder: (context, position) {
                                return InkWell(
                                    onTap: () {
                                      dom.Document document = htmlparser.parse(
                                          GlobalState.newsModelData.data
                                              .elementAt(position)
                                              .testoHtml);
                                      _showDialog(GlobalState.newsModelData.data
                                          .elementAt(position)
                                          .testoHtml);
                                      print(document.body);
                                    },
                                    child: listItem(
                                        GlobalState.newsModelData.data
                                            .elementAt(position),
                                        position));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget listItem(Datum data, int position) {
    MyWidget _myWidget = new MyWidget();

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (p) {
              setState(() {
                GlobalState.newsModelData.data.removeAt(position);
              });
            },
            autoClose: true,
            backgroundColor: Colors.red,
            // foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    image: DecorationImage(image: NetworkImage(data.immagine)),
                    borderRadius: BorderRadius.circular(40.0)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _myWidget.myText("${data.titolo}", 15, FontWeight.bold, 3,
                          Colors.black),
                      Text(
                        "${DateFormat("yMMMMd").format(data.data)}",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
