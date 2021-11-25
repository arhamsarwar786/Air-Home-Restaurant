import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:air_home_retaurant/UI/CorsiDiCusinaDetailScreen.dart';
import 'package:air_home_retaurant/UI/TourGastronomicDetailScreen.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Menu/MenuHamburger.dart';
import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/FavoriteModel.dart';
import 'package:air_home_retaurant/ModelClasses/PostCategories.dart';
import 'package:air_home_retaurant/UI/E_Restaurant.dart';
import 'package:air_home_retaurant/UI/HomeRestaurant.dart';
import 'package:air_home_retaurant/Utils/APIServies.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'ChefDomicilioDetailScreen.dart';
import 'CorsoCusina.dart';
import 'HomeRestaurantDetailScreen.dart';
import 'TourGastronomico2.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MyWidget _myWidget;
  ProgressDialog _progressDialog;
  TextEditingController searchBarController;
  int _groupValue = 1;
  int _groupValue2 = 2;
  HttpServices httpServices;

  @override
  initState() {
    super.initState();
    _myWidget = new MyWidget();
    _progressDialog = new ProgressDialog();
    httpServices = new HttpServices();    
     
  }




  // Date Time 
  var  dateOfSearch;

 Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(           
        key: _scaffoldKey,
        drawer: MenuHamBurger(),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset("assets/images/menu_icon.png"),
              )),
            ),
            title: Image.asset("assets/images/main_logo.png")),
        body: FutureBuilder(
          future: getFavorites(context: context, userId: GlobalState.userId),
          builder: (context, snapshot) {
              // _showDialog();
            if (snapshot.hasData && snapshot!=null) {
              var userFavourites = snapshot.data as FavoriteModel;
              GlobalState.myFavorites = userFavourites;
              return SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () {
                              mainSearchBottomSheet(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 40.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: _myWidget.myText("Search...", 12,
                                              FontWeight.bold, 1, Colors.black38)),
                                      Icon(Icons.search),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeRestaurantDetailScreen()),
                                      );
                                    },
                                    child: Container(
                                      
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                  10.0,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                  "assets/images/dish.png"),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 3.0, vertical: 3.0),
                                              child: Text(
                                                "Home Restaurant",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white),
                                              )
                                              )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TourGastronomicDetailScreen()),
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                  10.0,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                  "assets/images/destination.png"),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 3.0, vertical: 3.0),
                                              child: Text(
                                                "Tour Gastronomici",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white),
                                              )
                                              )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CorsiDiCusinaDetailScreen()),
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                  10.0,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                  "assets/images/bake.png"),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 3.0, vertical: 3.0),
                                              child: Text(
                                                "Corsi di Cusina",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white),
                                              )
                                              )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ChefDomicilioDetailScreen()),
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                  10.0,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                  "assets/images/chef.png"),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 3.0, vertical: 3.0),
                                              child: Text(
                                                "Chef a Domicilio",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white),
                                              )
                                              )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                        // This is the Corsi di Cusina
        
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _myWidget.myText("Corsi di Cusina", 15,
                                  FontWeight.bold, 1, Colors.black),
                              _myWidget.myText(
                                  "Learn the secret of cooking and take part in our course!",
                                  12,
                                  FontWeight.bold,
                                  null,
                                  Colors.black38),
                              Container(
                                height: 220.0,
                                width: double.infinity,
                                child: GlobalState.corsiDiCusinaPosts != null ?  ListView.builder(
                                        itemCount: GlobalState.corsiDiCusinaPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {                                          
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CorsoCusina(GlobalState.corsiDiCusinaPosts.data.elementAt(position))));
                                            },
                                            child: itemView(
                                                context: context,
                                                position: position,
                                                categoryPosts: GlobalState.corsiDiCusinaPosts),
                                          );
                                        },
                                      )
                                    : FutureBuilder(
                                  future: getCategoryPostsApiCorsiDiCusina(context: context),
                                  builder: (context, snapshot) {
                                    // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                                    if (snapshot.hasData) {
                                      var categoryPosts =
                                          snapshot.data as CategoryPostsModel;
                                      log("list item = ${categoryPosts.data.length}");
                                      return ListView.builder(
                                        itemCount: categoryPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                              // print(await categoryPosts.data.elementAt(position).hostId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CorsoCusina(categoryPosts
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
                                      );
                                    }
                                    if (snapshot == null) {
                                      return Center(
                                        child:
                                            Text("Corsi si cusina Post list Null"),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text("Snapshot has error"),
                                      );
                                    } else {
                                      // print("state = ${snapshot.connectionState}");
                                      return Center(
                                          child: Wrap(
                                        children: [
                                          Container(
                                              height: 50.0,
                                              width: 50.0,
                                              child: CircularProgressIndicator(color:Colors.red),),
                                        ],
                                      ));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     
                      // This is Home Restaurant
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _myWidget.myText("Home Restaurant", 15,
                                  FontWeight.bold, 1, Colors.black),
                              _myWidget.myText(
                                  "Learn the secret of cooking and take part in our course!",
                                  12,
                                  FontWeight.bold,
                                  null,
                                  Colors.black38),
                              Container(
                                height: 220.0,
                                width: double.infinity,
                                child: GlobalState.homeRestaurantPosts != null ?  ListView.builder(
                                        itemCount: GlobalState.homeRestaurantPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                              // print(await categoryPosts.data.elementAt(position).hostId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeRestaurant(GlobalState.homeRestaurantPosts.data.elementAt(position))));
                                            },
                                            child: itemView(
                                                context: context,
                                                position: position,
                                                categoryPosts: GlobalState.homeRestaurantPosts),
                                          );
                                        },
                                      )
                                    : FutureBuilder(
                                  future: getCategoryPostsApiHomeRestaurant(context:context),
                                  builder: (context, snapshot) {
                                    // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                                    if (snapshot.hasData) {
                                      var categoryPosts =
                                          snapshot.data as CategoryPostsModel;
                                      log("list item = ${categoryPosts.data.length}");
                                      return ListView.builder(
                                        itemCount: categoryPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                            // Navigator.push(
                                            //       context,
                                            //       MaterialPageRoute(
                                            //           builder: (context) =>
                                                          // ERestaurant(categoryPosts
                                                          //     .data
                                                          //     .elementAt(
                                                          //         position))));
        
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
                                      );
                                    }
                                    if (snapshot == null) {
                                      return Center(
                                        child:
                                            Text("Corsi si cusina Post list Null"),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text("Snapshot has error"),
                                      );
                                    } else {
                                      // print("state = ${snapshot.connectionState}");
                                      return Center(
                                          child: Wrap(
                                        children: [
                                          Container(
                                              height: 50.0,
                                              width: 50.0,
                                              child: CircularProgressIndicator(color: Colors.red,)),
                                        ],
                                      ));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                       // This is Chef a Domicilio
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _myWidget.myText("Chef a Domicilio", 15,
                                  FontWeight.bold, 1, Colors.black),
                              _myWidget.myText(
                                  "Learn the secret of cooking and take part in our course!",
                                  12,
                                  FontWeight.bold,
                                  null,
                                  Colors.black38),
                              Container(
                                height: 220.0,
                                width: double.infinity,
                                child: GlobalState.chefDomicilioPosts != null ?  ListView.builder(
                                        itemCount: GlobalState.chefDomicilioPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                              // print(await categoryPosts.data.elementAt(position).hostId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ERestaurant(GlobalState.chefDomicilioPosts.data.elementAt(position))));
                                            },
                                            child: itemView(
                                                context: context,
                                                position: position,
                                                categoryPosts: GlobalState.chefDomicilioPosts),
                                          );
                                        },
                                      )
                                    :  FutureBuilder(
                                  future: getCategoryPostsApiChefDomicilio(context:context),
                                  builder: (context, snapshot) {
                                    // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                                    if (snapshot.hasData) {
                                      var categoryPosts =
                                          snapshot.data as CategoryPostsModel;
                                      log("list item = ${categoryPosts.data.length}");
                                      return ListView.builder(
                                        itemCount: categoryPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                              // print(await categoryPosts.data.elementAt(position).hostId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ERestaurant(categoryPosts
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
                                      );
                                    }
                                    if (snapshot == null) {
                                      return Center(
                                        child:
                                            Text("Corsi si cusina Post list Null"),
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
                                              child: CircularProgressIndicator(color:Colors.red)),
                                        ],
                                      ));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                      // This is Tour Gastronomici
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _myWidget.myText("Tour Gastronomici", 15,
                                  FontWeight.bold, 1, Colors.black),
                              _myWidget.myText(
                                  "Learn the secret of cooking and take part in our course!",
                                  12,
                                  FontWeight.bold,
                                  null,
                                  Colors.black38),
                              Container(
                                height: 220.0,
                                width: double.infinity,
                                child: GlobalState.tourGastronomiciPosts != null ?  ListView.builder(
                                        itemCount: GlobalState.tourGastronomiciPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                              // print(await categoryPosts.data.elementAt(position).hostId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TourGastronomico2(GlobalState.tourGastronomiciPosts.data.elementAt(position))));
                                            },
                                            child: itemView(
                                                context: context,
                                                position: position,
                                                categoryPosts: GlobalState.tourGastronomiciPosts),
                                          );
                                        },
                                      )
                                    :  FutureBuilder(
                                  future: getCategoryPostsApiTourGastronomici(context: context),
                                  builder: (context, snapshot) {
                                    // log("HomeFuture::fetch all posts Length = ${GlobalState.postsList.data.length}");
                                    if (snapshot.hasData) {
                                      var categoryPosts =
                                          snapshot.data as CategoryPostsModel;
                                      log("list item = ${categoryPosts.data.length}");
                                      return ListView.builder(
                                        itemCount: categoryPosts.data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return InkWell(
                                            onTap: () async {
                                              // print(await categoryPosts.data.elementAt(position).hostId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TourGastronomico2(categoryPosts
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
                                      );
                                    }
                                    if (snapshot == null) {
                                      return Center(
                                        child:
                                            Text("Corsi si cusina Post list Null"),
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
                                              child: CircularProgressIndicator(color:Colors.red)),
                                        ],
                                      ));
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
                ],
            ),
              );
            }else if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.red,));
            }else{
              return Container(child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sorry!",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20)),
                  Text(" Failed to Load Data",style:TextStyle(color: Colors.grey[600])),
                ],
              )),);
            }
            }
        ),
      ),
    );
  }

  Future<PostCategories> callGetCategoryApi(
      {@required BuildContext context}) async {
    var categoriesList;
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBody(
        url: Constants.GET_POST_CATEGORIES_API,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          var categories = PostCategories.fromJson(jsonDecode(response.body));
          GlobalState.categoriesPosts = categories;
          if (GlobalState.categoriesPosts != null) {
            categoriesList = GlobalState.categoriesPosts;
          }
        },
        onFailure: (_streamedResponse) {
          print(
              "Home Screen get Category onFailure::${_streamedResponse.reasonPhrase}");
          categoriesList = null;
        });
    return categoriesList;
  } 


  ///////////////////////
  ///  GET CORSO CUSINA
  Future<CategoryPostsModel> getCategoryPostsApiCorsiDiCusina(
      {@required BuildContext context}) async 
      {
    
    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '5');
    var res2 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '8');
    var res3 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '9');
    var response1 = await http.Response.fromStream(res1);
    var response2 = await http.Response.fromStream(res2);
    var response3 = await http.Response.fromStream(res3);

    var resDec1 = jsonDecode(response1.body);
    var resDec2 = jsonDecode(response2.body);
    var resDec3 = jsonDecode(response3.body);

    resDec1['data'] = resDec1['data'] + resDec2['data'] + resDec3['data'];
    CategoryPostsModel list;
    var response = resDec1;
    // print(response);
    if (response1.statusCode == 200) {
      var responseList = CategoryPostsModel.fromJson(response);
      if (responseList != null) {
        // For Save Posts in GlobalState 
        print("crosiDi API HIT DATA : ${responseList.data.length}");
        GlobalState.corsiDiCusinaPosts = responseList;
     
        log("Corsi list length = ${responseList.data.length}");
        
        return list = responseList;
      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

  ///////////////////////
  ///  GET HOME RESTAURANT
  Future<CategoryPostsModel> getCategoryPostsApiHomeRestaurant({@required BuildContext context}) async {

    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '1');
    var res2 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '4');
    var res3 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '2');
    //     // var homeRestaurantResponse = res1 + res2 + res3;
    var response1 = await http.Response.fromStream(res1);
    var response2 = await http.Response.fromStream(res2);
    var response3 = await http.Response.fromStream(res3);

    var resDec1 = jsonDecode(response1.body);
    var resDec2 = jsonDecode(response2.body);
    var resDec3 = jsonDecode(response3.body);

    resDec1['data'] = resDec1['data'] + resDec2['data'] + resDec3['data'];
    CategoryPostsModel list;
    var response = resDec1;
    // print(response);
    if (response1.statusCode == 200) {
      var responseList = CategoryPostsModel.fromJson(response);
      if (responseList != null) {
        GlobalState.homeRestaurantPosts = responseList;
        return list = responseList;
      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

  ///////////////////////
  ///  GET CHEF A DOMICILIO
  Future<CategoryPostsModel> getCategoryPostsApiChefDomicilio({@required BuildContext context}) async {

    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '7');
    var res2 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '10');
    
    var response1 = await http.Response.fromStream(res1);
    var response2 = await http.Response.fromStream(res2);

    var resDec1 = jsonDecode(response1.body);
    var resDec2 = jsonDecode(response2.body);

    resDec1['data'] = resDec1['data'] + resDec2['data'];
    CategoryPostsModel list;
    var response = resDec1;
    // print(response);
    if (response1.statusCode == 200) {
      var responseList = CategoryPostsModel.fromJson(response);
      if (responseList != null) {
        GlobalState.chefDomicilioPosts = responseList;

    // GlobalState.postsList.data =GlobalState.postsList.data + resDec1['data'];
        // GlobalState.postsList = responseList;
        log("chef list length = ${responseList.data.length}");
    // GlobalState.postsList.data =GlobalState.postsList.data + responseList.data;
        return list = responseList;

      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

  ///////////////////////
  ///  GET TOUR GASTRONOMICI
  Future<CategoryPostsModel> getCategoryPostsApiTourGastronomici({@required BuildContext context}) async {

    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.GET_POSTS_API + '3');
    
    
    var response1 = await http.Response.fromStream(res1);

    var resDec1 = jsonDecode(response1.body);

    resDec1['data'] = resDec1['data'];
    CategoryPostsModel list;
    var response = resDec1;
    // print(response);
    if (response1.statusCode == 200) {
      var responseList = CategoryPostsModel.fromJson(response);
      if (responseList != null) {
        GlobalState.tourGastronomiciPosts = responseList;

    // GlobalState.postsList.data = GlobalState.postsList.data + resDec1['data'];
        // GlobalState.postsList = responseList;
        log("Tour list length = ${responseList.data.length}");
    // GlobalState.postsList.data =GlobalState.postsList.data + responseList.data;
        return list = responseList;

      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }

  Widget itemView(
      {@required BuildContext context,
      @required int position,
      @required CategoryPostsModel categoryPosts}) {
    return Card(
      child: Container(
        height: 220.0,
        width: 250.0,
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
                                              deleteFavorite(
                                                  context: context,
                                                  idUser: GlobalState.userId,
                                                  item: categoryPosts.data
                                                      .elementAt(position));
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 40,
                                              color: Colors.red,
                                            ))
                                        : IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              addFavoriteAPI(
                                                  context: context,
                                                  userId: GlobalState.userId,
                                                  eventId: categoryPosts.data
                                                      .elementAt(position)
                                                      .id);
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

  
  void mainSearchBottomSheet(context) {
    int value1 = 1;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: new Container(
                            height: 30.0,
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      Constants.CLASS_HOME_SCREEN_SEARCH_LABEL1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      child: Image.asset(
                                          "assets/images/delete.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: _myWidget.myRadioButton(
                                  value: 0,
                                  groupValue: _groupValue2,
                                  onChanged: (newValue) =>
                                      mystate(() => _groupValue2 = newValue),
                                ),
                              ),
                              Text(
                                Constants.CLASS_HOME_SCREEN_SEARCH_LABEL2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Color(0xFFDBDBDB),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .CLASS_HOME_SCREEN_SEARCH_LABEL3,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38)),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.asset(
                                                  "assets/images/location-r.png"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: _myWidget.myText(
                                                  dateOfSearch != null ?  dateOfSearch: Constants
                                                      .CLASS_HOME_SCREEN_SEARCH_LABEL4,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38)),
                                          Expanded(
                                            child: InkWell(
                                              onTap: ()async{
                                                dateOfSearch = await _selectDate(context);
                                                  
                                               mystate((){
                                                dateOfSearch = DateFormat("yyyy-MM-dd").format(dateOfSearch);

                                               });
                                                // print();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    "assets/images/calendar-r.png"),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: _myWidget.myText(
                                                  Constants
                                                      .CLASS_HOME_SCREEN_SEARCH_LABEL5,
                                                  12,
                                                  FontWeight.bold,
                                                  1,
                                                  Colors.black38)),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: _myWidget.selectValue(
                                                  () {
                                                    mystate(() {
                                                      value1++;
                                                      // print("$value1");
                                                    });
                                                  },
                                                  value1,
                                                  () {
                                                    mystate(() {
                                                      value1--;
                                                      // print("$value1");
                                                    });
                                                  }),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: new Container(
                        height: 30.0,
                        child: Expanded(
                          child: Container(
                            child: Text(
                              Constants.CLASS_HOME_SCREEN_SEARCH_LABEL6,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      // leading: new Icon(Icons.music_note),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: _myWidget.myRadioButton(
                              value: 1,
                              groupValue: _groupValue,
                              onChanged: (newValue) =>
                                  mystate(() => _groupValue = newValue),
                            ),
                          ),
                          Text(
                            Constants.CLASS_HOME_SCREEN_SEARCH_LABEL7,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      // leading: new Icon(Icons.music_note),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: _myWidget.myRadioButton(
                              value: 2,
                              groupValue: _groupValue,
                              onChanged: (newValue) =>
                                  mystate(() => _groupValue = newValue),
                            ),
                          ),
                          Text(
                            Constants.CLASS_HOME_SCREEN_SEARCH_LABEL8,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // leading: new Icon(Icons.music_note),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: _myWidget.myRadioButton(
                              value: 3,
                              groupValue: _groupValue,
                              onChanged: (newValue) =>
                                  mystate(() => _groupValue = newValue),
                            ),
                          ),
                          Text(
                            Constants.CLASS_HOME_SCREEN_SEARCH_LABEL9,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // leading: new Icon(Icons.music_note),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: _myWidget.myRadioButton(
                              value: 4,
                              groupValue: _groupValue,
                              onChanged: (newValue) =>
                                  mystate(() => _groupValue = newValue),
                            ),
                          ),
                          Text(
                            Constants.CLASS_HOME_SCREEN_SEARCH_LABEL10,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      Constants
                                          .CLASS_HOME_SCREEN_SEARCH_BUTTON1,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            "assets/images/search_w.png"),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<FavoriteModel> getFavorites({
    @required BuildContext context,
    @required int userId,
  }) async {
    HttpServices httpServices = new HttpServices();
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
        url: APIServices.FAVORITES_API + "?i=$userId");
        var response = await http.Response.fromStream(_streamedResponse);
        if (response.statusCode == 200) {
            if (response != null) {
              var responseList =
                FavoriteModel.fromJson(jsonDecode(response.body));
              if (responseList != null) {
                log("response list = ${responseList.message}");
                GlobalState.myFavorites = responseList;
              }
            }}
    return GlobalState.myFavorites;
  }

  Future<void> addFavoriteAPI(
      {@required BuildContext context,
      @required int userId,
      @required int eventId}) async {
    DateTime now = DateTime.now();
    Map<String, int> bodyMap = new HashMap();
    bodyMap['iduser'] = userId;
    bodyMap['idevento'] = eventId;
    httpServices.postJson(
        body: bodyMap,
        url: APIServices.ADD_FAVORITES_API,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          if (response.statusCode == 200) {
            log("Add Favorite onSuccess");
            setState(() {
              GlobalState.myFavorites.data.add(
                  FavoriteItem(idUser: userId, idEvento: eventId, data: now));
            });
          }
        },
        onFailure: (_streamedResponse) async {
          log("Add Favorite onFailure");
        });
  }

//// Refresh Indicator Function Definition
  Future refreshFunction() {
    print("Refreshed");

  }

  Future<void> deleteFavorite(
      {@required BuildContext context,
      @required int idUser,
      @required CategoryPostsList item}) async {
    HttpServices httpServices = new HttpServices();
    log("URL = " +
        APIServices.DELETE_FAVORITES_API +
        "?i=$idUser&e=${item.id}");
    await httpServices.getJsonWithOutBody(
        url: APIServices.DELETE_FAVORITES_API + "?i=$idUser&e=${item.id}",
        onSuccess: (_streamedResponse) async {
          if (_streamedResponse.statusCode == 200) {
            var response = await http.Response.fromStream(_streamedResponse);
            log("favorite delete onSuccess");
            setState(() {
              GlobalState.myFavorites.data.removeWhere((element) {
                return element.idEvento == item.id;
              });
            });
          }
        },
        onFailure: (_streamedResponse) {
          log("favorite delete onFailure");
        });
  }

  ///  Cusino get Form API
  getCousinoList(String cousino) {
 
     if (cousino != "") {
      var cousinoList = cousino.split(',');
    return cousinoList;
                   
    }
  }



  
  // Select Date Of Birth
  _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime selected = await showDatePicker(
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red,
            accentColor: Colors.red,
            colorScheme: ColorScheme.light(primary: Colors.red),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
    return selectedDate;
  }

}
