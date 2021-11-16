import 'dart:convert';
import 'dart:developer';

import 'package:air_home_retaurant/ModelClasses/ReviewModal.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyReviews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyReviews();
}

class _MyReviews extends State<MyReviews> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    // fetchReviews();
  }
   Future<ReviewModal> fetchReviews()async{
      ReviewModal list;
      HttpServices httpServices = HttpServices();
     await httpServices.getJsonWithOutBody(url: Constants.GET_USER_REVIEW+'1018', onSuccess: (StreamedResponse _streamedResponse)  async { 
          var response = await http.Response.fromStream(_streamedResponse);
          print("On ${response.body}");

           if (response.statusCode == 200) {
          var reviewsList = ReviewModal.fromJson(jsonDecode(response.body));
             print("Enter Into ${reviewsList.data}");

      if (reviewsList != null) {    
        GlobalState.myReview = reviewsList;            
        log("response list length = ${reviewsList.data.length}");
        list = reviewsList;
      } 
    } else {
      // log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
        
    },   onFailure: (_streamedResponse) {
          print(
              "Home Screen get Category onFailure::${_streamedResponse.reasonPhrase}");
          list = null;
        });
        
        return list;
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        fetchReviews();
      },),
      appBar: _myWidget.myAppBar(Constants.MY_REVIEWS_TITLE, () {
        Navigator.pop(context);
      }),
      body: FutureBuilder(
        future: fetchReviews(),
        builder: (context,snapshot) {
          print("This is The DATA I Found ^^^^^^^^^^^^^^^^^^ ${snapshot.data}");
          if(snapshot.hasData){
            var reviews = snapshot.data as ReviewModal;

        
          return 
          ListView(
            children: [
              Container(
                color: Color(0xFFF5F5F5),
                child: ListView.builder(
                  itemCount: reviews.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return listItem(reviews,position);
                  },
                ),
              ),
              Container(
                height: 80.0,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: _myWidget.myText(Constants.MY_REVIEWS_TEXT1, 20.0,
                      FontWeight.bold, null, Colors.black38),
                ),
              ),
            ],
          );
        }  
        
                            if (snapshot == null) {
                                  return Center(
                                    child: Text("Corsi si cusina Post list Null"),
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
                                          child: CircularProgressIndicator(color: Colors.red,)),
                                    ],
                                  ));
                                }
        }),
    );
  }
}

Widget listItem(ReviewModal reviews,int position) {
  MyWidget _myWidget = new MyWidget();
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(40.0)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _myWidget.myText(reviews.data.elementAt(position).mittenteNome, 12, FontWeight.bold,
                            1, Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                child: _myWidget.myText("05/04/2021", 10,
                                    FontWeight.bold, 1, Colors.black),
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: 80.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "4.0 *",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
