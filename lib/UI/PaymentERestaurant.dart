import 'dart:ffi';

import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentERestaurant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentERestaurant();
}

class _PaymentERestaurant extends State<PaymentERestaurant> {
  MyWidget _myWidget;
  bool cbValue1;
  bool cbValue2;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
    ListItem(5, "Fifth Item"),
    ListItem(6, "Sixth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  int value1;
  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    cbValue1 = false;
    cbValue2 = false;
    value1 = 1;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              listItem.name,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget
          .myAppBar(Constants.PAYMENT_E_RESTAURANT_TITLE, () {
        // Navigator.pop(context);
      }),
      body: Container(
        child: ListView(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height / ,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft:
                  Radius.circular(MediaQuery.of(context).size.height / 7),
                  bottomRight:
                  Radius.circular(MediaQuery.of(context).size.height / 7),
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Container(
                  // height: double.infinity,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80.0,
                                  width: 100.0,
                                  color: Colors.black38,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                        child: Text(
                                          Constants
                                              .PAYMENT_E_RESTAURANT_LABEL1,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5.0),
                                            color: Colors.orange),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 5.0),
                                                child: _myWidget.myText(
                                                    "4.0",
                                                    12,
                                                    FontWeight.normal,
                                                    1,
                                                    Colors.white),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 5.0),
                                                child: Container(
                                                    height: 15.0,
                                                    width: 15.0,
                                                    child: ImageIcon(
                                                      AssetImage(
                                                          "assets/images/star.png"),
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
                              ]),
                        ),
                      ),
                      Container(
                        height: 50.0,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            color: Colors.white,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<ListItem>(
                                value: _selectedItem,
                                items: _dropdownMenuItems,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedItem = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Container(
                width: double.infinity,
                  child:myCheckBox(Constants.PAYMENT_E_RESTAURANT_LABEL2,Constants.PAYMENT_E_RESTAURANT_LABEL3, cbValue1),),
            ),
            Container(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Container(
                  child:myCheckBox(Constants.PAYMENT_E_RESTAURANT_LABEL4,Constants.PAYMENT_E_RESTAURANT_LABEL5, cbValue2),),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFF1F1F1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _myWidget.myText(
                              Constants.PAYMENT_E_RESTAURANT_LABEL6,
                              15.0,
                              FontWeight.bold,
                              1,
                              Colors.black),
                        ),
                      ),
                      Container(
                        height: 180.0,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget myCheckBox(String title,String info, bool n) {
    return Row(
      children: [
        Container(
          child: Checkbox(
            value: n,
            activeColor: Colors.red,
            onChanged: (bool value) {
              /// manage the state of each value
              setState(() {
                switch (title) {
                  case Constants.PAYMENT_E_RESTAURANT_LABEL2:
                    cbValue1 = value;
                    break;
                  case Constants.PAYMENT_E_RESTAURANT_LABEL4:
                    cbValue2 = value;
                    break;
                }
              });
            },
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:2.5),
                    child: _myWidget.myText(title, 15.0, FontWeight.bold, 1, Colors.black),
                  ),
                  Container(
                    child: _myWidget.myText(info, 12.0, FontWeight.bold, null, Colors.black26),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget listItem(int position) {
    MyWidget _myWidget = new MyWidget();
    return Card(
      child: Container(
        height: 180.0,
        width: 200.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _myWidget.myText("Starter", 12,
                            FontWeight.bold, 1, Colors.black38),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:5.0),
                          child: _myWidget.myText("Product Title", 12,
                              FontWeight.bold, 1, Colors.black),
                        ),
                        _myWidget.myText("10.0", 12,
                            FontWeight.bold, 1, Colors.black),
                      ],
                    ),
                  ),

                  Container(
                    child: _myWidget.selectValue(
                            () {
                          setState(() {
                            value1++;
                            print("$value1");
                          });
                        },
                        value1,
                            () {
                          setState(() {
                            value1--;
                            print("$value1");
                          });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
