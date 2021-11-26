import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
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


  

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 2) {
          _timer.cancel();
          toggle = true;
          var userBox = Hive.box('userIdBox');
          if(userBox.get("userID") != null){           
               Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
          }        
          else
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

}
