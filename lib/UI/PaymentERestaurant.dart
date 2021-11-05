import 'dart:ffi';

import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentERestaurant extends StatefulWidget {
  final categoryPosts;
  PaymentERestaurant(this.categoryPosts);
  @override
  State<StatefulWidget> createState() => _PaymentERestaurant();
}

class _PaymentERestaurant extends State<PaymentERestaurant> {



  var _selectedDate = "Date - Time";
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        // print(widget.categoryPosts.date.length);
                               widget.categoryPosts.date.forEach((Date item)=> print(item.inizio));

      },),
      appBar: _myWidget
          .myAppBar(Constants.PAYMENT_E_RESTAURANT_TITLE, () {
        Navigator.pop(context);
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
                          padding: const EdgeInsets.only(left: 10,top: 20,),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80.0,
                                  width: 100.0,
                                  child: Image.network("${widget.categoryPosts.foto.elementAt(0).urlFoto}",fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                         "${widget.categoryPosts.nome}",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                         "${widget.categoryPosts.luogoCitta}",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
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
                                                    "${widget.categoryPosts.valutazione}",
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
                              child: DropdownButton(
                              hint: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedDate,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onChanged: ( newValue) {
                                print("In On Change Screen");
                                setState(() {
                                  _selectedDate = newValue;
                                });
                              },
                              // items: widget.categoryPosts.date.forEach((Date item)=> DropdownMenuItem(
                              //     value: item.id,
                              //     child: Text("${item.id}"),
                              //   ),),

                                items:  widget.categoryPosts.date.map((Date item)=> DropdownMenuItem<dynamic>(
                                  value: "${item.id}",
                                  child: Text("${item.id}"),
                                ),).toList(),
                              // items: widget.categoryPosts.date.map((Date item) {
                                // return DropdownMenuItem<dynamic>(
                                //   value: "${item.id}",
                                //   child: Text("${item.id}"),
                                // );
                              // }).toList(),
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
              child:   Container(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 250.0,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _myWidget.myText(
                              Constants.E_RESTAURANT2_LABEL2,
                              15.0,
                              FontWeight.bold,
                              1,
                              Colors.black),
                        ),
                      ),
                    ),
                    // Culinary Courses
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: widget.categoryPosts.menu.length,
                        itemBuilder: (context, position) {
                          return Card(
                            child: Container(
                              height: 250.0,
                              width: 250.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              "${widget.categoryPosts.menu.elementAt(position).urlFoto == '' ? 'https://i.stack.imgur.com/y9DpT.jpg' : widget.categoryPosts.menu.elementAt(position).urlFoto}",
                                            ),
                                            fit: BoxFit.cover),
                                        color: Colors.black26,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _myWidget.myText(
                                                  "${widget.categoryPosts.menu.elementAt(position).categoria}",
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: _myWidget.myText(
                                                    "${widget.categoryPosts.menu.elementAt(position).portata}",
                                                    12,
                                                    FontWeight.bold,
                                                    1,
                                                    Colors.black),
                                              ),
                                              _myWidget.myText(
                                                  "${widget.categoryPosts.menu.elementAt(position).prezzo}€",
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black),
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
                        },
                      ),
                    ),
                  ],
                ),
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
