// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

List<Message> messageFromMessageChatListJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
