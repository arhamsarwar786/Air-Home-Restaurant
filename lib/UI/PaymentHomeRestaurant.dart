import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:table_calendar/table_calendar.dart';

class PaymentHomeRestaurant extends StatefulWidget {
  final CategoryPostsList categoryPosts;
  PaymentHomeRestaurant(this.categoryPosts);
  @override
  State<StatefulWidget> createState() => _PaymentHomeRestaurant();
}

class _PaymentHomeRestaurant extends State<PaymentHomeRestaurant> {
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
  var _selectedDay, _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }

  var value1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget
          .myAppBar(Constants.PAYMENT_CUSINA_ONLINE_ON_DEMAND_TITLE, () {
        Navigator.pop(context);
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
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80.0,
                                width: 100.0,
                                child: Image.network(
                                  "${widget.categoryPosts.foto.elementAt(0).urlFoto}",
                                  fit: BoxFit.cover,
                                ),
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
                    // Container(
                    //   decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 10.0, vertical: 5.0),
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: 40.0,
                    //       color: Colors.white,
                    //       child: DropdownButtonHideUnderline(
                    //         child: DropdownButton<ListItem>(
                    //           value: _selectedItem,
                    //           items: _dropdownMenuItems,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _selectedItem = value;
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: 50.0,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Adults",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                          Text(
                            "90 Per Person",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Children",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                        Text(
                          "90 Per Person",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          //     child: Container(
          //         child: Text(
          //       Constants.PAYMENT_CUSINA_ONLINE_ON_DEMAND_LABEL2,
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold),
          //     )),
          //   ),
          // ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Color(0xFFF1F1F1)),
              child: TableCalendar(
                selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
                firstDay: DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                onDaySelected: (selectedDay, focusedDay) {
                  print("$focusedDay $selectedDay");
                  setState(() {
                    // _selectedDay = selectedDay;
                    _focusedDay =
                        selectedDay; // update `_focusedDay` here as well
                  });
                },
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
