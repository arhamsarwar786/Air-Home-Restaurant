import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorEvents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VendorEvents();
}

class _VendorEvents extends State<VendorEvents> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.VENDOR_EVENTS_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF5F5F5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, position) {
              return listItem(position, context);
            },
          ),
        ),
      ),
    );
  }


  Widget listItem(int position, BuildContext context) {
    MyWidget _myWidget = new MyWidget();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5.0),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width/1.2,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height:40.0,
                              width: 40.0,child: Image.asset("assets/images/edit-r.png")),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:2.0),
                            child: _myWidget.myText("Clase da Cusina mediterrenea", 12,
                                FontWeight.bold, 1, Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:2.0),
                            child: _myWidget.myText("Barcelona, Spagna", 12,
                                FontWeight.bold, 1, Colors.black38),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:2.0),
                            child: _myWidget.myText("Catagory", 12,
                                FontWeight.bold, 1, Colors.red),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.orange),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: _myWidget.myText(
                                  "4.0", 12, FontWeight.normal, 1, Colors.white),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                  height: 15.0,
                                  width: 15.0,
                                  child: ImageIcon(
                                    AssetImage("assets/images/star.png"),
                                    color: Color(0xFFFFFFFF),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          "90,0000",
                          textAlign: TextAlign.end,
                          style:
                          TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.black26),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: _myWidget.myText("Spagnola", 12,
                                FontWeight.normal, 1, Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.black26),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: _myWidget.myText("Mediterranea", 12,
                                FontWeight.normal, 1, Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
