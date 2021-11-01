import 'dart:convert';
import 'dart:developer';

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
import 'Login.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List<Widget> widgets = new List();
  MyWidget _myWidget;
  int index = 0;
  ProgressDialog _progressDialog;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                ),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    widgets.add(HomeScreen());
    widgets.add(Center(child: Text("layout 2")));
    widgets.add(Center(child: Text("layout 3")));
    widgets.add(Favourite());
    widgets.add(NotificationLay());
    _progressDialog = new ProgressDialog();
    getProfileInfoApiCall(context: context);
    if(GlobalState.userId == null){
      GlobalState.userId = int.parse(Hive.box('userIdBox').get("userID"));
    }
  }



  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: new BottomNavigationBar(
                currentIndex: index,
                onTap: (int index) {
                  if (index == 2) {
                    this.index = this.index;
                    return;
                  }
                  setState(() {
                    this.index = index;
                  });
                  // _navigateToScreens(index);
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
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 10))),
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
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 10))),
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
                          : new Text("",
                              style: TextStyle(color: Colors.black38))),
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
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 10))),
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
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 10))),
                ]),
          ),
          floatingActionButton: Container(
            height: 80.0,
            width: 80.0,
            child: FittedBox(
              child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    print("Float has been Clicked");
                    // callGetPostsApi(context: context);
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    child: ImageIcon(
                      AssetImage("assets/images/shopping_cart.png"),
                      color: Color(0xFFFFFFFF),
                    ),
                  )
                  // ,elevation: 5.0,
                  ),
            ),
          ),
          body: widgets[index],
        ));
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

  void getProfileInfoApiCall({@required BuildContext context}) {
    _getApiCallProfile(userId: GlobalState.userId);
  }

  _getApiCallProfile({@required int userId}) async {
    var userBox = Hive.box('userIdBox');
    String url = Constants.GET_PROFILE_API + "${GlobalState.userId == null ? int.parse(Hive.box('userIdBox').get('userID')): GlobalState.userId}";
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBodyAsParamInUrl(
        url: url,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print("this is Success result::${response.body}");
          var user = MyUser.fromJson(jsonDecode(response.body));
          if (user != null) {
            // GlobalState.currentUser = user;
            // print(GlobalState.currentUser);
            // print("Name::${user.data.nome}");
            // print("Email::${user.data.eMail}");
            GlobalState.currentUser = user;
          } else {
            print("User data not found");
          }
        },
        onFailure: (_streamedResponse) {
          print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  UserId ${GlobalState.userId}" );
          print("MainScreen:: getProfile onFailure");
        });
  }
}
