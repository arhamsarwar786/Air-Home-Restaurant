import 'package:air_home_retaurant/ModelClasses/User.dart';

class MessageChatListModel {
  final int messageId;
  final int userId;
  final String status;
  final String message;
  final DateTime time;
  
   String userName;
  
   String profilePicture;

  MessageChatListModel(this.messageId, this.userId, this.status, this.message, this.time,this.userName,this.profilePicture);

}
