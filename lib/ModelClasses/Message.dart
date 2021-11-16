// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

MessageData messageFromJson(String str) => MessageData.fromJson(json.decode(str));

String messageToJson(MessageData data) => json.encode(data.toJson());

class MessageData {
  MessageData({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Message> data;

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
    status: json["status"],
    message: json["message"],
    data: List<Message>.from(json["data"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.id,
    this.data,
    this.mittente,
    this.destinatario,
    this.messaggio,
  });

  int id;
  DateTime data;
  int mittente;
  int destinatario;
  String messaggio;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["ID"],
    data: DateTime.parse(json["Data"]),
    mittente: json["Mittente"],
    destinatario: json["Destinatario"],
    messaggio: json["Messaggio"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Data": data.toIso8601String(),
    "Mittente": mittente,
    "Destinatario": destinatario,
    "Messaggio": messaggio,
  };
}