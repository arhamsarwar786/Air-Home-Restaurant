import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/UI/AddPostBlog.dart';
import 'package:air_home_retaurant/UI/Match.dart';
import 'package:air_home_retaurant/UI/MyReservations.dart';
import 'package:air_home_retaurant/UI/VendorEvents.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'ModelClasses/CategoryPostsModel.dart';
import 'ModelClasses/FavoriteModel.dart';
import 'UI/Login.dart';
import 'UI/MainScreen.dart';
import 'Utils/APIServies.dart';
import 'Utils/GlobalState.dart';
import 'Utils/HttpServices.dart';
import 'Utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

    // Initializing Hive and Getting Path for Hive 
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);

  /// Hive boxes Created
    await Hive.openBox("userIdBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AirHomeRestaurant',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variables for timer
  Timer _timer;
  int _start = 2;

  @override
  void initState() {
    super.initState();
    startTimer();
    // getAllPosts(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          /**Container for data**/
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /**Container for Logo&LogoName**/
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                            child:
                                Image.asset("assets/images/logo-splash.png")),
                      ),
                    ),
                    /**Container for title**/
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          child: Text(
                            "Travel, Eat, Share",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    /**Container for info**/
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          child: Text(
                            "The Food Experiences Booking Platform",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    /**Container for Loading**/
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [
                            SpinKitFadingCircle(color: Colors.red),
                            Container(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Loading",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  
  Future<CategoryPostsModel> getFavorites({
    @required BuildContext context,
    @required int userId,
  }) async {
    HttpServices httpServices = new HttpServices();
    Map<String, int> bodyMap = new HashMap();
    bodyMap['i'] = GlobalState.userId;
    await httpServices.getJsonWithOutBody(
        url: APIServices.FAVORITES_API + "?i=$userId",
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          if (_streamedResponse.statusCode == 200) {
            log("Login::Favorite list onSuccess");
            if (response != null) {
              var responseList =FavoriteModel.fromJson(jsonDecode(response.body));
              if (responseList != null) {
                log("response list = ${responseList.message}");
                GlobalState.myFavorites = responseList;
                if (GlobalState.myFavorites != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                } else {
                  log("Login::Favorite list onSuccess GlobalState.myFavorites null");
                }
              }
            }
          } else {
            log("Login::Favorite list onSuccess error");
          }
        },
        onFailure: (_streamedResponse) async {
          log("Login::Favorite list ononFailure");
        });
    return GlobalState.postsList;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 2) {
          _timer.cancel();
          var userBox = Hive.box('userIdBox');
          if(userBox.get("userID") != null)
             getFavorites(
                  context: context,
                  userId: GlobalState.userId == null
                      ? int.parse(Hive.box('userIdBox').get('userID'))
                      : GlobalState.userId);
          else
            Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => Login()),
              MaterialPageRoute(builder: (context) => Match()),
          );
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  Future<void> getAllPosts({@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBody(
        url: Constants.GET_ALL_POSTS_API,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          if (response != null) {
            log("fetch all posts succeed");
            var posts = CategoryPostsModel.fromJson(jsonDecode(response.body));
            GlobalState.postsList = posts;
            if (GlobalState.postsList.data != null) {
              log("fetch all posts Length = ${GlobalState.postsList.data.length}");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }else{
              log("Failed to fetch Posts");
              log("Try again");
              // getAllPosts(context: context);
            }
          }
        },
        onFailure: (_streamedResponse) {
          log("All Post onFailure");
          print("this is Failure result::${_streamedResponse.reasonPhrase}");
        });
  }

}
