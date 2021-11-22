import 'package:air_home_retaurant/Menu/AirChef-Menu.dart';
import 'package:air_home_retaurant/Menu/AirGuid-Menu.dart';
import 'package:air_home_retaurant/Menu/AirHost-Menu.dart';
import 'package:air_home_retaurant/UI/Allergies.dart';
import 'package:air_home_retaurant/UI/CulinaryPreferances.dart';
import 'package:air_home_retaurant/UI/Login.dart';
import 'package:air_home_retaurant/UI/MainScreen.dart';
import 'package:air_home_retaurant/UI/MyProfile.dart';
import 'package:air_home_retaurant/UI/MyProfile2.dart';
import 'package:air_home_retaurant/UI/MyReviews.dart';
import 'package:air_home_retaurant/UI/PasswordChange.dart';
import 'package:air_home_retaurant/UI/VendorProfile.dart';
import 'package:air_home_retaurant/UI/VendorProfile2.dart';
import 'package:air_home_retaurant/UI/chat.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MySharedPreferences.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../UI/MyReservations.dart';

class MenuHamBurger extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuHamBurger();
}

class _MenuHamBurger extends State<MenuHamBurger> {
  MyWidget _myWidget;
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to Logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () {
              onCLickOnLogout(context);
              },
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

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
       
          ListTile(
            title: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // color: Colors.black26,
                      height: 20.0, width: 20.0, child: Icon(Icons.home,color: Colors.black,)),
                  Container(
                    // color: Colors.black26,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: _myWidget.myText(
                          Constants.MENU_HUMBERGER_LABEL1, 12, FontWeight.bold, 1, Colors.black),
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              onHomeTap();
            },
          ),
          ListTile(
            title: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // color: Colors.black26,
                      height: 20.0, width: 20.0, child: Icon(Icons.account_box,color: Colors.black,)),
                  Container(
                    // color: Colors.black26,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: _myWidget.myText(
                          Constants.MENU_HUMBERGER_LABEL2, 12, FontWeight.bold, 1, Colors.black),
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              onMyProfileTap();
            },
          ),

          _createDrawerItem(
            uri: "assets/images/star.png",
            text: Constants.MENU_HUMBERGER_LABEL3,
            onTap:  (){
                onMyReservationTap();

              }
          ),
          _createDrawerItem(
            uri: "assets/images/star.png",
            text: Constants.MENU_HUMBERGER_LABEL4,
            onTap:  (){
                onCulinaryPrefrencesTap();
              }

          ),
          _createDrawerItem(
            uri: "assets/images/no-milk.png",
            text: Constants.MENU_HUMBERGER_LABEL5,
            onTap:  (){
                onAllergiesTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/password.png",
            text: Constants.MENU_HUMBERGER_LABEL6,
            onTap:  (){
                onPasswordChangeTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/chat-b.png",
            text: Constants.MENU_HUMBERGER_LABEL7,
            onTap:  (){
                onChatTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/smile.png",
            text: Constants.MENU_HUMBERGER_LABEL8,
            onTap:  (){
                onMyReviewsTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/air-house.png",
            text: Constants.MENU_HUMBERGER_LABEL9,
            onTap:  (){
                onAirHostTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/airchef.png",
            text: Constants.MENU_HUMBERGER_LABEL10,
            onTap:  (){
                onAirChefTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/airguide.png",
            text: Constants.MENU_HUMBERGER_LABEL11,
            onTap:  (){
                onAirGuideTap();
              }
          ),
          _createDrawerItem(
            uri: "assets/images/logout.png",
            text: Constants.MENU_HUMBERGER_LABEL12,
            onTap:  (){
              onLogoutTap();
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
                              "${GlobalState.myUser.data.linguaMadre}", 12.0, FontWeight.bold, 1, Colors.white),
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
      onTap: onTap ,
    );
  }

  String getCurrentUserName(BuildContext context) {
    print("getCurrentUserName");
    String currentUserName = "";
    if(GlobalState.myUser !=null ){
      if(GlobalState.myUser.data.nome != null){

        currentUserName="${GlobalState.myUser.data.nome} ${GlobalState.myUser.data.cognome}";
          

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
    if(GlobalState.myUser != null){
      if(GlobalState.myUser.data.urlFoto != null){
   
        currentUserImageUrl=GlobalState.myUser.data.urlFoto;
          
   
        print("getCurrentUser urlFotoMil Gya");
      }else{
        print("GlobalState.curretnUser.Image Is Null");
      }
    }else{
      print("GlobalState.curretnUser Is Null");
    }
    return currentUserImageUrl;
  }

  /*TODO: Drawer Item Tap Listner*/
  GestureTapCallback onHomeTap() {
    print("onHomeTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );

  }
  GestureTapCallback onMyProfileTap() {
    print("onMyProfileTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProfile()),
    );
  }
  GestureTapCallback onMyReservationTap() {
    print("onMyReservationTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyReservations()),
    );
  }
  GestureTapCallback onCulinaryPrefrencesTap() {
    print("onCulinaryPrefrencesTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CulinaryPreferences()),
    );
  }
  GestureTapCallback onAllergiesTap() {
    print("onAllergiesTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Allergies()),
    );
  }
  GestureTapCallback onPasswordChangeTap() {
    print("onPasswordChangeTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordChange()),
    );

  }
  GestureTapCallback onChatTap() {
    print("onChatTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Chat()),
    );
  }
  GestureTapCallback onMyReviewsTap() {
    print("onMyReviewsTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyReviews()),
    );
  }
  GestureTapCallback onAirHostTap() {
    print("onAirHostTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AirHostMenu()),
    );
  }
  GestureTapCallback onAirChefTap() {
    print("onAirChefTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AirChefMenu()),
    );
  }
  GestureTapCallback onAirGuideTap() {
    print("onAirGuideTap");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AirGuideMenu()),
    );
  }
  GestureTapCallback onLogoutTap() {
    _onWillPop();
  }

  onCLickOnLogout(BuildContext context) async{
  print("LogOut Pressed");
  await FirebaseAuth.instance.signOut();
  Hive.box("userIdBox").clear();
  GlobalState.myUser = null;
  // GlobalState.
    // if(GlobalState.facebookSignIn!=null){
    //   _fbLogOut();
    // MySharedPreferences.instance.removeValue(Constants.USER_ID);
    // Navigator. pushReplacement(context,
    //   MaterialPageRoute(
    //     builder: (context) => Login(),
    //   ),
    // );
    // }

    // if(GlobalState.googleSignIn!=null){
    //   _signOut();
    //   MySharedPreferences.instance.removeValue(Constants.USER_ID);
      Navigator. pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    // }

  }
  Future<Null> _fbLogOut() async {
    // await GlobalState.facebookSignIn.logOut();
    print("logout facebook");
  }
  Future<void> _signOut() async {
    GlobalState.googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    print("SignOut Google");
    // Navigator.push(context, MaterialPageRoute(builder: (_)=> Login()));
  }
}
