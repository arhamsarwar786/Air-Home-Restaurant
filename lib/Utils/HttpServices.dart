import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'BaseClass.dart';
import 'constants.dart';

class HttpServices{


  //TODO:Post Json with Body
  Future<void> postJson({@required Map<String, dynamic> body,@required String url,
    @required  ValueChanged<StreamedResponse> onSuccess,
    @required  ValueChanged<StreamedResponse> onFailure
  }) async {
    var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(url));
  request.body = jsonEncode(body);
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    onSuccess(response);
    // print(await response.stream.bytesToString());
  }
  else {
    onFailure(response);
      
    // print("this is the Response Arham Get : ${}");
   
  }
  }

//TODO:Get JSon With Body   //get all api etc news post etc
  Future<void> getJsonWithBody({@required Map<String, dynamic> body,@required String url,
    @required  ValueChanged<StreamedResponse> onSuccess,
    @required  ValueChanged<StreamedResponse> onFailure
  }) async {

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(url));
    request.body = jsonEncode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("getJsonWithBody = ${response.reasonPhrase}");
      onSuccess(response);
    }
    else {
      log("getJsonWithBody = ${response.reasonPhrase}");
      onFailure(response);
    }

  }

  //TODO:Get JSon With Out Body   //get all api etc news post etc
  Future<void> getJsonWithOutBody({@required String url,
    @required  ValueChanged<StreamedResponse> onSuccess,
    @required  ValueChanged<StreamedResponse> onFailure
  }) async {

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      onSuccess(response);
    }
    else {
      print(response.reasonPhrase);
      onFailure(response);
    }

  }


  //TODO:Get JSoN with Out Body as ParamInUrl   //Get Pofile Api
  Future<void> getJsonWithOutBodyAsParamInUrl({@required String url,
    @required  ValueChanged<StreamedResponse> onSuccess,
    @required  ValueChanged<StreamedResponse> onFailure

  }) async {
    var request = http.Request('GET', Uri.parse(url));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      onSuccess(response);
    }
    else {
      onFailure(response);
    }
  }


  //TODO:Get JSon With Body   //get all api etc news post etc
  Future<StreamedResponse> getFutureJsonWithBody({@required String url,
  }) async {

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    // request.url.queryParameters.addAll(body);
    return await request.send();
  }

}