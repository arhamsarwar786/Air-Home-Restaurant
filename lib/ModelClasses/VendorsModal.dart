// To parse this JSON data, do
//
//     final vendorModal = vendorModalFromJson(jsonString);

import 'dart:convert';

VendorsModal vendorModalFromJson(String str) => VendorsModal.fromJson(json.decode(str));

String vendorModalToJson(VendorsModal data) => json.encode(data.toJson());

class VendorsModal {
    VendorsModal({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory VendorsModal.fromJson(Map<String, dynamic> json) => VendorsModal(
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
    Genere genere;
    String payoff;
    String descrizione;
    String urlFoto;
    LinguaMadre linguaMadre;
    dynamic valutazione;
    dynamic credito;
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
        genere: genereValues.map[json["Genere"]],
        payoff: json["Payoff"],
        descrizione: json["Descrizione"],
        urlFoto: json["UrlFoto"],
        linguaMadre: linguaMadreValues.map[json["LinguaMadre"]],
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
        "Genere": genereValues.reverse[genere],
        "Payoff": payoff,
        "Descrizione": descrizione,
        "UrlFoto": urlFoto,
        "LinguaMadre": linguaMadreValues.reverse[linguaMadre],
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

    dynamic id;
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

enum Genere { U, N, D }

final genereValues = EnumValues({
    "D": Genere.D,
    "N": Genere.N,
    "U": Genere.U
});

enum LinguaMadre { IT, ES, EN, RU }

final linguaMadreValues = EnumValues({
    "EN": LinguaMadre.EN,
    "ES": LinguaMadre.ES,
    "IT": LinguaMadre.IT,
    "RU": LinguaMadre.RU
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
