import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/UI/HomeRestaurant.dart';
import 'package:air_home_retaurant/UI/Single_POST_SHOW.dart';
import 'package:http/http.dart' as http;
import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'HomeRestaurant.dart';

class CorsiDiCusinaDetailScreen extends StatefulWidget {
  @override
  State<CorsiDiCusinaDetailScreen> createState() =>
      _CorsiDiCusinaDetailScreenState();
}

class _CorsiDiCusinaDetailScreenState extends State<CorsiDiCusinaDetailScreen> {
  MyWidget _myWidget;
  ProgressDialog _progressDialog;
  HttpServices httpServices;

  // List Lengths
  var postLength = 10;
  var originalLength = 0  ;


  @override
  initState() {
    super.initState();
    _myWidget = new MyWidget();
    _progressDialog = new ProgressDialog();
    httpServices = new HttpServices();
  }

  Future<CategoryPostsModel> callGetCategoryPostsApi(
      {@required String categoryId, @required BuildContext context}) async {
    CategoryPostsModel list;
    Map<String, String> bodyMap = new HashMap();
    bodyMap['category'] = categoryId;
    HttpServices httpServices = new HttpServices();
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + categoryId);
    var response = await http.Response.fromStream(_streamedResponse);
    if (response.statusCode == 200) {
      var responseList = CategoryPostsModel.fromJson(jsonDecode(response.body));
      if (responseList != null) {
        GlobalState.postsList = responseList;
        log("response list length = ${responseList.data.length}");
        list = responseList;
      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar("Corsi Di Cusina", () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(
            children: [
              //  Cooking class
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        // height: double.infinity,
                        width: double.infinity,
                        child: FutureBuilder(
                          future: callGetCategoryPostsApi(
                              categoryId: "5", context: context),
                          builder: (context, snapshot) {
                            // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                            if (snapshot.hasData) {
                              var categoryPosts =
                                  snapshot.data as CategoryPostsModel;
                                  originalLength = categoryPosts.data.length;
                              log("list item = ${categoryPosts.data.length}");
                              if(categoryPosts.data.isNotEmpty)  return Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Cooking class",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.red),
                                        textAlign: TextAlign.start,
                                      )),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: (postLength >=
                                            categoryPosts.data.length)
                                        ? categoryPosts.data.length
                                        : postLength,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, position) {
                                      return InkWell(
                                        onTap: () async {
                                          // print(await categoryPosts.data.elementAt(position).hostId);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeRestaurant(
                                                          categoryPosts.data
                                                              .elementAt(
                                                                  position))));
                                        },
                                        child: itemView(
                                            context: context,
                                            position: position,
                                            categoryPosts: categoryPosts),
                                      );
                                    },
                                  ),
                                 (postLength > originalLength) ? Container():     MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SinglePostShow(
                                                  "Cooking class", "5")));
                                    },
                                    child: Text(
                                      "SEE ALL POST",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.red,
                                  ),
                                ],
                              );
                              else return Container();
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
                              return Container(                                
                                height: MediaQuery.of(context).size.height,
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.red),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //  Online cooking course
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        // height: double.infinity,
                        width: double.infinity,
                        child: FutureBuilder(
                          future: callGetCategoryPostsApi(
                              categoryId: "8", context: context),
                          builder: (context, snapshot) {
                            // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                            if (snapshot.hasData) {
                              var categoryPosts =
                                  snapshot.data as CategoryPostsModel;
                                  originalLength = categoryPosts.data.length;
                              log("list item = ${categoryPosts.data.length}");
                               if(categoryPosts.data.isNotEmpty) return Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Online cooking course",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.red),
                                        textAlign: TextAlign.start,
                                      )),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: (postLength >=
                                            categoryPosts.data.length)
                                        ? categoryPosts.data.length
                                        : postLength,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, position) {
                                      return InkWell(
                                        onTap: () async {
                                          // print(await categoryPosts.data.elementAt(position).hostId);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeRestaurant(
                                                          categoryPosts.data
                                                              .elementAt(
                                                                  position))));
                                        },
                                        child: itemView(
                                            context: context,
                                            position: position,
                                            categoryPosts: categoryPosts),
                                      );
                                    },
                                  ),
                                  (postLength > originalLength) ? Container():    MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SinglePostShow(
                                                  "Online cooking course",
                                                  "8")));
                                    },
                                    child: Text(
                                      "SEE ALL POST",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.red,
                                  ),
                                ],
                              );
                           else return Container(); }
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
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //  Ondemand cooking course
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        // height: double.infinity,
                        width: double.infinity,
                        child: FutureBuilder(
                          future: callGetCategoryPostsApi(
                              categoryId: "9", context: context),
                          builder: (context, snapshot) {
                            // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                            if (snapshot.hasData) {
                              var categoryPosts =
                                  snapshot.data as CategoryPostsModel;
                                  originalLength = categoryPosts.data.length;
                              log("list item = ${categoryPosts.data.length}");
                                if(categoryPosts.data.isNotEmpty){
                                  return Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Ondemand cooking course",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.red),
                                        textAlign: TextAlign.start,
                                      )),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: (postLength >=
                                            categoryPosts.data.length)
                                        ? categoryPosts.data.length
                                        : postLength,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, position) {
                                      return InkWell(
                                        onTap: () async {
                                          // print(await categoryPosts.data.elementAt(position).hostId);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeRestaurant(
                                                          categoryPosts.data
                                                              .elementAt(
                                                                  position))));
                                        },
                                        child: itemView(
                                            context: context,
                                            position: position,
                                            categoryPosts: categoryPosts),
                                      );
                                    },
                                  ),
                                 (postLength > originalLength) ? Container():     MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SinglePostShow(
                                                  "Ondemand cooking course",
                                                  "9")));
                                    },
                                    child: Text(
                                      "SEE ALL POST",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.red,
                                  ),
                                ],
                              );
                                }
                            else{
                              return Container();
                              
                            }
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
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget itemView(
      {@required BuildContext context,
      @required int position,
      @required CategoryPostsModel categoryPosts}) {
    return Card(
      child: Container(
        height: 220.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(5.0)),
              child: (categoryPosts.data.elementAt(position).foto.isNotEmpty)
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.network(
                              categoryPosts.data
                                  .elementAt(position)
                                  .foto
                                  .elementAt(0)
                                  .urlFoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                       ],
                    )
                  : Container(),
            )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _myWidget.myText(
                            categoryPosts.data.elementAt(position).nome,
                            12,
                            FontWeight.bold,
                            1,
                            Colors.black),
                        _myWidget.myText(
                            categoryPosts.data.elementAt(position).luogoCitta,
                            12,
                            FontWeight.bold,
                            1,
                            Colors.black38),
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
                                "${categoryPosts.data.elementAt(position).valutazione}",
                                12,
                                FontWeight.normal,
                                1,
                                Colors.white),
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
                  if (categoryPosts.data.elementAt(position).cucina != "")
                    for (var i = 0;
                        i <
                            getCousinoList(categoryPosts.data
                                    .elementAt(position)
                                    .cucina
                                    .toString())
                                .length;
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
                                  "${getCousinoList(categoryPosts.data.elementAt(position).cucina.toString())[i]}",
                                  11,
                                  FontWeight.normal,
                                  1,
                                  Colors.black),
                            ),
                          ),
                        ),
                      ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5.0),
                  //         color: Colors.black26),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(3.0),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //         child: _myWidget.myText("Spagnola", 12,
                  //             FontWeight.normal, 1, Colors.black),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5.0),
                  //         color: Colors.black26),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(3.0),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //         child: _myWidget.myText("Mediterranea", 12,
                  //             FontWeight.normal, 1, Colors.black),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                      child: Text(
                    "${categoryPosts.data.elementAt(position).prezzoOndemand}",
                    textAlign: TextAlign.end,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///  Cusino get Form API
  getCousinoList(String cousino) {
    if (cousino != "") {
      var cousinoList = cousino.split(',');
      return cousinoList;
    }
  }
}
