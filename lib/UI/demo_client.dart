import 'package:air_home_retaurant/Menu/AirGuid-Menu.dart';
import 'package:air_home_retaurant/UI/AddHomeRestaurantEvent.dart';
import 'package:air_home_retaurant/UI/AddHomeRestaurantEvent2.dart';
import 'package:air_home_retaurant/UI/AddHomeRestaurantEvent3.dart';
import 'package:air_home_retaurant/UI/AddMEnuEvent2.dart';
import 'package:air_home_retaurant/UI/AddMenuEvent.dart';
import 'package:air_home_retaurant/UI/AddMenuEvent3.dart';
import 'package:air_home_retaurant/UI/AddMenuEvent4.dart';
import 'package:air_home_retaurant/UI/AddPostBlog.dart';
import 'package:air_home_retaurant/UI/AddPostBlog2.dart';
import 'package:air_home_retaurant/UI/AddTourGastronomicoEvent.dart';
import 'package:air_home_retaurant/UI/AddTourGastronomicoEvent2.dart';
import 'package:air_home_retaurant/UI/AddTourGastronomicoEvent3.dart';
import 'package:air_home_retaurant/Menu/AirChef-Menu.dart';
import 'package:air_home_retaurant/Menu/AirHost-Menu.dart';
import 'package:air_home_retaurant/UI/Allergies.dart';
import 'package:air_home_retaurant/UI/Cart.dart';

import 'package:air_home_retaurant/UI/CorsoCusina2.dart';
import 'package:air_home_retaurant/UI/CorsoCusina3.dart';
import 'package:air_home_retaurant/UI/add_corso_cucina_classic_event.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_classic_event2.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_classic_event3.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event2.dart';
import 'package:air_home_retaurant/UI/add_corso_cusina_online_ondemand_event3.dart';
import 'package:air_home_retaurant/UI/add_eRestaurant_event.dart';
import 'package:air_home_retaurant/UI/add_eRestaurant_event2.dart';
import 'package:air_home_retaurant/UI/add_eRestaurant_event3.dart';
import 'package:air_home_retaurant/UI/chat.dart';
import 'package:air_home_retaurant/UI/checkout.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClientDemoState();
}

class _ClientDemoState extends State<ClientDemo> {
  MyWidget _myWidget;
  List<Widget> pages;
  PageController controller = PageController();
  int _curr = 0;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    pages = [
      AddCookingClassEvent(),
      AddCookingClassEvent2(),
      AddCookingClassEvent3(),
      AddOnlineCookingClassEvent(),
      AddOnlineCookingClassEvent2(),
      AddOnlineCookingClassEvent3(),
      AddERestaurantEvent(),
      AddERestaurantEvent2(),
      AddERestaurantEvent3(),
      AddNewEvent(),
      AddNewEvent2(),
      AddNewEvent3(),
      AddMenuEvent(),
      AddMenuEvent2(),
      AddMenuEvent3(),
      AddMenuEvent4(),
      AddPostBlog(),
      AddPostBlog2(),
      AddATour(),
      AddATour2(),
      AddATour3(),
      AirChefMenu(),
      AirGuideMenu(),
      AirHostMenu(),
      Allergies(),
      Cart(),
      Chat(),
      // Chat2(),
      CheckOut(),
      CorsoCusina2(),
      CorsoCusina3(),
      IntroScreensHandler(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background-pattern.jpg"),
                  fit: BoxFit.cover)),
        ),
        Container(
          width: double.infinity,
          child: Container(
            child: Expanded(
              child: PageView(
                children: pages,
                scrollDirection: Axis.horizontal,
                // reverse: true,
                // physics: BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (num) {
                  setState(() {
                    _curr = num;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildPage(String label, String text, String uri) {
    return Expanded(
      child: new Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(color: Colors.red, width: 10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "$uri",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                  child: _myWidget.myText(
                      "$label", 25.0, FontWeight.bold, null, Colors.red)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                  child: Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
