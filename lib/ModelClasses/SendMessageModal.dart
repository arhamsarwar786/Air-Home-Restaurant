// To parse this JSON data, do
//
//     final sendMessageModal = sendMessageModalFromJson(jsonString);

import 'dart:convert';

SendMessageModal sendMessageModalFromJson(String str) => SendMessageModal.fromJson(json.decode(str));

String sendMessageModalToJson(SendMessageModal data) => json.encode(data.toJson());

class SendMessageModal {
    SendMessageModal({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    String data;

    factory SendMessageModal.fromJson(Map<String, dynamic> json) => SendMessageModal(
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
    };
}
