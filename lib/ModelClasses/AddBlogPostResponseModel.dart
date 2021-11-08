// To parse this JSON data, do
//
//     final aaaa = aaaaFromJson(jsonString);

import 'dart:convert';

AddBlogPostResponseModel AddBlogPostResponseModelFromJson(String str) => AddBlogPostResponseModel.fromJson(json.decode(str));

String AddBlogPostResponseModelToJson(AddBlogPostResponseModel data) => json.encode(data.toJson());

class AddBlogPostResponseModel {
    AddBlogPostResponseModel({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    String data;

    factory AddBlogPostResponseModel.fromJson(Map<String, dynamic> json) => AddBlogPostResponseModel(
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