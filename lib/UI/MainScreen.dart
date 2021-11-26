import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/ModelClasses/CategoryModal.dart';
import 'package:air_home_retaurant/ModelClasses/NEW_MODEL.dart';
import 'package:air_home_retaurant/ModelClasses/VendorModal.dart';
import 'package:air_home_retaurant/UI/Login.dart';
import 'package:air_home_retaurant/UI/MyReservations.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:air_home_retaurant/ModelClasses/User.dart';
import 'package:air_home_retaurant/UI/HomeScreen.dart';
import 'package:air_home_retaurant/UI/NotificationScreen.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'Favourite.dart';

List<Widget> widgets = List();

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  MyWidget _myWidget;
  int index = 0;
  ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    widgets.add(HomeScreen());
    widgets.add(MyReservations());
    widgets.add(Center(child: Text("layout 3")));
    widgets.add(Favourite());
    widgets.add(NotificationLay());
    _progressDialog = new ProgressDialog();
    getCategory(context: context);

    if (GlobalState.userId == null) {
      GlobalState.userId = int.parse(Hive.box('userIdBox').get("userID"));
      print("USERID ASSIGNED");
    }
    getUserProfile(context: context);
    getVendorProfile(context: context);
    getNews(context: context);
  }


  ///////////////////////
  ///  GET NEWS
  
  Future getNews({@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.NEWS);
    var response1 = await http.Response.fromStream(res1);
    var resDec1 = jsonDecode(response1.body);
    var response = resDec1;
    if (response1.statusCode == 200) {
      var responseList = NewsModel.fromJson(response);
      if (responseList != null) {
        GlobalState.newsModelData = responseList;        
      } 
    } else {
      log("API STATUS CODE = ${response.statusCode}");
    }
  }


  //  User Profile Data Get
  getUserProfile({@required BuildContext context}) async {
    print("USER ID  : ${GlobalState.userId}");
    if (GlobalState.myUser == null) {
      HttpServices httpServices = new HttpServices();
      var res1 = await httpServices.getFutureJsonWithBody(
          url: Constants.USER_API + GlobalState.userId.toString());
      var response1 = await http.Response.fromStream(res1);

      if (response1.statusCode == 200) {
        print(" ${response1.body}");
        var responseList = MyUser.fromJson(jsonDecode(response1.body));
        if (responseList != null) {
          GlobalState.myUser = responseList;
        }
      } else if (response1.statusCode == 500) {
        toggle = false;
        Hive.box("userIdBox").clear();
        GlobalState.userId = null;
        userExpire = true;
        Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
      } else {
        log("API STATUS CODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% = ${response1.statusCode}");
      }
    }
  }

  getVendorProfile({@required BuildContext context}) async {
    print("USER ID  : ${GlobalState.userId}");
    if (GlobalState.myUser == null) {
      HttpServices httpServices = new HttpServices();
      var res1 = await httpServices.getFutureJsonWithBody(
          url: Constants.VENDOR + GlobalState.userId.toString());
      var response1 = await http.Response.fromStream(res1);

      if (response1.statusCode == 200) {
        print(" ${response1.body}");
        var responseList = VendorModal.fromJson(jsonDecode(response1.body));
        if (responseList != null) {
          GlobalState.vendorProfile = responseList;
        }
      } else {
        log("API STATUS CODE = ${response1.statusCode}");
      }
    }
  }

  ///   Getting Category API

  Future<CategoryModal> getCategory({@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
      url: Constants.Category,
    );

    //     // var homeRestaurantResponse = res1 + res2 + res3;
    var response1 = await http.Response.fromStream(res1);

    var resDec1 = jsonDecode(response1.body);

    resDec1['data'] = resDec1['data'];
    CategoryModal list;
    var response = resDec1;
    // print(response);
    if (response1.statusCode == 200) {
      var responseList = CategoryModal.fromJson(response);
      if (responseList != null) {
        GlobalState.category = responseList;
        return list = responseList;
      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

// POPUP SHOW

  void _showDialog() {
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
                      color: Colors.red,
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
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text("WELCOME",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white)),
                      ) //
                          ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(
                            "Lorem ipsum dolor sit amet consectetur adipisicing lit. Maxime mollitia,molestiae quas vel sint commodi repudiandae  onsequuntur voluptatum laborum numquam blanditiis harum quisquam eius   ed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. voluptatum laborum numquam blanditiis harum quisquam eius   ed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white)),
                      ) //
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

  @override
  Widget build(BuildContext context) {
    if (toggle) {
      Future.delayed(Duration.zero, () => _showDialog());
      toggle = false;
    }
    return new Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) {
              // Handle for Favourites
              if (index == 3) {
                if (GlobalState.corsiDiCusinaPosts != null &&
                    GlobalState.homeRestaurantPosts != null &&
                    GlobalState.chefDomicilioPosts != null &&
                    GlobalState.tourGastronomiciPosts != null) {
                  this.index = index;
                } else {
                  Fluttertoast.showToast(
                      msg: "Wait for a Second",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  this.index = this.index;
                  return;
                }
              }
              if (index == 2) {
               
                this.index = this.index;
                return;
              }
              setState(() {
                this.index = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: index == 0
                      ? new Icon(
                          Icons.home,
                          color: Colors.red,
                        )
                      : new Icon(
                          Icons.home,
                          color: Colors.black38,
                        ),
                  title: index == 0
                      ? new Text("Home",
                          style: TextStyle(color: Colors.red, fontSize: 10))
                      : new Text("Home",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 10))),
              new BottomNavigationBarItem(
                  icon: index == 1
                      ? new Icon(
                          Icons.star,
                          color: Colors.red,
                        )
                      : new Icon(
                          Icons.star,
                          color: Colors.black38,
                        ),
                  title: index == 1
                      ? new Text("Reservations",
                          style: TextStyle(color: Colors.red, fontSize: 10))
                      : new Text("Reservations",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 10))),
              new BottomNavigationBarItem(
                  icon: index == 2
                      ? new Icon(
                          Icons.favorite_outlined,
                          color: Colors.red,
                        )
                      : new Icon(
                          Icons.favorite_outlined,
                          color: Colors.black38,
                        ),
                  title: index == 2
                      ? new Text("", style: TextStyle(color: Colors.red))
                      : new Text("", style: TextStyle(color: Colors.black38))),
              new BottomNavigationBarItem(
                  icon: index == 3
                      ? new Icon(
                          Icons.favorite_outlined,
                          color: Colors.red,
                        )
                      : new Icon(
                          Icons.favorite_outlined,
                          color: Colors.black38,
                        ),
                  title: index == 3
                      ? new Text("Favourites",
                          style: TextStyle(color: Colors.red, fontSize: 10))
                      : new Text("Favourites",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 10))),
              new BottomNavigationBarItem(
                  icon: index == 4
                      ? new Icon(
                          Icons.notifications,
                          color: Colors.red,
                        )
                      : new Icon(
                          Icons.notifications,
                          color: Colors.black38,
                        ),
                  title: index == 4
                      ? new Text("Notfications",
                          style: TextStyle(color: Colors.red, fontSize: 10))
                      : new Text("Notfications",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 10))),
            ]),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                 print(GlobalState.userId);
                print("Float Pressed");
              },
              child: Container(
                width: 30.0,
                height: 30.0,
                child: ImageIcon(
                  AssetImage("assets/images/shopping_cart.png"),
                  color: Color(0xFFFFFFFF),
                ),
              )),
        ),
      ),
      body: widgets[index],
    );
  }

  void navigationTapped(int page) {
    if (page == 2) {
      return;
    } else {
      setState(() {
        // _selectedIndex = page;
      });
    }
  }
}
