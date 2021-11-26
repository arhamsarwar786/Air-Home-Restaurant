import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:air_home_retaurant/ModelClasses/loginModel.dart';
import 'package:air_home_retaurant/ModelClasses/registerResponce.dart';
import 'package:hive/hive.dart';
import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/FavoriteModel.dart';
import 'package:air_home_retaurant/ModelClasses/FbUser.dart';
import 'package:air_home_retaurant/UI/HomeRestaurant3.dart';
import 'package:air_home_retaurant/UI/MainScreen.dart';
import 'package:air_home_retaurant/UI/SignUp.dart';
import 'package:air_home_retaurant/Utils/APIServies.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MySharedPreferences.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  MyWidget _myWidget;
  TextEditingController _emailController, _passwordController;
  ProgressDialog _progressDialog;

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
  void initState() {
    super.initState();

    _myWidget = new MyWidget();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _progressDialog = ProgressDialog();

    // var user = FirebaseAuth.instance.currentUser;
    // if(user!=null){
    //   Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeRestaurant()));
    // }
  }

// POPUP SHOW 

 void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {        
        return Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
          margin: EdgeInsets.only(left: 0.0,right: 0.0),
          child: Stack(
              children: [
              Container(
                  padding: EdgeInsets.only(
                  top: 10.0,
                  ),
                  margin: EdgeInsets.only(top: 13.0,right: 18.0,left: 18.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                      ),
                      ]),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                      SizedBox(
                      height: 20.0,
                      ),
                      Center(
                          child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text("USER EXPIRED", style:TextStyle(fontSize: 30.0,color: Colors.white)),
                          )//
                      ),
                      
                      Center(
                          child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Text("User May Deleted or Expired", style:TextStyle(fontSize: 13.0,color: Colors.white)),
                          )//
                      ),
                    
                  ],
                  ),
              ),
              Positioned(
                  right: 10.0,
                  child: GestureDetector(
                  onTap: (){
                      Navigator.of(context).pop();
                  },
                  child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.red),
                      ),
                  ),
                  ),
              ),
              ],
          ),
          ),
        ); },
    );
  }
  @override
  Widget build(BuildContext context) {
    if (userExpire == true) {
      Future.delayed(Duration.zero, () => _showDialog());
      userExpire = false;
    }
    return  WillPopScope(
      onWillPop: _onWillPop,
      child:  Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: (){
        //   print(GlobalState.userId);
        // },),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              0.0,
            ), // here the desired height
            child: AppBar(
              backgroundColor: Color(0xFFE5E5E5),
            )),
        body: SingleChildScrollView(
          child: Container(
              color: Color(0xFFE2E2E2),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFE2E2E2),
                          Colors.redAccent,
                        ],
                      )),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Image.asset("assets/images/main_logo.png"),
                        ),
                      ),
                      // Email
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _myWidget.myText(
                                  "Email", 15, FontWeight.bold, 1, Colors.red),
                              TextField(
                                autofocus: false,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _myWidget.myText("Password", 15, FontWeight.bold,
                                  1, Colors.red),
                              TextField(
                                obscureText: true,
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Login Ano
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          bool status = true;
                          if (_emailController.text.isEmpty) {
                            BaseClass.showSB(
                                msg: Constants.EMAIL_EMPTY_STRING_ERROR,
                                context: context,
                                type: Constants.FAILURE);
                            status = false;
                          }
                          else if (_passwordController.text.isEmpty) {
                            BaseClass.showSB(
                                msg: Constants.PASSWORD_EMPTY_STRING_ERROR,
                                context: context,
                                type: Constants.FAILURE);
                            status = false;
                          }
                          if (status) {
                            if (BaseClass.isEmailValid(_emailController.text)) {
                              print("Email = ${_emailController.text}");
                              print("Password = ${_passwordController.text}");
                              callLoginApi(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  context: context);
                            } else {
                              BaseClass.showSB(
                                  msg: Constants.NOT_VALID_EMAIL_STRING,
                                  context: context,
                                  type: Constants.FAILURE);
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ),
                      // SignIn with Apple
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(2.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                          "assets/images/apple_icon.png"),
                                    ),
                                  ),
                                  Text(
                                    "SignIn With Apple",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      // SignIn with FaceBook
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _fbLogin(context: context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Color(0XFF3b5998),
                                  borderRadius: BorderRadius.circular(2.0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                            "assets/images/facebook_icon.png"),
                                      ),
                                    ),
                                    Text(
                                      "SignIn With Facebook",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      // SignIn with Google
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _googleSignIn(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2.0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                            "assets/images/google_icon.png"),
                                      ),
                                    ),
                                    Text(
                                      "SignIn With Google",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => SignUp()),
                              // );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: _myWidget.myText(
                                "Don't you have an Account? SIGN UP",
                                15,
                                FontWeight.bold,
                                1,
                                Colors.black),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _myWidget.myText("Forgot Password?", 15,
                                FontWeight.bold, 1, Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future<void> callLoginApi(
      {@required String email,
      @required String password,
      @required BuildContext context}) async {
    _progressDialog.showProgressDialog(context);
    Map<String, dynamic> _body_map = new HashMap();
    _body_map['email'] = email;
    _body_map['password'] = password;

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: _body_map,
        url: Constants.LOGIN_API,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print(response);
          print("this is in Login Success ${response.body}");
            
          if (response != null) {

            var user = LogInResponce.fromJson(jsonDecode(response.body));
            GlobalState.userId = int.parse(user.data);
            if (Hive.box("userIdBox").get("userID") == null ||
                Hive.box("userIdBox").get("userID") == '') {
              Hive.box('userIdBox').put("userID", "${user.data}");
            }
            if (response == "0") {
              //email Or Password wrong
              _progressDialog.dismissProgressDialog(context);
              BaseClass.showSB(
                  msg: Constants.LOGIN_INFO_ERROR,
                  context: context,
                  type: Constants.FAILURE);
            } else {
              _progressDialog.dismissProgressDialog(context);
               BaseClass.showSB(
              msg: Constants.SUCCESSFULLY_LOGGIN,
              context: context,
              type: Constants.SUCCESS);
              toggle = true;
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
              // getFavorites(
              //     context: context,
              //     userId: GlobalState.userId == null
              //         ? int.parse(Hive.box('userIdBox').get('userID'))
              //         : GlobalState.userId);
            }
          } else {
            //empty response
            _progressDialog.dismissProgressDialog(context);
          }
        },
        onFailure: (_streamedResponse) async{
          _progressDialog.dismissProgressDialog(context);
          var response = await http.Response.fromStream(_streamedResponse);
          var user = LogInResponce.fromJson(jsonDecode(response.body));
          print("This is %%%%%%%%%%%%%%%%%%%%%% ${response.body}");
          BaseClass.showSB(
              msg: user.message,
              context: context,
              type: Constants.FAILURE);
          print("Login::login onFailure");

          print("this is in OnFailure" + _streamedResponse.reasonPhrase);
        });
  }

  ///facebook signup

  ///google signup
  Future<void> _googleSignIn(BuildContext context) async {
    _progressDialog.showProgressDialog(context);

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await _auth.signInWithCredential(authCredential);
      print(googleSignInAuthentication.accessToken);
      print(googleSignInAuthentication.idToken);
      print(result.user);
      if (result != null) {
        _progressDialog.dismissProgressDialog(context);
        User user = result.user;

        GlobalState.firebaseUser = user;
        GlobalState.googleSignIn = googleSignIn;

        print("${GlobalState.firebaseUser.uid}");
        print("${GlobalState.firebaseUser.photoURL}");
        print("${GlobalState.firebaseUser.displayName}");
        print("${GlobalState.firebaseUser.email}");
        callSignUpApi(
            fnam: GlobalState.firebaseUser.displayName,
            lname: "",
            email: GlobalState.firebaseUser.email,
            password: GlobalState.firebaseUser.uid,
            social: "G",
            context: context);
      } else {
        _progressDialog.dismissProgressDialog(context);
        print("User is null");
      }
    }
  }

  ///google signOut
  Future<void> _signOut() async {
    googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> callSignUpApi(
      {@required String fnam,
      @required String lname,
      @required String email,
      @required String password,
      @required String social,
      @required BuildContext context}) async {
    /*   {
        "email": "khuwajahassan15@gmail.com",
        "nome": "Hassan",
        "cognome": "khuwaja",
        "password": "abc123",
        "social": "W",
        "referrer": ""
    }*/
    _progressDialog.showProgressDialog(context);
    Map<String, dynamic> _body_map = new HashMap();
    _body_map['email'] = email;
    _body_map['nome'] = fnam;
    _body_map['cognome'] = lname;
    _body_map['password'] = password;
    _body_map['social'] = social;
    _body_map['referrer'] = "";

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: _body_map,
        url: Constants.SIGNUP_API,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          if (response != null) {
            var user = RegisterResponce.fromJson(jsonDecode(response.body));
            GlobalState.userId = int.parse(user.data);
            if (response != null) {
              if (response == "0") {
                _progressDialog.dismissProgressDialog(context);
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
                // getFavorites(
                //     context: context,
                //     userId: GlobalState.userId == null
                //         ? int.parse(Hive.box('userIdBox').get('userID'))
                //         : GlobalState.userId);
              }
            } else {
              _progressDialog.dismissProgressDialog(context);
              //empty response
            }
          } else {
            _progressDialog.dismissProgressDialog(context);
            //null response
          }
        },
        onFailure: (_streamedResponse) {
          // here FB Already Member Login
          // if (_streamedResponse.statusCode == 100) {
          callLoginApi(email: email, password: password, context: context);
          print("this is in SignUp Failure $email $password");
          // }
          _progressDialog.dismissProgressDialog(context);
          print(
              "this is Failure result in SignUp ::${_streamedResponse.reasonPhrase}");
        });
  }

  Future<CategoryPostsModel> getFavorites(
    {
    @required BuildContext context,
    @required int userId,
  }) async 
  {
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

  Future<void> _fbLogin({@required BuildContext context}) async {
    // Trigger the sign-in flow
    var loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    // if(loginResult != null ){

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken.token);

    print(
      "TOKEN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ${loginResult.accessToken.token}");
    // // Once signed in, return the UserCredential
    UserCredential result = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    print("Before %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ${result.user}");
      if (result != null) {
      print("After %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ${result.user}");

      User user = result.user;
      GlobalState.firebaseUser = user;
      print("this is fb data  :   ${GlobalState.firebaseUser}");
      callSignUpApi(
          fnam: GlobalState.firebaseUser.displayName,
          lname: "",
          email: GlobalState.firebaseUser.email,
          password: GlobalState.firebaseUser.uid,
          social: "F",
          context: context);
    } else {
      print("User is null");
    }
    }
  
  // }
}
