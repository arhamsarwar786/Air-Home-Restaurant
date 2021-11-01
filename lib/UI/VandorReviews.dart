import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorReviews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VendorReviews();
}

class _VendorReviews extends State<VendorReviews> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.VENDOR_REVIEWS_TITLE, () {
        // Navigator.pop(context);
      }),
      body: ListView(
        children: [
          Container(
            color: Color(0xFFF5F5F5),
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return listItem(position);
              },
            ),
          ),
          Container(
            height: 80.0,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: _myWidget.myText(Constants.VENDOR_REVIEWS_TEXT1, 20.0,
                  FontWeight.bold, null, Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}

Widget listItem(int position) {
  MyWidget _myWidget = new MyWidget();
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _myWidget.myText("Title $position", 12, FontWeight.bold,
                            1, Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                child: _myWidget.myText("05/04/2021", 10,
                                    FontWeight.bold, 1, Colors.black),
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: 80.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                        BorderRadius.circular(5.0)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "4.0 *",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
