import 'dart:collection';

import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/VendorModal.dart';
import 'package:air_home_retaurant/UI/E_Restaurant.dart';
import 'package:air_home_retaurant/UI/TourGastronomico2.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CorsoCusina.dart';
import 'HomeRestaurant.dart';

class YourEvents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YourEvents();
}

class _YourEvents extends State<YourEvents> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    fetchAllPostsData();
    getEventList();
    _myWidget = new MyWidget();
  }

  List<CategoryPostsList> demoList = [];
  List<Eventi> demoList2 = GlobalState.vendorProfile.data.elementAt(0).eventi;

fetchAllPostsData() {
    if (GlobalState.allPostsList.isEmpty) {
      GlobalState.allPostsList.addAll(GlobalState.corsiDiCusinaPosts.data +
          GlobalState.homeRestaurantPosts.data +
          GlobalState.chefDomicilioPosts.data +
          GlobalState.tourGastronomiciPosts.data);
    } else
      print("DATA Full");
  }

  getEventList() {
    for (var i = 0; i < GlobalState.allPostsList.length; i++)
      for (var j = 0; j < demoList2.length; j++)
        if (GlobalState.allPostsList.elementAt(i).id ==
            demoList2.elementAt(j).id) {
          demoList.add(GlobalState.allPostsList.elementAt(i));

          setState(() {});
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: _myWidget.myAppBar(Constants.VENDOR_EVENTS_TITLE, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF5F5F5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: demoList.isEmpty ? Center(
                  child: Text("No Events") ,)
              :  ListView.builder(
            itemCount: demoList.length,
            itemBuilder: (context, position) {
              return listItem(demoList.elementAt(position), context);
            },
          ),
        ),
      ),
    );
  }

  Widget listItem(CategoryPostsList data, BuildContext context) {
    print("%%%%%%%%%%%%%%%%%%%% ${data.tipoeventoId}");
    MyWidget _myWidget = new MyWidget();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        onTap: (){
          if(data.tipoeventoId == 1 || data.tipoeventoId == 4 || data.tipoeventoId == 2)
          Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeRestaurant(data)));
          else if(data.tipoeventoId == 3)
          Navigator.push(context, MaterialPageRoute(builder: (_)=> TourGastronomico2(data)));
          else if(data.tipoeventoId == 5 || data.tipoeventoId == 8 || data.tipoeventoId == 9)
          Navigator.push(context, MaterialPageRoute(builder: (_)=> CorsoCusina(data)));
          else
          Navigator.push(context, MaterialPageRoute(builder: (_)=> ERestaurant(data)));
        },
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      image: DecorationImage(
                          image: NetworkImage(data.foto.elementAt(0).urlFoto),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5.0)),
                )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _myWidget.myText(
                                data.nome, 12, FontWeight.bold, 1, Colors.black),
                            _myWidget.myText(data.luogoCitta, 12, FontWeight.bold,
                                1, Colors.black38),
                            if (data.tipoeventoId != null)
                              getCategory(data.tipoeventoId),
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
                                child: _myWidget.myText("${data.valutazione}", 12,
                                    FontWeight.normal, 1, Colors.white),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      if (data.cucina != "")
                        for (var i = 0;
                            i < getCousinoList(data.cucina.toString()).length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.black26),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: _myWidget.myText(
                                      "${getCousinoList(data.cucina.toString())[i]}",
                                      11,
                                      FontWeight.normal,
                                      1,
                                      Colors.black),
                                ),
                              ),
                            ),
                          ),
                      Expanded(
                          child: Text(
                        "${data.prezzoOndemand}",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///  Get Category
  ///
  getCategory(int nameCategory) {
    var val = "";
    for (var i = 0; i < GlobalState.category.data.length; i++)
      if (nameCategory == GlobalState.category.data[i].id) {
        val = GlobalState.category.data[i].en;
      }

    return _myWidget.myText(val, 12, FontWeight.bold, 1, Colors.red);
  }

  ///  Cusino get Form API
  getCousinoList(String cousino) {
    if (cousino != "") {
      var cousinoList = cousino.split(',');
      return cousinoList;
    }
  }
}
