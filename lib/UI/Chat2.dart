import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:air_home_retaurant/ModelClasses/SendMessageModal.dart';
import 'package:intl/intl.dart';
import 'package:air_home_retaurant/ModelClasses/User.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:http/http.dart' as http;
import 'package:air_home_retaurant/ModelClasses/Message.dart';
import 'package:air_home_retaurant/ModelClasses/MessageChatListModel.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';

class Chat2 extends StatefulWidget {
  final userId, userInfo;
  Chat2(this.userId, this.userInfo);

  @override
  State<StatefulWidget> createState() => _Chat2();
}

class _Chat2 extends State<Chat2> {
  MyWidget _myWidget;
  List<MessageChatListModel> chatList = [];
  List<Message> messageChatList;
  MessageData message;
  ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _progressDialog = new ProgressDialog();
    _getApiCallGetChatList(userId: GlobalState.userId.toString());
    startTimer();
  }

  var messageText = TextEditingController();
  List<MessageChatListModel> filterdchatList = [];

  Timer _timer;
  int _start = 15;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 15) {
          _timer.cancel();
          _start = 0;          
          _getApiCallGetChatList(userId: GlobalState.userId.toString());         
        } else {
            _start++;         
       
        }
      },
    );
  }


  /// 
  var userName = '', profilePic = '';
  var indexMatch = 0; 

  Widget buildSticker() {
    return EmojiPicker(
  rows: 3,
  columns: 7,
  buttonMode: ButtonMode.MATERIAL,
  recommendKeywords: ["racing", "horse"],
  numRecommended: 10,
  onEmojiSelected: (emoji, category) {
    print(emoji.emoji.codeUnits);
    messageText.text += emoji.emoji;
  },
    );
  }


   
  
  bool isShowSticker = false;

  bool isEmptyList = false;
  @override
  Widget build(BuildContext context) {
    return 
    // chatList.isEmpty
    //     ? Container(
    //         color: Colors.white,
    //         child: Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.red,
    //           ),
    //         ))
    //     :
         Scaffold(
           
            appBar: myAppBar(
                "${ widget.userInfo['name'] == null ? '': widget.userInfo['name']}",
                () {
              Navigator.pop(context);
            }),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: isEmptyList
                        ? Container()
                        : fetchMessageListView(context),
                  ),
                ),
                Container(
                  
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).requestFocus(FocusNode());

                               setState(() {
                                  isShowSticker = !isShowSticker;
                               });
  
                                print("Cliked");
                               
                              },
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset("assets/images/smile.png"),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10.0),
                                child: _myWidget.myTextInput(
                                    messageText, null, "Massaggio"),
                              ),
                            )),
                            // Send Button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  check = true;
                                  isShowSticker = false;
                                });
                                FocusScope.of(context).requestFocus(FocusNode());
                                sendMessage(
                                    text: messageText.text,
                                    sender: GlobalState.userId.toString(),
                                    receiver: widget.userId.toString(),
                                    context: context);
                                messageText.clear();
                              },
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                // color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: check == true
                                      ? Center(
                                          child: Container(
                                              height: 10,
                                              width: 10,
                                              child: CircularProgressIndicator(
                                                color: Colors.red,
                                              )))
                                      : Image.asset(
                                          "assets/images/icon_send.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      (isShowSticker ? buildSticker() : Container()),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Future<void> sendMessage(
      {@required String text,
      @required String sender,
      @required String receiver,
      @required BuildContext context}) async {
    Map<String, dynamic> _body_map = new HashMap();

    _body_map['Messaggio'] = text;
    _body_map['Mittente'] = sender;
    _body_map['Destinatario'] = receiver;

    HttpServices httpServices = new HttpServices();
    await httpServices.postJson(
        body: _body_map,
        url: Constants.SendChatMessage_API,
        onSuccess: (_streamedResponse) async {
          // filterdchatList.add(MessageChatListModel(
          //     344293482,
          //     int.parse(sender),
          //     "send",
          //     text,
          //     DateTime.now(),"",""));
          var response = await http.Response.fromStream(_streamedResponse);
          print(response);

          if (response != null) {
            var user = SendMessageModal.fromJson(jsonDecode(response.body));
            if (user.status == 200) {
              print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DATA ADDED");
              _getApiCallGetChatList(userId: GlobalState.userId.toString());
            }
          }
        },
        onFailure: (_streamedResponse) async {
          _progressDialog.dismissProgressDialog(context);
          var response = await http.Response.fromStream(_streamedResponse);

          print("This is %%%%%%%%%%%%%%%%%%%%%% ${response.body}");
        });
  }

  Widget myAppBar(String text, Function() clickListener) {
    MyWidget _myWidget = new MyWidget();
    return new AppBar(
      centerTitle: true,
      backgroundColor: Colors.red,
      leading: GestureDetector(
        onTap: clickListener,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset("assets/images/left-arrow.png"),
        )),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              image: DecorationImage(
                image: NetworkImage(
                    "${widget.userInfo['picture'] == null ? '': widget.userInfo['picture']}"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  child: _myWidget.myText(
                      text, 20, FontWeight.bold, 1, Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ScrollController controller = new ScrollController();
  Widget fetchMessageListView(BuildContext context) {
    return ListView.builder(
      itemCount: filterdchatList.length,
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, position) {
        // filterdchatList = filterdchatList.reversed;
        return listItem(filterdchatList.elementAt(position));
      },
    );
  }

  Widget listItem(MessageChatListModel filterdchatList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChatBubble(
          clipper: ChatBubbleClipper2(
              type: filterdchatList.status == 'send'
                  ? BubbleType.receiverBubble
                  : BubbleType.sendBubble),
          alignment: filterdchatList.status == 'send'
              ? Alignment.topLeft
              : Alignment.topRight,
          margin: EdgeInsets.only(top: 10),
          backGroundColor: filterdchatList.status == 'send'
              ? Color(0xffE8D4B9)
              : Color(0xffECECEC),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.60,
            ),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(filterdchatList.message)),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateFormat("d MMM kk-mm").format(filterdchatList.time),
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var check = false;

  _getApiCallGetChatList({@required String userId}) async {
    print("chatuserid:" + userId);
    String url = Constants.GETChatListOfUser_API + userId;
    print("url:" + url);
    HttpServices httpServices = new HttpServices();
     setState(() {
      isEmptyList = true;
    });
    await httpServices.getJsonWithOutBodyAsParamInUrl(
        url: url,
        onSuccess: (_streamedResponse) async {
          var response = await http.Response.fromStream(_streamedResponse);
          print("this is Success result::${response}");
          message = MessageData.fromJson(jsonDecode(response.body));
          messageChatList = message.data;
          setState(() {
            check = false;
          });
          // messageChatList = new List.from(messageChatList.reversed);
          // print("MessageChatListSize" + messageChatList.length.toString());
          // GlobalState.messageChatList=messageChatList;
          if (messageChatList != null) {
            if (messageChatList.length > 0) {
                _getFilterdChatList(messageChatList);
                _getsingleIDCommunicationList(messageChatList);
                startTimer();
              
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
            "",
            ""));
      } else {
        userIDS.add(messageChatList[i].mittente);
        chatList.add(new MessageChatListModel(
            messageChatList[i].id,
            messageChatList[i].mittente,
            "received",
            messageChatList[i].messaggio,
            messageChatList[i].data,
            "",
            ""));
      }
    userIDS = userIDS.toSet().toList();
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
    for (var j = 0; j < chatList.length; j++)
      getUserProfile(chatList.elementAt(j).userId, j);


      
  }

  _getsingleIDCommunicationList(List<Message> messageChatList) {
    filterdchatList = [];
    for (var i = 0; i < messageChatList.length; i++)
      if (messageChatList.elementAt(i).mittente == GlobalState.userId &&
          messageChatList.elementAt(i).destinatario == widget.userId) {
    
        filterdchatList.add(MessageChatListModel(
            messageChatList[i].id,
            messageChatList[i].destinatario,
            "send",
            messageChatList[i].messaggio,
            messageChatList[i].data,
            "",
            ""));
      } else if (messageChatList.elementAt(i).destinatario ==
              GlobalState.userId &&
          messageChatList.elementAt(i).mittente == widget.userId) {
        userIDS.add(messageChatList[i].mittente);
        filterdchatList.add(new MessageChatListModel(
            messageChatList[i].id,
            messageChatList[i].mittente,
            "received",
            messageChatList[i].messaggio,
            messageChatList[i].data,
            "",
            ""));
      }
    filterdchatList = new List.from(filterdchatList.reversed);


    setState(() {
      isEmptyList = false;
    });
  }

  Future<MyUser> getUserProfile(int id, int index) async {
    HttpServices httpServices = new HttpServices();
    var res1 = await httpServices.getFutureJsonWithBody(
        url: Constants.USER_API + id.toString());
    var response1 = await http.Response.fromStream(res1);
    var resDec1 = jsonDecode(response1.body);
    resDec1['data'] = resDec1['data'];
    MyUser list;
    var response = resDec1;
    if (response1.statusCode == 200) {
      var responseList = MyUser.fromJson(response);
      if (responseList != null) {        
          chatList.elementAt(index).userName = responseList.data.nome;
          chatList.elementAt(index).profilePicture = responseList.data.urlFoto;
        
        print("asdfghjkl${chatList.elementAt(index).userName}");
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
}
