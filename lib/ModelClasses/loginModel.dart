// To parse this JSON data, do
//
//     final logInResponce = logInResponceFromJson(jsonString);

import 'dart:convert';

LogInResponce logInResponceFromJson(String str) => LogInResponce.fromJson(json.decode(str));

String logInResponceToJson(LogInResponce data) => json.encode(data.toJson());

class LogInResponce {
    LogInResponce({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    String data;

    factory LogInResponce.fromJson(Map<String, dynamic> json) => LogInResponce(
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
