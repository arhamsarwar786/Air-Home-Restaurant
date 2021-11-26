import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/FavoriteModel.dart';
import 'package:air_home_retaurant/UI/E_Restaurant.dart';
import 'package:air_home_retaurant/UI/TourGastronomico2.dart';
import 'CorsoCusina.dart';
import 'package:air_home_retaurant/UI/MainScreen.dart';
import 'package:air_home_retaurant/Utils/APIServies.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'HomeRestaurant.dart';

class Favourite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Favourite();
}

class _Favourite extends State<Favourite> {
  MyWidget _myWidget;

  FavoriteModel myFavorites;
  List<FavoriteItem> list;

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    // myFavorites = GlobalState.myFavorites;
    GlobalState.allPostsList.clear();
    fetchAllPostsData();
    getFavorites(context: context);
  }

  fetchAllPostsData() {
    if (GlobalState.allPostsList.isEmpty) {
      GlobalState.allPostsList.addAll(GlobalState.corsiDiCusinaPosts.data +
          GlobalState.homeRestaurantPosts.data +
          GlobalState.chefDomicilioPosts.data +
          GlobalState.tourGastronomiciPosts.data);
    } else
      print("DATA Full");
  }

  Future<bool> _onWillPop() async {
    return Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen())) ??
        false;
  }

  List<CategoryPostsList> demoList = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: _myWidget.myAppBar(Constants.FAVOURITE_TITLE, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MainScreen()));
          }),
          body: isCheck
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : Container(
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Color(0xFFF5F5F5),
                      child: demoList.isEmpty
                          ? Center(
                              child: Text("No Favourite Added Yet"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: demoList.length,
                              itemBuilder: (context, position) {
                                return InkWell(
                                  onTap: () {
                                    print(demoList[position].tipoeventoId);
                                    if (demoList[position].tipoeventoId == 5 || demoList[position].tipoeventoId == 8 || demoList[position].tipoeventoId == 9 ) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CorsoCusina(
                                                demoList[position])));
                                      
                                    }
                                    else  if (demoList[position].tipoeventoId == 1 || demoList[position].tipoeventoId == 4 || demoList[position].tipoeventoId == 2 ) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => HomeRestaurant(
                                                demoList[position])));
                                      
                                    }
                                    else  if (demoList[position].tipoeventoId == 7 || demoList[position].tipoeventoId == 10) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ERestaurant(
                                                demoList[position])));
                                      
                                    }
                                    else  if (demoList[position].tipoeventoId == 3 ) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => TourGastronomico2(
                                                demoList[position])));
                                      
                                    }else{
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ERestaurant(
                                                demoList[position])));
                                    }
                                    // setState(() {
                                    // isSelected = true;

                                    // });
                                    // Future.delayed(Duration(seconds:1),(){
                                    //   setState(() {
                                    //   isSelected = false;
                                    //   });
                                    // });
                                  },
                                  child: listItem(
                                    context: context,
                                    position: position,
                                    favorites: demoList[position],
                                  ),
                                );
                              })),
                )),
    );
  }

  Widget listItem(
      {@required position,
      @required BuildContext context,
      @required CategoryPostsList favorites
      // @required  favorites,favoritesSaved
      }) {
    MyWidget _myWidget = new MyWidget();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: favorites.foto.isNotEmpty
                              ? Image.network(
                                  favorites.foto.elementAt(0).urlFoto,
                                  fit: BoxFit.cover,
                                )
                              : Container()),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              // favoritesSaved.removeAt(position);
                              deleteFavorite(context: context, item: favorites);
                              // setState(() {
                              // GlobalState.favoruritesSaved.removeAt(position);

                              // });
                            },
                            child: Container(
                                height: 40.0,
                                width: 40.0,
                                child: Image.asset("assets/images/heart.png")),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: _myWidget.myText(favorites.nome, 12,
                                FontWeight.bold, 1, Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: _myWidget.myText(favorites.luogoCitta, 12,
                                FontWeight.bold, 1, Colors.black38),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: _myWidget.myText(
                                "Catagory", 12, FontWeight.bold, 1, Colors.red),
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
                              child: _myWidget.myText("4.0", 12,
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
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "90,0000",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
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

  bool isCheck = false;
  Future<FavoriteModel> getFavorites({
    @required BuildContext context,
  }) async {
    setState(() {
      isCheck = true;
    });
    FavoriteModel favoriteModel;
    HttpServices httpServices = new HttpServices();
    Map<String, int> bodyMap = new HashMap();
    bodyMap['i'] = GlobalState.userId;
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
        url: APIServices.FAVORITES_API + "?i=${GlobalState.userId}");
    if (_streamedResponse.statusCode == 200) {
      var response = await http.Response.fromStream(_streamedResponse);
      // log("response list = ${response.body}");
      if (response != null) {
        var responseList = FavoriteModel.fromJson(jsonDecode(response.body));
        if (responseList != null) {
          log("response list = ${responseList.data.length}");
          favoriteModel = responseList;
          print(favoriteModel.data.length);

          for (var i = 0; i < GlobalState.allPostsList.length; i++)
            for (var j = 0; j < favoriteModel.data.length; j++)
              if (GlobalState.allPostsList.elementAt(i).id ==
                  favoriteModel.data.elementAt(j).idEvento) {
                demoList.add(GlobalState.allPostsList.elementAt(i));
              }

          GlobalState.myFavorites = responseList;

          setState(() {
            isCheck = false;
          });
        } else {
          favoriteModel = null;
        }
      } else {
        favoriteModel = null;
      }
    }
    return favoriteModel;
  }

  Future<void> deleteFavorite(
      {@required BuildContext context,
      @required CategoryPostsList item}) async {
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBody(
        url: APIServices.DELETE_FAVORITES_API +
            "?i=${GlobalState.userId}&e=${item.id}",
        onSuccess: (_streamedResponse) async {
          if (_streamedResponse.statusCode == 200) {
            var response = await http.Response.fromStream(_streamedResponse);
            log("favorite delete response list = ${response.body}");
            setState(() {
              demoList.removeWhere((element) {
                return element.id == item.id;
              });
            });
          }
        },
        onFailure: (_streamedResponse) {
          log("Internal Server error = ${_streamedResponse.statusCode}");
        });
  }
}
