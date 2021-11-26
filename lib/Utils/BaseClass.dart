import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';
class BaseClass{
  //Validate Email
  static bool isEmailValid(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }
  static void showSB({String msg,BuildContext context,String type}){
    switch(type){
      case Constants.SUCCESS:
        final bar = SnackBar(content: Text(msg),backgroundColor: Colors.green,);
        bar.show(context);
        break;
      case Constants.ERROR:
        final bar = SnackBar(content: Text(msg),backgroundColor: Colors.black87,);
        bar.show(context);
        break;
      case Constants.FAILURE:
        final bar = SnackBar(content: Text(msg),backgroundColor: Colors.red,);
        bar.show(context);
        break;
      case Constants.WARNING:
        final bar = SnackBar(content: Text(msg),backgroundColor: Colors.yellow,);
        bar.show(context);
        break;
      default:
        final bar = SnackBar(content: Text(msg),backgroundColor: Colors.black12,);
        bar.show(context);
        break;
    }
  }
}

bool toggle = false;
bool userExpire = false;