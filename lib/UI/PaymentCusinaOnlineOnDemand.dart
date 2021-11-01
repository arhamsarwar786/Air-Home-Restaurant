import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCusinaOnlineOnDemand extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentCusinaOnlineOnDemand();
}

class _PaymentCusinaOnlineOnDemand extends State<PaymentCusinaOnlineOnDemand> {
  MyWidget _myWidget;

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

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
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
          .myAppBar(Constants.PAYMENT_CUSINA_ONLINE_ON_DEMAND_TITLE, () {
        // Navigator.pop(context);
      }),
      body: ListView(
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
                                            .PAYMENT_CUSINA_ONLINE_ON_DEMAND_LABEL1,
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
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Container(
                  child: Text(
                Constants.PAYMENT_CUSINA_ONLINE_ON_DEMAND_LABEL2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
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
                            Constants.PAYMENT_CUSINA_ONLINE_ON_DEMAND_LABEL3,
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
    );
  }

  Widget listItem(int position) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Container(
        height: 180.0,
        width: 220.0,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(5.0)),
        child: Image.asset(""),
      ),
    );
  }
}
