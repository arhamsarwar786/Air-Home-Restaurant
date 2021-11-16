// To parse this JSON data, do
//
//     final categoryModal = categoryModalFromJson(jsonString);

import 'dart:convert';

CategoryModal categoryModalFromJson(String str) => CategoryModal.fromJson(json.decode(str));

String categoryModalToJson(CategoryModal data) => json.encode(data.toJson());

class CategoryModal {
    CategoryModal({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory CategoryModal.fromJson(Map<String, dynamic> json) => CategoryModal(
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
        this.it,
        this.en,
        this.es,
        this.de,
        this.ru,
    });

    int id;
    String it;
    String en;
    String es;
    String de;
    String ru;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        it: json["IT"],
        en: json["EN"],
        es: json["ES"],
        de: json["DE"],
        ru: json["RU"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "IT": it,
        "EN": en,
        "ES": es,
        "DE": de,
        "RU": ru,
    };
}
