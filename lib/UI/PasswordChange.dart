import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PasswordChange();
}

class _PasswordChange extends State<PasswordChange> {
  MyWidget _myWidget;
  TextEditingController addCookingClassEvent3Controller,
      addCookingClassEvent3Controller2,
      addCookingClassEvent3Controller3;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    addCookingClassEvent3Controller = new TextEditingController();
    addCookingClassEvent3Controller2 = new TextEditingController();
    addCookingClassEvent3Controller3 = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.PASSWORD_CHANGE_TITLE, () {
        // Navigator.pop(context);
      }),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: _myWidget.myTextInput(
                        addCookingClassEvent3Controller,
                        1,
                        Constants.PASSWORD_CHANGE_TEXT_FIELD1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: _myWidget.myTextInput(
                        addCookingClassEvent3Controller,
                        1,
                        Constants.PASSWORD_CHANGE_TEXT_FIELD2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: _myWidget.myTextInput(
                        addCookingClassEvent3Controller,
                        1,
                        Constants.PASSWORD_CHANGE_TEXT_FIELD3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        Constants.PASSWORD_CHANGE_BUTTON_MAIN,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
