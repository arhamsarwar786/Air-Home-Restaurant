import 'package:air_home_retaurant/UI/AddHomeRestaurantEvent.dart';
import 'package:air_home_retaurant/UI/AddPostBlog.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:air_home_retaurant/UI/Match.dart';
import 'package:flutter/material.dart';

class AirHostMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AirHostMenu();
}

class _AirHostMenu extends State<AirHostMenu> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            uri: "assets/images/left-arrow-black.png",
            text: Constants.AIR_HOST_MENU_LABEL1,
          ),
          Divider(),
          _createDrawerItem(
            uri: "",
            text: Constants.AIR_HOST_MENU_LABEL2,
          ),
          _createDrawerItem(
            uri: "assets/images/air-house.png",
            text: Constants.AIR_HOST_MENU_LABEL3,
          ),
          _createDrawerItem(
            uri: "assets/images/star.png",
            text: Constants.AIR_HOST_MENU_LABEL4,
          ),
          _createDrawerItem(
            uri: "assets/images/smile.png",
            text: Constants.AIR_HOST_MENU_LABEL5,
          ),
          _createDrawerItem(
            uri: "assets/images/plus.png",
            text: Constants.AIR_HOST_MENU_LABEL6,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewEvent(),));
            }
          ),
          _createDrawerItem(
            uri: "assets/images/plus.png",
            text: Constants.AIR_HOST_MENU_LABEL7,
          ),
          _createDrawerItem(
            uri: "assets/images/plus.png",
            text: Constants.AIR_HOST_MENU_LABEL8,
               onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPostBlog(),));
            }
          ),
          _createDrawerItem(
            uri: "assets/images/puzzle.png",
            text: Constants.AIR_HOST_MENU_LABEL9,
               onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Match(),));
            }
          ),
          // _createDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
          // _createDrawerItem(icon: Icons.face, text: 'Authors'),
          // _createDrawerItem(
          //     icon: Icons.account_box, text: 'Flutter Documentation'),
          // _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
          // Divider(),
          // _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          // ListTile(
          //   title: Text('0.0.1'),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.red),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: _myWidget.myText("First Name", 12.0,
                            FontWeight.bold, 1, Colors.white),
                      ),
                    ),
                  ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _myWidget.myText(
                              "IT/EUR", 12.0, FontWeight.bold, 1, Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _createDrawerItem(
      {String uri, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Container(
        child: Row(
          children: <Widget>[
            Container(height: 20.0, width: 20.0, child: Image.asset("$uri")),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: _myWidget.myText(
                    text, 12, FontWeight.bold, 1, Colors.black),
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
