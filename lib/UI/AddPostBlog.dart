import 'dart:convert';
import 'dart:developer';
import 'package:air_home_retaurant/ModelClasses/BloglistModel.dart';
import 'package:air_home_retaurant/ModelClasses/ReservationsModel.dart';
import 'package:air_home_retaurant/UI/AddPostBlog2.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    getBlogList(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.ADD_POST_BLOG_APPBAR_TITLE, () {
        Navigator.pop(context);
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
                              GlobalState.bloglistModel!=null
                              ?ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: GlobalState.bloglistModel.data.length,
                                itemBuilder: (context,index){
                                  return itemContainer(data:GlobalState.bloglistModel.data[index]);
                                },
                              ):Container(),
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

                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => AddPostBlog2()),
                                        );
                                      },
                                      child: Text(
                                        Constants.ADD_POST_BLOG_BUTTON1,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
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
  Future<BloglistModel> getBlogList(
      {@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    BloglistModel list;
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
      url: Constants.GET_ALL_Blog_API + "3491",);
    var response = await http.Response.fromStream(_streamedResponse);
    if (response != null) {
      log("fetch all reservations succeed");
      var blogs =
      BloglistModel.fromJson(jsonDecode(response.body));
      setState(() {
      GlobalState.bloglistModel = blogs;
      BaseClass.showSB(context: context,msg: "${GlobalState.bloglistModel.data.length}",type: Constants.SUCCESS);
      });
      list = blogs;
    }
    return list;
  }

  Widget itemContainer({@required BloglistIem data}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              child: _myWidget.dataColumn(
                  Constants.ADD_POST_BLOG_LABEL2,
                  data.titolo!=null?data.titolo:"")),
          Expanded(
              child: _myWidget.dataColumn(
                  Constants.ADD_POST_BLOG_LABEL3,
                  data.data!=null?data.data.toString():"")),
          Expanded(
              child: _myWidget.dataColumn(
                  Constants.ADD_POST_BLOG_LABEL4,
                  "N/A")),
        ],
      ),
    );
  }
}

// {"IDUser": 1,"TipoID": 1,"Titolo":"Titolo blog","Testo": "Testo blog","Sottotitolo": "Sottotitolo","IDCategoria": 1,"Video": ""}