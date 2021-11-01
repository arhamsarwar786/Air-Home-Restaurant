import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: GestureDetector(
          onTap: () {},
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
      body: Stack(
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, position) {
                    return listItem(position);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget listItem(int position) {
  MyWidget _myWidget = new MyWidget();
  return Card(
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
                borderRadius: BorderRadius.circular(40.0)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _myWidget.myText(
                      "The 'Event Title' is about to start! ", 15, FontWeight.bold, 3, Colors.black),
                  Text("Date and Time",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black38),),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
