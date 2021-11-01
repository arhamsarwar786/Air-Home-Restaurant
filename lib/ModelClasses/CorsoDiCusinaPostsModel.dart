// To parse this JSON data, do
//
//     final corsoDiCusinaPostsModel = corsoDiCusinaPostsModelFromJson(jsonString);

import 'dart:convert';

CorsoDiCusinaPostsModel corsoDiCusinaPostsModelFromJson(String str) => CorsoDiCusinaPostsModel.fromJson(json.decode(str));

String corsoDiCusinaPostsModelToJson(CorsoDiCusinaPostsModel data) => json.encode(data.toJson());

class CorsoDiCusinaPostsModel {
  CorsoDiCusinaPostsModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory CorsoDiCusinaPostsModel.fromJson(Map<String, dynamic> json) => CorsoDiCusinaPostsModel(
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
    this.dataCreazione,
    this.hostId,
    this.lingua,
    this.tipoeventoId,
    this.smartbox,
    this.nome,
    this.partecipantiMinimo,
    this.partecipantiMassimo,
    this.luogoCitta,
    this.luogoCittaId,
    this.descrizioneIt,
    this.descrizioneEn,
    this.descrizioneEs,
    this.descrizioneRu,
    this.descrizioneDe,
    this.descrizioneFr,
    this.lingue,
    this.nobambini,
    this.perFamiglie,
    this.cucina,
    this.allergie,
    this.luogo,
    this.luogoNoteIt,
    this.luogoNoteEn,
    this.luogoNoteEs,
    this.luogoNoteRu,
    this.luogoNoteDe,
    this.luogoNoteFr,
    this.posx,
    this.posy,
    this.valutazione,
    this.prezzoOndemand,
    this.urlOndemand,
    this.menu1Titolo,
    this.menu2Titolo,
    this.menu3Titolo,
    this.menu1Prezzo,
    this.menu2Prezzo,
    this.menu3Prezzo,
    this.percentoStoviglie,
    this.percentoServizio,
    this.foto,
    this.date,
    this.menu,
  });

  int id;
  DateTime dataCreazione;
  int hostId;
  Lingua lingua;
  int tipoeventoId;
  bool smartbox;
  String nome;
  int partecipantiMinimo;
  int partecipantiMassimo;
  String luogoCitta;
  dynamic luogoCittaId;
  String descrizioneIt;
  String descrizioneEn;
  String descrizioneEs;
  String descrizioneRu;
  String descrizioneDe;
  String descrizioneFr;
  Lingue lingue;
  bool nobambini;
  bool perFamiglie;
  Cucina cucina;
  String allergie;
  String luogo;
  String luogoNoteIt;
  String luogoNoteEn;
  String luogoNoteEs;
  String luogoNoteRu;
  String luogoNoteDe;
  String luogoNoteFr;
  double posx;
  double posy;
  int valutazione;
  int prezzoOndemand;
  String urlOndemand;
  String menu1Titolo;
  String menu2Titolo;
  String menu3Titolo;
  int menu1Prezzo;
  int menu2Prezzo;
  int menu3Prezzo;
  int percentoStoviglie;
  int percentoServizio;
  List<Foto> foto;
  List<Date> date;
  List<dynamic> menu;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    dataCreazione: DateTime.parse(json["DataCreazione"]),
    hostId: json["HostID"],
    lingua: linguaValues.map[json["Lingua"]],
    tipoeventoId: json["TipoeventoID"],
    smartbox: json["Smartbox"],
    nome: json["Nome"],
    partecipantiMinimo: json["PartecipantiMinimo"],
    partecipantiMassimo: json["PartecipantiMassimo"],
    luogoCitta: json["LuogoCitta"],
    luogoCittaId: json["LuogoCittaID"],
    descrizioneIt: json["Descrizione_it"],
    descrizioneEn: json["Descrizione_en"],
    descrizioneEs: json["Descrizione_es"],
    descrizioneRu: json["Descrizione_ru"],
    descrizioneDe: json["Descrizione_de"],
    descrizioneFr: json["Descrizione_fr"],
    lingue: lingueValues.map[json["Lingue"]],
    nobambini: json["Nobambini"],
    perFamiglie: json["PerFamiglie"],
    cucina: cucinaValues.map[json["Cucina"]],
    allergie: json["Allergie"],
    luogo: json["Luogo"],
    luogoNoteIt: json["LuogoNote_it"],
    luogoNoteEn: json["LuogoNote_en"],
    luogoNoteEs: json["LuogoNote_es"],
    luogoNoteRu: json["LuogoNote_ru"],
    luogoNoteDe: json["LuogoNote_de"],
    luogoNoteFr: json["LuogoNote_fr"],
    posx: json["Posx"].toDouble(),
    posy: json["Posy"].toDouble(),
    valutazione: json["Valutazione"],
    prezzoOndemand: json["PrezzoOndemand"],
    urlOndemand: json["UrlOndemand"],
    menu1Titolo: json["Menu1titolo"],
    menu2Titolo: json["Menu2titolo"],
    menu3Titolo: json["Menu3titolo"],
    menu1Prezzo: json["Menu1prezzo"],
    menu2Prezzo: json["Menu2prezzo"],
    menu3Prezzo: json["Menu3prezzo"],
    percentoStoviglie: json["PercentoStoviglie"],
    percentoServizio: json["PercentoServizio"],
    foto: List<Foto>.from(json["Foto"].map((x) => Foto.fromJson(x))),
    date: List<Date>.from(json["Date"].map((x) => Date.fromJson(x))),
    menu: List<dynamic>.from(json["Menu"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "DataCreazione": dataCreazione.toIso8601String(),
    "HostID": hostId,
    "Lingua": linguaValues.reverse[lingua],
    "TipoeventoID": tipoeventoId,
    "Smartbox": smartbox,
    "Nome": nome,
    "PartecipantiMinimo": partecipantiMinimo,
    "PartecipantiMassimo": partecipantiMassimo,
    "LuogoCitta": luogoCitta,
    "LuogoCittaID": luogoCittaId,
    "Descrizione_it": descrizioneIt,
    "Descrizione_en": descrizioneEn,
    "Descrizione_es": descrizioneEs,
    "Descrizione_ru": descrizioneRu,
    "Descrizione_de": descrizioneDe,
    "Descrizione_fr": descrizioneFr,
    "Lingue": lingueValues.reverse[lingue],
    "Nobambini": nobambini,
    "PerFamiglie": perFamiglie,
    "Cucina": cucinaValues.reverse[cucina],
    "Allergie": allergie,
    "Luogo": luogo,
    "LuogoNote_it": luogoNoteIt,
    "LuogoNote_en": luogoNoteEn,
    "LuogoNote_es": luogoNoteEs,
    "LuogoNote_ru": luogoNoteRu,
    "LuogoNote_de": luogoNoteDe,
    "LuogoNote_fr": luogoNoteFr,
    "Posx": posx,
    "Posy": posy,
    "Valutazione": valutazione,
    "PrezzoOndemand": prezzoOndemand,
    "UrlOndemand": urlOndemand,
    "Menu1titolo": menu1Titolo,
    "Menu2titolo": menu2Titolo,
    "Menu3titolo": menu3Titolo,
    "Menu1prezzo": menu1Prezzo,
    "Menu2prezzo": menu2Prezzo,
    "Menu3prezzo": menu3Prezzo,
    "PercentoStoviglie": percentoStoviglie,
    "PercentoServizio": percentoServizio,
    "Foto": List<dynamic>.from(foto.map((x) => x.toJson())),
    "Date": List<dynamic>.from(date.map((x) => x.toJson())),
    "Menu": List<dynamic>.from(menu.map((x) => x)),
  };
}

enum Cucina { MEDITERRANEA_SPAGNOLA, EMPTY, ITALIANA, ITALIANA_MEDITERRANEA }

final cucinaValues = EnumValues({
  "": Cucina.EMPTY,
  "Italiana": Cucina.ITALIANA,
  "Italiana,Mediterranea": Cucina.ITALIANA_MEDITERRANEA,
  "Mediterranea,Spagnola": Cucina.MEDITERRANEA_SPAGNOLA
});

class Date {
  Date({
    this.id,
    this.idEvento,
    this.inizio,
    this.fine,
    this.prezzoAdulti,
    this.prezzoBambini,
    this.valuta,
  });

  int id;
  int idEvento;
  DateTime inizio;
  DateTime fine;
  int prezzoAdulti;
  double prezzoBambini;
  Valuta valuta;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["ID"],
    idEvento: json["IDEvento"],
    inizio: DateTime.parse(json["Inizio"]),
    fine: DateTime.parse(json["Fine"]),
    prezzoAdulti: json["PrezzoAdulti"],
    prezzoBambini: json["PrezzoBambini"].toDouble(),
    valuta: valutaValues.map[json["Valuta"]],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "IDEvento": idEvento,
    "Inizio": inizio.toIso8601String(),
    "Fine": fine.toIso8601String(),
    "PrezzoAdulti": prezzoAdulti,
    "PrezzoBambini": prezzoBambini,
    "Valuta": valutaValues.reverse[valuta],
  };
}

enum Valuta { EUR }

final valutaValues = EnumValues({
  "EUR": Valuta.EUR
});

class Foto {
  Foto({
    this.idEvento,
    this.urlFoto,
  });

  int idEvento;
  String urlFoto;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
    idEvento: json["IDEvento"],
    urlFoto: json["UrlFoto"],
  );

  Map<String, dynamic> toJson() => {
    "IDEvento": idEvento,
    "UrlFoto": urlFoto,
  };
}

enum Lingua { EN, IT }

final linguaValues = EnumValues({
  "en": Lingua.EN,
  "it": Lingua.IT
});

enum Lingue { INGLESE_SPAGNOLO, INGLESE_ITALIANO, INGLESE_SPAGNOLO_FRANCESE_ITALIANO, EMPTY }

final lingueValues = EnumValues({
  "": Lingue.EMPTY,
  " inglese, italiano": Lingue.INGLESE_ITALIANO,
  " inglese, spagnolo": Lingue.INGLESE_SPAGNOLO,
  " inglese, spagnolo, francese, italiano": Lingue.INGLESE_SPAGNOLO_FRANCESE_ITALIANO
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
