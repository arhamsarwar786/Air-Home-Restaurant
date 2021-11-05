import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/UI/HomeRestaurant.dart';
import 'package:http/http.dart' as http;
import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'HomeRestaurant.dart';

class SinglePostShow extends StatefulWidget {
  final postName,categoryId;
  SinglePostShow(this.postName,this.categoryId);

  @override
  State<SinglePostShow> createState() => SinglePostShowState();
}

class SinglePostShowState extends State<SinglePostShow> {

    MyWidget _myWidget;
  ProgressDialog _progressDialog;
  HttpServices httpServices;

  // List Lengths
  var postLength = 10;
  var originalLength = 0;
  

  
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
 
      body: SafeArea(child: Container(
         width: double.infinity,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: FutureBuilder(
             future: callGetCategoryPostsApi(
                 categoryId: widget.categoryId, context: context),
             builder: (context, snapshot) {
               // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
               if (snapshot.hasData) {
                 var categoryPosts =
                     snapshot.data as CategoryPostsModel;
               originalLength = categoryPosts.data.length;

               
                 log("Original Length %%%%%%%%%%%%%%%%%%%%5 = ${categoryPosts.data.length}");
                 return SingleChildScrollView(
                   child: Column(
                     children: [
                            Container(
          padding: EdgeInsets.all(8.0),
          child: Text("${widget.postName}",style: TextStyle(fontSize: 30,color: Colors.red),textAlign: TextAlign.start,)),
                       ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemCount: (postLength >= categoryPosts.data.length) ? categoryPosts.data.length:postLength,
                         scrollDirection: Axis.vertical,
                         itemBuilder: (context, position) {
                           return InkWell(
                             onTap: () async {
                               // print(await categoryPosts.data.elementAt(position).hostId);
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>
                                           HomeRestaurant(categoryPosts
                                               .data
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

                          (postLength > originalLength) ? Container():   MaterialButton(onPressed: (){
         setState(() {
           postLength = postLength + 10;
         });
       },child: Text("LOAD MORE",style: TextStyle(color: Colors.white),),color: Colors.red,),
                     ],
                   ),
                 );
               }
               if (snapshot == null) {
                 return Center(
                   child:
                       Text("${widget.postName} Post list Null"),
                 );
               }
               if (snapshot.hasError) {
                 return Center(
                   child: Text("Snapshot has error"),
                 );
               } else {
                 print("state = ${snapshot.connectionState}");
                 return Container(
                   
                   child: Center(
                       child: 
                            CircularProgressIndicator(color:Colors.red),),
                 );
               }
             },
           ),
         ),
       )),
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
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  child: Center(
                                    child: GlobalState.myFavorites.data
                                            .any((element) {
                                      return element.idEvento ==
                                          categoryPosts.data
                                              .elementAt(position)
                                              .id;
                                    })
                                        ? IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              // deleteFavorite(
                                              //     context: context,
                                              //     idUser: GlobalState.userId,
                                              //     item: categoryPosts.data
                                              //         .elementAt(position));
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 40,
                                              color: Colors.red,
                                            ))
                                        : IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              // addFavoriteAPI(
                                              //     context: context,
                                              //     userId: GlobalState.userId,
                                              //     eventId: categoryPosts.data
                                              //         .elementAt(position)
                                              //         .id);
                                            },
                                            icon: Icon(
                                              Icons.favorite_outline_rounded,
                                              size: 40,
                                              color: Colors.red,
                                            )),
                                  )),
                            )),
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
                  if(categoryPosts.data.elementAt(position).cucina != "")
                   for (var i = 0; i < getCousinoList(categoryPosts.data.elementAt(position).cucina.toString()).length; i++)                    
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black26),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: _myWidget.myText("${getCousinoList(categoryPosts.data.elementAt(position).cucina.toString())[i]}", 11,
                              FontWeight.normal, 1, Colors.black),
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