import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/FavoriteModel.dart';
import 'package:air_home_retaurant/ModelClasses/registerResponce.dart';
import 'package:air_home_retaurant/UI/Login.dart';
import 'package:air_home_retaurant/Utils/APIServies.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:http/http.dart" as http;

import 'MainScreen.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  MyWidget _myWidget;
  bool first;
  TextEditingController _firstNameController,
      _lastNameController,
      _emailController,
      _passwordController;
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
    first = false;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _progressDialog = ProgressDialog();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
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
                    Center(
                      child: Column(
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
                                  _myWidget.myText(Constants.SIGNUP_LABEL1, 15,
                                      FontWeight.bold, 1, Colors.red),
                                  TextField(
                                    autofocus: false,
                                    controller: _firstNameController,
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
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
                                  _myWidget.myText(Constants.SIGNUP_LABEL2, 15,
                                      FontWeight.bold, 1, Colors.red),
                                  TextField(
                                    autofocus: false,
                                    controller: _lastNameController,
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
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
                                  _myWidget.myText(Constants.SIGNUP_LABEL3, 15,
                                      FontWeight.bold, 1, Colors.red),
                                  TextField(
                                    autofocus: false,
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
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
                                  _myWidget.myText(Constants.SIGNUP_LABEL4, 15,
                                      FontWeight.bold, 1, Colors.red),
                                  TextField(
                                    obscureText: true,
                                    autofocus: false,
                                    controller: _passwordController,
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 40.0,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Checkbox(
                                        value: first,
                                        activeColor: Colors.red,
                                        onChanged: (bool value) {
                                          setState(() {
                                            first = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        Constants.SIGNUP_LABEL5,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());

                              bool status = true;
                              if (_firstNameController.text.isEmpty) {
                                //Show Toast First Name Blank
                                BaseClass.showSB(
                                    msg: Constants.FNAME_EMPTY_STRING_ERROR,
                                    context: context,
                                    type: Constants.FAILURE);
                                status = false;

                                return;
                              }
                              if (_lastNameController.text.isEmpty) {
                                //Show Toast LAst Name Blank
                                BaseClass.showSB(
                                    msg: Constants.LNAME_EMPTY_STRING_ERROR,
                                    context: context,
                                    type: Constants.FAILURE);
                                status = false;
                                return;
                              }
                              if (_emailController.text.isEmpty) {
                                //Show Toast  Email Blank
                                BaseClass.showSB(
                                    msg: Constants.EMAIL_EMPTY_STRING_ERROR,
                                    context: context,
                                    type: Constants.FAILURE);
                                status = false;
                                return;
                              }
                              if (_passwordController.text.isEmpty) {
                                //Show Toast  Password Blank
                                BaseClass.showSB(
                                    msg: Constants.PASSWORD_EMPTY_STRING_ERROR,
                                    context: context,
                                    type: Constants.FAILURE);
                                status = false;
                                return;
                              }
                              if (!first) {
                                //Show Makr the CheckBox
                                BaseClass.showSB(
                                    msg: Constants.MARK_TERM_CHECK_STRING,
                                    context: context,
                                    type: Constants.FAILURE);
                                status = false;
                                return;
                              }
                              if (status) {
                                if (BaseClass.isEmailValid(
                                    _emailController.text)) {
                                  //here Need To Call SignUp Api
                                  callSignUpApi(
                                      fnam: _firstNameController.text,
                                      lname: _lastNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      context: context);
                                } else {
                                  BaseClass.showSB(
                                      msg: Constants.NOT_VALID_EMAIL_STRING,
                                      context: context,
                                      type: Constants.FAILURE);
                                  //Show Toast Email is Not Valid
                                  return;
                                }
                              } else {
                                //Show Toas Filed Empty
                                // print("FieldsAreEmpty");
                                // return;
                                return;
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
                                      "SignUP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: _myWidget.myText(Constants.SIGNUP_LABEL6,
                                    15, FontWeight.bold, 1, Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Future<void> callGetVendorApi() async {
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBody(
        url: "https://airhomerestaurant.com/api/v1/news",
        onSuccess: (_streamedResponse) async {
          print(
              "this is Success result::${await _streamedResponse.stream.bytesToString()}");
        },
        onFailure: (_streamedResponse) {
          print("this is Failure result::${_streamedResponse.reasonPhrase}");
        });
  }

  Future<void> callSignUpApi(
      {@required String fnam,
      @required String lname,
      @required String email,
      @required String password,
      @required BuildContext context}) async {
    /*   {
        "email": "khuwajahassan15@gmail.com",
        "nome": "Hassan",
        "cognome": "khuwaja",
        "password": "abc123",
        "social": "W",
        "referrer": ""
    }*/

    _progressDialog.showProgressDialog(context,
        textToBeDisplayed: Constants.PLEASE_WAIT);
    Map<String, dynamic> _body_map = new HashMap();
    _body_map['email'] = email;
    _body_map['nome'] = fnam;
    _body_map['cognome'] = lname;
    _body_map['password'] = password;
    _body_map['social'] = "W";
    _body_map['referrer'] = "";

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: _body_map,
        url: Constants.SIGNUP_API,
        onSuccess: (_streamedResponse) async {
                _progressDialog.dismissProgressDialog(context);
                var response = await http.Response.fromStream(_streamedResponse);
                var user = RegisterResponce.fromJson(jsonDecode(response.body));
                GlobalState.userId = int.parse(user.data);
                if(GlobalState.userId!=null){
                  getFavorites(context: context, userId: GlobalState.userId);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Unable to fetch data retry"),
                    duration: Duration(milliseconds: 300),
                  ));
                }
                },
        onFailure: (_streamedResponse) async{
          _progressDialog.dismissProgressDialog(context);
           var response = await http.Response.fromStream(_streamedResponse);
          var user = RegisterResponce.fromJson(jsonDecode(response.body));
          print(user.message);
          BaseClass.showSB(
              msg: user.message,
              context: context,
              type: Constants.FAILURE);
          print("this is Failure result::${_streamedResponse.reasonPhrase}");
        });
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
              var responseList =
                  FavoriteModel.fromJson(jsonDecode(response.body));
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
          log("Login::Favorite list onFailure");
        });
    return GlobalState.postsList;
  }
}
