// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.data,
        this.titolo,
        this.sottotitolo,
        this.immagine,
        this.testoHtml,
    });

    int id;
    DateTime data;
    String titolo;
    String sottotitolo;
    String immagine;
    String testoHtml;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        data: DateTime.parse(json["Data"]),
        titolo: json["Titolo"],
        sottotitolo: json["Sottotitolo"],
        immagine: json["Immagine"],
        testoHtml: json["TestoHtml"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Data": data.toIso8601String(),
        "Titolo": titolo,
        "Sottotitolo": sottotitolo,
        "Immagine": immagine,
        "TestoHtml": testoHtml,
    };
}
