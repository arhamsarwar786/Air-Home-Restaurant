import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CorsoCusina2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CorsoCusina2();
}

class _CorsoCusina2 extends State<CorsoCusina2> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _myWidget.myAppBar(Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFF7878),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          child: Text(
                            Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_BUTTON1,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/back-in-time.png")),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _myWidget.myText(
                              "04h 00m", 12, FontWeight.bold, 1, Colors.black),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/translation.png")),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _myWidget.myText("English, Spanish", 12,
                              FontWeight.bold, 1, Colors.black),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/group.png")),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _myWidget.myText("MIN 1 - MAX 10", 12,
                              FontWeight.bold, 1, Colors.black),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/images/family.png")),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _myWidget.myText("Recommended for families",
                              12, FontWeight.bold, 1, Colors.black),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                    child: Text(
                  Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_LABEL1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
                    // _myWidget.myText(Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_LABEL2, 15, FontWeight.bold, null, Colors.red),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // _myWidget.allergiesIntorancesBottomSheet(context);
                  },
                  child: Center(
                    child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF7878),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Text(
                            Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_BUTTON2,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _myWidget.myText(
                            Constants.CORSO_CUSINA2_ALLLEGIES_MODEL_LABEL2,
                            15.0,
                            FontWeight.bold,
                            1,
                            Colors.black),
                      ),
                    ),
                    Container(
                      height: 200.0,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return listItem(position);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(int position) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Container(
        height: 200.0,
        width: 250.0,
        decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(5.0)),
          child: Image.asset(""),
      ),
    );
  }
}
