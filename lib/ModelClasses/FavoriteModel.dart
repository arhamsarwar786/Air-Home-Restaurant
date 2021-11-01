// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
  FavoriteModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<FavoriteItem> data;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    status: json["status"],
    message: json["message"],
    data: List<FavoriteItem>.from(json["data"].map((x) => FavoriteItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FavoriteItem {
  FavoriteItem({
    this.idUser,
    this.idEvento,
    this.data,
  });

  int idUser;
  int idEvento;
  DateTime data;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) => FavoriteItem(
    idUser: json["IdUser"],
    idEvento: json["IdEvento"],
    data: DateTime.parse(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "IdUser": idUser,
    "IdEvento": idEvento,
    "Data": data.toIso8601String(),
  };
}
