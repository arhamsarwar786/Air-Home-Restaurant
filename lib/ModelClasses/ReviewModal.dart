// To parse this JSON data, do
//
//     final reviewModal = reviewModalFromJson(jsonString);

import 'dart:convert';

ReviewModal reviewModalFromJson(String str) => ReviewModal.fromJson(json.decode(str));

String reviewModalToJson(ReviewModal data) => json.encode(data.toJson());

class ReviewModal {
    ReviewModal({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory ReviewModal.fromJson(Map<String, dynamic> json) => ReviewModal(
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
        this.mittenteNome,
        this.mittenteCognome,
        this.dataInizioEvento,
        this.voto,
        this.testo,
        this.nomeEvento,
    });

    int id;
    DateTime data;
    String mittenteNome;
    String mittenteCognome;
    DateTime dataInizioEvento;
    int voto;
    String testo;
    String nomeEvento;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        data: DateTime.parse(json["Data"]),
        mittenteNome: json["MittenteNome"],
        mittenteCognome: json["MittenteCognome"],
        dataInizioEvento: DateTime.parse(json["DataInizioEvento"]),
        voto: json["Voto"],
        testo: json["Testo"],
        nomeEvento: json["NomeEvento"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Data": data.toIso8601String(),
        "MittenteNome": mittenteNome,
        "MittenteCognome": mittenteCognome,
        "DataInizioEvento": dataInizioEvento.toIso8601String(),
        "Voto": voto,
        "Testo": testo,
        "NomeEvento": nomeEvento,
    };
}
