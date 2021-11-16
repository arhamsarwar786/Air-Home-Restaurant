import 'package:air_home_retaurant/ModelClasses/Message.dart';
import 'package:air_home_retaurant/ModelClasses/MessageChatListModel.dart';
import 'package:air_home_retaurant/ModelClasses/MessageRooms.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat2 extends StatefulWidget {
  final List<MessageChatListModel> filterdchatList;
  Chat2(this.filterdchatList);
  // final int position;
  // Chat2({Key key, @required this.position}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Chat2();
}

class _Chat2 extends State<Chat2> {
  MyWidget _myWidget;
  // List<Message> messageChatList=null;
  // List<MessageRooms> messageChatRoomsList=null;
  // int currentSelectedMessageRoom=null;


  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    // messageChatList=new List();
    // messageChatList=GlobalState.messageChatList;
    // messageChatRoomsList=new List();
    // messageChatRoomsList=GlobalState.messageChatRoomsList;
    // currentSelectedMessageRoom=GlobalState.currentSelectedMessageRoom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("abs", () {
         Navigator.pop(context);

      }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(

            child: Container(
                color: Color(0xFFF5F5F5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: fetchMessageListView(context),
              ),

          ),
          Container(
            height: 50,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset("assets/images/smile.png"),
                      ),
                    ),
                    Expanded(child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: _myWidget.myTextInput(new TextEditingController(), null, "Massaggio"),
                      ),
                    )),
                    GestureDetector(
                      onTap: (){
                        print("sendPressHua");
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset("assets/images/icon_send.png"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
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
              //  image: DecorationImage(
            //    image: NetworkImage(messageChatRoomsList.elementAt(currentSelectedMessageRoom).roomImageUrl),
            //   fit: BoxFit.fill,
            // ),
            ),
          ),
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  child: _myWidget.myText(widget.filterdchatList.elementAt(0).message, 20, FontWeight.bold, 1, Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget fetchMessageListView(BuildContext context) {
 
    return ListView.builder(
      itemCount: widget.filterdchatList.length,
      itemBuilder: (context, position) {
        return listItem(widget.filterdchatList.elementAt(position));
      },
    );
  }
  Widget listItem(MessageChatListModel filterdchatList) {
    MyWidget _myWidget = new MyWidget();
    return
      GestureDetector(
        onTap: (){
          // GlobalState.currentSelectedMessageRoom=position;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Chat2()),
          // );
          // print(position);
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
                  //               image: DecorationImage(
                  //           image: NetworkImage(messageChatRoomsList.elementAt(position).roomImageUrl),
                  //       fit: BoxFit.fill,
                  // ),
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
                                _myWidget.myText(filterdchatList.message.toString(), 12,
                                    FontWeight.bold, 1, Colors.black),
                                _myWidget.myText(filterdchatList.message, 10,
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
}
