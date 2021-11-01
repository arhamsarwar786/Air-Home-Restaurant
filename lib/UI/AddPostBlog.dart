import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostBlog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPostBlog();
}

class _AddPostBlog extends State<AddPostBlog> {
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
      appBar: _myWidget.myAppBar(Constants.ADD_POST_BLOG_APPBAR_TITLE, () {
        // Navigator.pop(context);
      }),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _myWidget.myText(
                                Constants.ADD_POST_BLOG_INFO,
                                12,
                                FontWeight.bold,
                                null,
                                Colors.black)),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: _myWidget.myText(
                                          Constants.ADD_POST_BLOG_LABEL1,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          Constants.ADD_POST_BLOG_LABEL2,
                                          "Post title")),
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          Constants.ADD_POST_BLOG_LABEL3,
                                          "30/04/2021")),
                                  Expanded(
                                      child: _myWidget.dataColumn(
                                          Constants.ADD_POST_BLOG_LABEL4,
                                          "15")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 30.0,
                            width: 100.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF7878),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      Constants.ADD_POST_BLOG_BUTTON1,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
