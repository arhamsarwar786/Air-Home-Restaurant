import 'package:air_home_retaurant/UI/AddTourGastronomicoEvent.dart';
import 'package:air_home_retaurant/UI/VendorProfile.dart';
import 'package:air_home_retaurant/UI/YourEventsReservations.dart';
import 'package:air_home_retaurant/UI/YourMenu.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AirGuideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AirGuideMenu();
}

class _AirGuideMenu extends State<AirGuideMenu> {
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
            text: Constants.AIR_GUIDE_MENU_LABEL1,
                 onTap: (){
              Navigator.pop(context);
            }
          ),
          Divider(),
          _createDrawerItem(
            uri: "",
            text: Constants.AIR_GUIDE_MENU_LABEL2,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> VendorProfile()));
          }
          ),
          _createDrawerItem(
            uri: "assets/images/airguide.png",
            text: Constants.AIR_GUIDE_MENU_LABEL3,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> YourMenu()));
            }
          ),
          _createDrawerItem(
            uri: "assets/images/star.png",
            text: Constants.AIR_GUIDE_MENU_LABEL4,
                onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> YourEventsReservations(),));
            }
          ),
          _createDrawerItem(
            uri: "assets/images/smile.png",
            text: Constants.AIR_GUIDE_MENU_LABEL5,
          ),
          _createDrawerItem(
            uri: "assets/images/plus.png",
            text: Constants.AIR_GUIDE_MENU_LABEL6,
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddATour(),));
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
                          // color: Colors.white60,
                           borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          image: NetworkImage(getUserImageUrl(context)),
                          fit: BoxFit.fill,
                        ),
                      ),

                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: _myWidget.myText(getCurrentUserName(context), 12.0,
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

   String getCurrentUserName(BuildContext context) {
    print("getCurrentUserName");
    String currentUserName = "";
    if(GlobalState.currentUser!=null){
      if(GlobalState.currentUser.data.nome!=null){
        currentUserName="${GlobalState.currentUser.data.nome} ${GlobalState.currentUser.data.cognome}";
      }else{
        print("GlobalState.currentUser.nome Is Null");
      }
    }else{
      print("GlobalState.currentUser Is Null");
    }
    return currentUserName;
  }
  String getUserImageUrl(BuildContext context) {
    String currentUserImageUrl="";
    if(GlobalState.currentUser!=null){
      if(GlobalState.currentUser.data.urlFoto !=null){
        currentUserImageUrl=GlobalState.currentUser.data.urlFoto;
        print("getCurrentUser urlFotoMil Gya");
      }else{
        print("GlobalState.curretnUser.Image Is Null");
      }
    }else{
      print("GlobalState.curretnUser Is Null");
    }
    return currentUserImageUrl;
  }

}
