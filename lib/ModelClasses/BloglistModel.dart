// To parse this JSON data, do
//
//     final bloglistModel = bloglistModelFromJson(jsonString);

import 'dart:convert';

BloglistModel bloglistModelFromJson(String str) => BloglistModel.fromJson(json.decode(str));

String bloglistModelToJson(BloglistModel data) => json.encode(data.toJson());

class BloglistModel {
  BloglistModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<BloglistIem> data;

  factory BloglistModel.fromJson(Map<String, dynamic> json) => BloglistModel(
    status: json["status"],
    message: json["message"],
    data: List<BloglistIem>.from(json["data"].map((x) => BloglistIem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BloglistIem {
  BloglistIem({
    this.id,
    this.idUser,
    this.idCategoria,
    this.data,
    this.titolo,
    this.sottotitolo,
    this.testo,
    this.immagine,
    this.categoria,
    this.video,
  });

  int id;
  int idUser;
  int idCategoria;
  DateTime data;
  String titolo;
  String sottotitolo;
  String testo;
  String immagine;
  String categoria;
  String video;

  factory BloglistIem.fromJson(Map<String, dynamic> json) => BloglistIem(
    id: json["ID"],
    idUser: json["IDUser"],
    idCategoria: json["IDCategoria"],
    data: DateTime.parse(json["Data"]),
    titolo: json["Titolo"],
    sottotitolo: json["Sottotitolo"],
    testo: json["Testo"],
    immagine: json["Immagine"],
    categoria: json["Categoria"],
    video: json["Video"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "IDUser": idUser,
    "IDCategoria": idCategoria,
    "Data": data.toIso8601String(),
    "Titolo": titolo,
    "Sottotitolo": sottotitolo,
    "Testo": testo,
    "Immagine": immagine,
    "Categoria": categoria,
    "Video": video,
  };
}