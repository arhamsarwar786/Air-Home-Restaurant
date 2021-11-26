import 'dart:convert';
import 'dart:developer';

import 'package:air_home_retaurant/ModelClasses/MatchListResponseModel.dart';
import 'package:air_home_retaurant/UI/Match2.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Match extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Match();
}

class _Match extends State<Match> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    getMatchList(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.MATCH_APPBAR_TITLE, () {
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
                            child: _myWidget.myText(Constants.MATCH_INFO, 12,
                                FontWeight.bold, null, Colors.black)),
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
                                          Constants.MATCH_LABEL1,
                                          12,
                                          FontWeight.bold,
                                          1,
                                          Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              GlobalState.matchListResponseModel == null
                                  ? CircularProgressIndicator(color: Colors.red,)
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          // physics: NeverScrollableScrollPhysics(),
                                          itemCount: GlobalState
                                              .matchListResponseModel
                                              .data
                                              .length,
                                          itemBuilder: (context, index) {
                                            var list = GlobalState
                                                .matchListResponseModel.data;
                                            return matchlist(list[index]);
                                          }),
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
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Match2();
                                }));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF7878),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      Constants.MATCH_BUTTON1,
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

  Future<MatchListResponseModel> getMatchList(
      {@required BuildContext context}) async {
    HttpServices httpServices = new HttpServices();
    MatchListResponseModel list;
    var _streamedResponse = await httpServices.getFutureJsonWithBody(
      url: Constants.GET_ALL_Match_API,
    );
    var response = await http.Response.fromStream(_streamedResponse);
    print(response.body);
    if (response != null) {
      log("fetch all reservations succeed");
      var match = MatchListResponseModel.fromJson(jsonDecode(response.body));
        GlobalState.matchListResponseModel = match;
        // BaseClass.showSB(
        //     context: context,
        //     msg: "${GlobalState.bloglistModel.data.length}",
        //     type: Constants.SUCCESS);
      setState(() {
      list = match;
      });
    }
    return list;
  }

  matchlist(list) {
    return Row(
      children: [
        Expanded(
            child: _myWidget.dataColumn(Constants.MATCH_LABEL2, list.titolo)),
        Expanded(
            child: _myWidget.dataColumn(
                Constants.MATCH_LABEL4, "${list.categoria}")),
        Expanded(
            child: _myWidget.dataColumn(Constants.MATCH_LABEL5, list.citta)),
      ],
    );
  }
}

