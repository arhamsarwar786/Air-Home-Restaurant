// To parse this JSON data, do
//
//     final vendorModal = vendorModalFromJson(jsonString);

import 'dart:convert';

VendorModal vendorModalFromJson(String str) => VendorModal.fromJson(json.decode(str));

String vendorModalToJson(VendorModal data) => json.encode(data.toJson());

class VendorModal {
    VendorModal({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory VendorModal.fromJson(Map<String, dynamic> json) => VendorModal(
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
        this.dataregistrazione,
        this.nome,
        this.cognome,
        this.genere,
        this.payoff,
        this.descrizione,
        this.urlFoto,
        this.linguaMadre,
        this.valutazione,
        this.credito,
        this.urlVideo,
        this.host,
        this.chef,
        this.agency,
        this.ambassador,
        this.guide,
        this.allergie,
        this.cucinePreferite,
        this.lingue,
        this.referral,
        this.eventi,
    });

    int id;
    DateTime dataregistrazione;
    String nome;
    String cognome;
    String genere;
    String payoff;
    String descrizione;
    String urlFoto;
    String linguaMadre;
    double valutazione;
    double credito;
    String urlVideo;
    bool host;
    bool chef;
    bool agency;
    bool ambassador;
    bool guide;
    String allergie;
    String cucinePreferite;
    String lingue;
    dynamic referral;
    List<Eventi> eventi;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        dataregistrazione: DateTime.parse(json["Dataregistrazione"]),
        nome: json["Nome"],
        cognome: json["Cognome"],
        genere: json["Genere"],
        payoff: json["Payoff"],
        descrizione: json["Descrizione"],
        urlFoto: json["UrlFoto"],
        linguaMadre: json["LinguaMadre"],
        valutazione: json["Valutazione"],
        credito: json["Credito"],
        urlVideo: json["UrlVideo"],
        host: json["Host"],
        chef: json["Chef"],
        agency: json["Agency"],
        ambassador: json["Ambassador"],
        guide: json["Guide"],
        allergie: json["Allergie"],
        cucinePreferite: json["CucinePreferite"],
        lingue: json["Lingue"],
        referral: json["Referral"],
        eventi: List<Eventi>.from(json["Eventi"].map((x) => Eventi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Dataregistrazione": dataregistrazione.toIso8601String(),
        "Nome": nome,
        "Cognome": cognome,
        "Genere": genere,
        "Payoff": payoff,
        "Descrizione": descrizione,
        "UrlFoto": urlFoto,
        "LinguaMadre": linguaMadre,
        "Valutazione": valutazione,
        "Credito": credito,
        "UrlVideo": urlVideo,
        "Host": host,
        "Chef": chef,
        "Agency": agency,
        "Ambassador": ambassador,
        "Guide": guide,
        "Allergie": allergie,
        "CucinePreferite": cucinePreferite,
        "Lingue": lingue,
        "Referral": referral,
        "Eventi": List<dynamic>.from(eventi.map((x) => x.toJson())),
    };
}

class Eventi {
    Eventi({
        this.id,
        this.nome,
        this.urlFoto,
    });

    int id;
    String nome;
    String urlFoto;

    factory Eventi.fromJson(Map<String, dynamic> json) => Eventi(
        id: json["ID"],
        nome: json["Nome"],
        urlFoto: json["UrlFoto"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Nome": nome,
        "UrlFoto": urlFoto,
    };
}
