import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/ModelClasses/FavoriteModel.dart';
import 'package:air_home_retaurant/Utils/APIServies.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Favourite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Favourite();
}

class _Favourite extends State<Favourite> {
  MyWidget _myWidget;

  FavoriteModel myFavorites;
  List<FavoriteItem> list;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    myFavorites = GlobalState.myFavorites;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.FAVOURITE_TITLE, () {
        // Navigator.pop(context);
      }),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFFF5F5F5),
          child: myFavorites != null
              ? ListView.builder(
                  itemCount: myFavorites.data.length,
                  itemBuilder: (context, position) {
                    print("Global State Favorite Call");
                    return listItem(
                        context: context,
                        position: position,
                        favorites: myFavorites.data.elementAt(position));
                  },
                )
              : FutureBuilder(
                  future: getFavorites(context: context),
                  builder: (context, snapshot) {
                    print("Global State Favorite null");
                    if (snapshot.hasData) {
                      myFavorites = snapshot.data as FavoriteModel;
                      log("list item = ${myFavorites.data.length}");
                      return ListView.builder(
                        itemCount: myFavorites.data.length,
                        itemBuilder: (context, position) {
                          return listItem(
                              context: context,
                              position: position,
                              favorites: myFavorites.data.elementAt(position));
                        },
                      );
                    }
                    if (snapshot == null) {
                      return Center(
                        child: Text("Corsi si cusina Post list Null"),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Snapshot has error"),
                      );
                    } else {
                      print("state = ${snapshot.connectionState}");
                      return Center(
                          child: Wrap(
                        children: [
                          Container(
                              height: 50.0,
                              width: 50.0,
                              child: CircularProgressIndicator()),
                        ],
                      ));
                    }
                  },
                )),
    );
  }

  Widget listItem(
      {@required int position,
      @required BuildContext context,
      @required FavoriteItem favorites}) {
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
                        child: Image.network(
                          GlobalState.postsList.data
                              .firstWhere((element) {
                                return element.id == favorites.idEvento;
                              })
                              .foto
                              .elementAt(0)
                              .urlFoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              deleteFavorite(context: context, item: favorites);
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
                            child: _myWidget.myText(
                                GlobalState.postsList.data
                                    .firstWhere((element) {
                                  return element.id == favorites.idEvento;
                                }).nome,
                                12,
                                FontWeight.bold,
                                1,
                                Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: _myWidget.myText(
                                GlobalState.postsList.data
                                    .firstWhere((element) {
                                  return element.id == favorites.idEvento;
                                }).luogoCitta,
                                12,
                                FontWeight.bold,
                                1,
                                Colors.black38),
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

  Future<FavoriteModel> getFavorites({
    @required BuildContext context,
  }) async {
    FavoriteModel favoriteModel;
    HttpServices httpServices = new HttpServices();
    Map<String, int> bodyMap = new HashMap();
    bodyMap['i'] = GlobalState.userId;
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
        url: APIServices.FAVORITES_API + "?i=${GlobalState.userId}");
    if (_streamedResponse.statusCode == 200) {
      var response = await http.Response.fromStream(_streamedResponse);
      log("response list = ${response.body}");
      if (response != null) {
        var responseList = FavoriteModel.fromJson(jsonDecode(response.body));
        if (responseList != null) {
          log("response list = ${responseList.message}");
          favoriteModel = responseList;
          GlobalState.myFavorites = responseList;
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
      {@required BuildContext context, @required FavoriteItem item}) async {
    HttpServices httpServices = new HttpServices();
    log("URL = " +
        APIServices.DELETE_FAVORITES_API +
        "?i=${item.idUser}&e=${item.idEvento}");
    await httpServices.getJsonWithOutBody(
        url: APIServices.DELETE_FAVORITES_API +
            "?i=${item.idUser}&e=${item.idEvento}",
        onSuccess: (_streamedResponse) async {
          if (_streamedResponse.statusCode == 200) {
            var response = await http.Response.fromStream(_streamedResponse);
            log("favorite delete response list = ${response.body}");
            setState(() {
              myFavorites.data.removeWhere((element) {
                return element.idEvento == item.idEvento;
              });
            });
          }
        },
        onFailure: (_streamedResponse) {
          log("Internal Server error = ${_streamedResponse.statusCode}");
        });
  }
}
