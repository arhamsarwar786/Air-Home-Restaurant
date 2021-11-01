// To parse this JSON data, do
//
//     final registerResponce = registerResponceFromJson(jsonString);

import 'dart:convert';

RegisterResponce registerResponceFromJson(String str) => RegisterResponce.fromJson(json.decode(str));

String registerResponceToJson(RegisterResponce data) => json.encode(data.toJson());

class RegisterResponce {
    RegisterResponce({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    String data;

    factory RegisterResponce.fromJson(Map<String, dynamic> json) => RegisterResponce(
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
