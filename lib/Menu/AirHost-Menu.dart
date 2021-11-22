import 'package:air_home_retaurant/UI/AddHomeRestaurantEvent.dart';
import 'package:air_home_retaurant/UI/AddPostBlog.dart';
import 'package:air_home_retaurant/UI/MyReviews.dart';
import 'package:air_home_retaurant/UI/VendorProfile.dart';
import 'package:air_home_retaurant/UI/YourEvents.dart';
import 'package:air_home_retaurant/UI/YourEventsReservations.dart';
import 'package:air_home_retaurant/UI/add_corso_cucina_classic_event.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
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
             onTap: (){
              Navigator.pop(context);
            }
          ),
          Divider(),
          _createDrawerItem(
            uri: "",
            text: Constants.AIR_HOST_MENU_LABEL2,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> VendorProfile()));
          }
          ),
          _createDrawerItem(
            uri: "assets/images/air-house.png",
            text: Constants.AIR_HOST_MENU_LABEL3,
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> YourEvents(),));
            }
          ),
          _createDrawerItem(
            uri: "assets/images/star.png",
            text: Constants.AIR_HOST_MENU_LABEL4,
               onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> YourEventsReservations(),));
            }
          ),
          _createDrawerItem(
            uri: "assets/images/smile.png",
            text: Constants.AIR_HOST_MENU_LABEL5,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyReviews(),));}
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
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCookingClassEvent(),));
            }
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
      onTap: onTap,
    );
  }


    String getUserImageUrl(BuildContext context) {
    String currentUserImageUrl="";
    if(GlobalState.myUser!=null){
      if(GlobalState.myUser.data.urlFoto !=null){
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


  
  String getCurrentUserName(BuildContext context) {
    print("getCurrentUserName");
    String currentUserName = "";
    if(GlobalState.myUser!=null){
      if(GlobalState.myUser.data.nome!=null){
        currentUserName="${GlobalState.myUser.data.nome} ${GlobalState.myUser.data.cognome}";
      }else{
        print("GlobalState.currentUser.nome Is Null");
      }
    }else{
      print("GlobalState.currentUser Is Null");
    }
    return currentUserName;
  }
}
