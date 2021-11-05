import 'package:air_home_retaurant/ModelClasses/Message.dart';
import 'package:air_home_retaurant/ModelClasses/MessageRooms.dart';
import 'package:air_home_retaurant/UI/Chat2.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/HttpServices.dart';
import 'package:air_home_retaurant/Utils/MySharedPreferences.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Chat> {
  MyWidget _myWidget;
  ProgressDialog _progressDialog ;
  List<Message> messageChatList;
  List<MessageRooms> messageChatRoomsList;
  List<int> messageRoomId;
  int i;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _progressDialog =new ProgressDialog();
    messageChatList=new List();
    messageChatRoomsList=new List();
    messageRoomId=new List();
    i=0;
  }

  @override
  Widget build(BuildContext context) {
    if(i<1){
      getChatHistory(context);
    }
    return Scaffold(
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

  Widget listItem(int position) {
    MyWidget _myWidget = new MyWidget();
    return
      GestureDetector(
        onTap: (){
          GlobalState.currentSelectedMessageRoom=position;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chat2()),
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
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              image: DecorationImage(
                                image: NetworkImage(messageChatRoomsList.elementAt(position).roomImageUrl),
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
                              _myWidget.myText(messageChatRoomsList.elementAt(position).roomId.toString(), 12,
                                  FontWeight.bold, 1, Colors.black),
                              _myWidget.myText(messageChatRoomsList.elementAt(position).senderId, 10,
                                  FontWeight.bold, 1, Colors.black38),
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

  void getChatHistory(BuildContext context) {
    String userId="0";
    _progressDialog.showProgressDialog(context,textToBeDisplayed: Constants.PLEASE_WAIT);
    MySharedPreferences.instance
        .getStringValue(Constants.USER_ID)
        .then((value) => _getApiCallGetChatList(userId: value));

  }

  _getApiCallGetChatList({@required String userId}) async {
    print("chatuserid:"+userId);
    String url=Constants.GETChatListOfUser_API+userId;
    print("url:"+url);
    HttpServices httpServices = new HttpServices();
    await httpServices.getJsonWithOutBodyAsParamInUrl(
        url: url,
        onSuccess: (_streamedResponse) async {
          String response=await _streamedResponse.stream.bytesToString();
          print("this is Success result::${response}");
          messageChatList=messageFromMessageChatListJson(response);
          print("MessageChatListSize"+messageChatList.length.toString());
          GlobalState.messageChatList=messageChatList;
          if(messageChatList!=null){
            if(messageChatList.length>0){
              setState(() {
                i=i+1;
              });
              messageChatList.forEach((Message message) {
                if(message.mittente==int.parse(userId)){
                  messageChatRoomsList.add(new MessageRooms(roomId: message.destinatario.toString(),roomImageUrl: Constants.TEMP_IMAGE_URL,senderId: message.mittente.toString(),receiverId: message.destinatario.toString()));
                }
                if(message.destinatario==int.parse(userId)){
                  messageChatRoomsList.add(new MessageRooms(roomId:message.mittente.toString(),roomImageUrl: Constants.TEMP_IMAGE_URL,senderId: message.destinatario.toString(),receiverId: message.mittente.toString()));
                }
              });
              messageChatRoomsList = messageChatRoomsList.toSet().toList();
              List<MessageRooms> tempList=new List();
              tempList=messageChatRoomsList;
              final Map<String, MessageRooms> map = new Map();
              tempList.forEach((item) {
                map[item.roomId] = item;
              });
              tempList = map.values.toList();
              messageChatRoomsList.clear();
              messageChatRoomsList=tempList;
              GlobalState.messageChatRoomsList=messageChatRoomsList;
              print("OldmessageChatRoomsList Length "+messageChatRoomsList.length.toString());
              print("NewmessageChatRoomsList Length "+tempList.length.toString());

            }else{
              print("MessageChatList Size "+messageChatList.length.toString());
            }
          }else{
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
    bool isNotEmptyList=false;
    int siz=0;
    if(messageChatRoomsList!=null){
      isNotEmptyList=true;
      siz=messageChatRoomsList.length;
    }else{
      isNotEmptyList=false;
      siz=messageChatRoomsList.length;
    }

    return ListView.builder(
      itemCount: siz,
      itemBuilder: (context, position) {
        return listItem(position);
      },
    );
  }

}
