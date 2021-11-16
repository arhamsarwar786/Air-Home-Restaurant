import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:air_home_retaurant/ModelClasses/Message.dart';
import 'package:air_home_retaurant/ModelClasses/MessageChatListModel.dart';
import 'package:air_home_retaurant/ModelClasses/MessageRooms.dart';
import 'package:air_home_retaurant/ModelClasses/VendorsModal.dart';
import 'package:air_home_retaurant/UI/Chat2.dart';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MySharedPreferences.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/collection.dart' show listEquals;
import 'package:quiver/core.dart' show hashObjects;

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Chat> {
  MyWidget _myWidget;
  ProgressDialog _progressDialog;

  MessageData message;
  List<Message> messageChatList;
  List<MessageRooms> messageChatRoomsList;
  List<int> messageRoomId;
  List<Message> SingleIDFilterdList = [];
  List<MessageChatListModel> sendmesgesList = [];
  List<Message> receivemesgesList = [];
  List<MessageChatListModel> chatList = [];
  List<MessageChatListModel> filterdchatList = [];
  int i;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _progressDialog = new ProgressDialog();
    getVendorsData();
    messageChatList = new List();
    messageChatRoomsList = new List();
    messageRoomId = new List();
    // getChatHistory(context);
    _getApiCallGetChatList(userId: GlobalState.userId.toString());
    i = 0;
  }

List fetchVendor = [];



  
  Future<VendorsModal> getVendorsData() async {
    HttpServices httpServices = new HttpServices();
    var res1 =
        await httpServices.getFutureJsonWithBody(url: Constants.VENDOR);
    var response1 = await http.Response.fromStream(res1);
    var resDec1 = jsonDecode(response1.body);
    print(resDec1);
    resDec1['data'] = resDec1['data'];
    VendorsModal list;
    var response = resDec1;
    if (response1.statusCode == 200) {
      var responseList = VendorsModal.fromJson(response);
      if (responseList != null) {
        GlobalState.vendorsAllModal = responseList;
        return list = responseList;
      } else {
        list = null;
      }
    } else {
      log("API STATUS CODE = ${response.statusCode}");
      list = null;
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(GlobalState.vendorsAllModal.data);
      },),
      appBar: _myWidget.myAppBar(Constants.CHAT_TITLE, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF5F5F5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: fetchMessageListView(context),
        ),
      ),
    );
  }

  Widget listItem(MessageChatListModel chatList) {
    MyWidget _myWidget = new MyWidget();
    return GestureDetector(
      onTap: () {
        // GlobalState.currentSelectedMessageRoom = position;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Chat2(filterdchatList)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          color: Color(0xFFE8E8E8),
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFDBDADA),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:chatList.profilePicture == null? Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(40.0),
                           
                          ),
                        ): Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(40.0),
                            image: DecorationImage(
                              image: NetworkImage(chatList.profilePicture),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _myWidget.myText(
                                  chatList.userName,
                                     
                                  12,
                                  FontWeight.bold,
                                  1,
                                  Colors.black),
                              Text(chatList.message,
                              style:TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black38,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF7878),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset("assets/images/chat.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void getChatHistory(BuildContext context) {
  //   String userId = "0";
  //   _progressDialog.showProgressDialog(context,
  //       textToBeDisplayed: Constants.PLEASE_WAIT);
  //   MySharedPreferences.instance
  //       .getStringValue(Constants.USER_ID)
  //       .then((value) => _getApiCallGetChatList(userId: value));
  // }

  _getApiCallGetChatList({@required String userId}) async {
    print("chatuserid:" + userId);
    String url = Constants.GETChatListOfUser_API + userId;
    print("url:" + url);
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBodyAsParamInUrl(
        url: url,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print("this is Success result::${response}");
          message = MessageData.fromJson(jsonDecode(response.body));
          messageChatList = message.data;
          // messageChatList = new List.from(messageChatList.reversed);
          // print("MessageChatListSize" + messageChatList.length.toString());
          // GlobalState.messageChatList=messageChatList;
          if (messageChatList != null) {
            if (messageChatList.length > 0) {
              setState(() {
                _getFilterdChatList(messageChatList);
                // _getsingleIDCommunicationList(messageChatList);

                i = i + 1;
              });
           
              messageChatRoomsList = messageChatRoomsList.toSet().toList();
              List<MessageRooms> tempList = new List();
              tempList = messageChatRoomsList;
              final Map<String, MessageRooms> map = new Map();
              tempList.forEach((item) {
                map[item.roomId] = item;
              });
              tempList = map.values.toList();
              messageChatRoomsList.clear();
              messageChatRoomsList = tempList;
              GlobalState.messageChatRoomsList = messageChatRoomsList;
              print("OldmessageChatRoomsList Length " +
                  messageChatRoomsList.length.toString());
              print("NewmessageChatRoomsList Length " +
                  tempList.length.toString());
            } else {
              print(
                  "MessageChatList Size " + messageChatList.length.toString());
            }
          } else {
            print("MessageChatList Is Null");
          }
          _progressDialog.dismissProgressDialog(context);
        },
        onFailure: (_streamedResponse) {
          _progressDialog.dismissProgressDialog(context);
          print("this is Failure result::${_streamedResponse.reasonPhrase}");
        });
  }

  Widget fetchMessageListView(BuildContext context) {
    
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, position) {
        return listItem(chatList.elementAt(position));
      },
    );
  }

  List userIDS = [];

  _getFilterdChatList(List<Message> messageChatList) {
    for (var i = 0; i < messageChatList.length; i++)
      if (messageChatList.elementAt(i).mittente == GlobalState.userId) {
        userIDS.add(messageChatList[i].destinatario);
        chatList.add(new MessageChatListModel(
            messageChatList[i].id,
            messageChatList[i].destinatario,
            "send",
            messageChatList[i].messaggio,
            messageChatList[i].data,
            "",""
            
            
            ));
      } else {
        userIDS.add(messageChatList[i].mittente);
        chatList.add(new MessageChatListModel(
            messageChatList[i].id,
            messageChatList[i].mittente,
            "received",
            messageChatList[i].messaggio,
            messageChatList[i].data,"",""));
      }
    // print("uikzjx kdjsk${chatList.toSet().toList()}");
    userIDS = userIDS.toSet().toList();
    for (int i = 0; i < chatList.length; i++)
      print(
          "yuhgkjhgkhgoygogljbljgpug ORIGNAL${chatList.elementAt(i).time}  sgknld,${chatList.elementAt(i).userId}");
    List<MessageChatListModel> reversedList = new List.from(chatList.reversed);
    chatList = reversedList;
    for (int i = 0; i < chatList.length; i++)
      for (int j = i + 1; j < chatList.length; j++)
        //If any two elements are found equal
        if (chatList[i].userId == chatList[j].userId &&
            chatList.elementAt(i).time.isAfter(chatList.elementAt(j).time)) {
          //Replace duplicate element with last unique element

          chatList[j] = chatList[chatList.length - 1];

          chatList.length--;

          j--;
        }
    for (int i = 0; i < chatList.length; i++)
      print(
          "yuhgkjhgkhgoygogljbljgpug${chatList.elementAt(i).time} sgknld,${chatList.elementAt(i).userId}");



  for (var i = 0; i < GlobalState.vendorsAllModal.data.length; i++)
    for (var j = 0; j < chatList.length; j++)
      if(GlobalState.vendorsAllModal.data.elementAt(i).id == chatList.elementAt(j).userId){
       
        chatList.elementAt(j).userName = GlobalState.vendorsAllModal.data.elementAt(i).nome;
        chatList.elementAt(j).profilePicture = GlobalState.vendorsAllModal.data.elementAt(i).urlFoto;
    print("%%%%%%%%%%%%%%%%%% Matched ${GlobalState.vendorsAllModal.data.elementAt(i).id == chatList.elementAt(j).userId}");

      }else{
        print(GlobalState.vendorsAllModal.data.elementAt(i).id == chatList.elementAt(j).userId);

      }
       print("Arham Get${chatList.elementAt(0).userName}");
      setState(() {
        
      });





    print("luqman filtrdchatlist${filterdchatList.length}");
   

    print("luqman sendr${sendmesgesList}");
    print("luqman receiver${receivemesgesList}");
  }

  // _getsingleIDCommunicationList( List<Message> messageChatList) {
  //   filterdchatList=[];
  //   for (var i = 0; i < messageChatList.length; i++)
  //     if (messageChatList.elementAt(i).mittente == GlobalState.userId && messageChatList.elementAt(i).destinatario==3728 ) {
  //       filterdchatList.add( MessageChatListModel(
  //           messageChatList[i].id,
  //           messageChatList[i].destinatario,
  //           "send",
  //           messageChatList[i].messaggio,
  //           messageChatList[i].data,"","" ));
  //     } else if(messageChatList.elementAt(i).destinatario == GlobalState.userId && messageChatList.elementAt(i).mittente==3728){
  //       userIDS.add(messageChatList[i].mittente);
  //       filterdchatList.add(new MessageChatListModel(
  //           messageChatList[i].id,
  //           messageChatList[i].mittente,
  //           "received",
  //           messageChatList[i].messaggio,
  //           messageChatList[i].data,"",""));
  //     }
  //   filterdchatList = new List.from(filterdchatList.reversed);

  //   for (int i = 0; i < filterdchatList.length; i++)
  //     print(
  //         "google cdkncsknwe${filterdchatList.elementAt(i).time} sgknld,${filterdchatList.elementAt(i).userId}");


  // }


}