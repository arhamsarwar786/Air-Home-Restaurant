// To parse this JSON data, do
//
//     final categoryPostsModel = categoryPostsModelFromJson(jsonString);

import 'dart:convert';

CategoryPostsModel categoryPostsModelFromJson(String str) => CategoryPostsModel.fromJson(json.decode(str));

String categoryPostsModelToJson(CategoryPostsModel data) => json.encode(data.toJson());

class CategoryPostsModel {
  CategoryPostsModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<CategoryPostsList> data;

  factory CategoryPostsModel.fromJson(Map<String, dynamic> json) => CategoryPostsModel(
    status: json["status"],
    message: json["message"],
    data: List<CategoryPostsList>.from(json["data"].map((x) => CategoryPostsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryPostsList {
  CategoryPostsList({
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
  String lingue;
  bool nobambini;
  bool perFamiglie;
  String cucina;
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
  double valutazione;
  double prezzoOndemand;
  String urlOndemand;
  Menu1Titolo menu1Titolo;
  Menu2Titolo menu2Titolo;
  Menu3Titolo menu3Titolo;
  double menu1Prezzo;
  double menu2Prezzo;
  double menu3Prezzo;
  int percentoStoviglie;
  int percentoServizio;
  List<Foto> foto;
  List<Date> date;
  List<Menu> menu;

  factory CategoryPostsList.fromJson(Map<String, dynamic> json) => CategoryPostsList(
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
    lingue: json["Lingue"],
    nobambini: json["Nobambini"],
    perFamiglie: json["PerFamiglie"],
    cucina: json["Cucina"],
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
    menu1Titolo: menu1TitoloValues.map[json["Menu1titolo"]],
    menu2Titolo: menu2TitoloValues.map[json["Menu2titolo"]],
    menu3Titolo: menu3TitoloValues.map[json["Menu3titolo"]],
    menu1Prezzo: json["Menu1prezzo"],
    menu2Prezzo: json["Menu2prezzo"],
    menu3Prezzo: json["Menu3prezzo"],
    percentoStoviglie: json["PercentoStoviglie"],
    percentoServizio: json["PercentoServizio"],
    foto: List<Foto>.from(json["Foto"].map((x) => Foto.fromJson(x))),
    date: List<Date>.from(json["Date"].map((x) => Date.fromJson(x))),
    menu: List<Menu>.from(json["Menu"].map((x) => Menu.fromJson(x))),
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
    "Lingue": lingue,
    "Nobambini": nobambini,
    "PerFamiglie": perFamiglie,
    "Cucina": cucina,
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
    "Menu1titolo": menu1TitoloValues.reverse[menu1Titolo],
    "Menu2titolo": menu2TitoloValues.reverse[menu2Titolo],
    "Menu3titolo": menu3TitoloValues.reverse[menu3Titolo],
    "Menu1prezzo": menu1Prezzo,
    "Menu2prezzo": menu2Prezzo,
    "Menu3prezzo": menu3Prezzo,
    "PercentoStoviglie": percentoStoviglie,
    "PercentoServizio": percentoServizio,
    "Foto": List<dynamic>.from(foto.map((x) => x.toJson())),
    "Date": List<dynamic>.from(date.map((x) => x.toJson())),
    "Menu": List<dynamic>.from(menu.map((x) => x.toJson())),
  };
}

// enum Cucina { MEDITERRANEA_SPAGNOLA, ITALIANA_MEDITERRANEA, EMPTY, ITALIANA, ITALIANA_MEDITERRANEA_VEGETERIANA }

// final cucinaValues = EnumValues({
//   "": Cucina.EMPTY,
//   "Italiana": Cucina.ITALIANA,
//   "Italiana,Mediterranea": Cucina.ITALIANA_MEDITERRANEA,
//   "Italiana,Mediterranea,Vegeteriana": Cucina.ITALIANA_MEDITERRANEA_VEGETERIANA,
//   "Mediterranea,Spagnola": Cucina.MEDITERRANEA_SPAGNOLA
// });

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
  double prezzoAdulti;
  double prezzoBambini;
  Valuta valuta;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["ID"],
    idEvento: json["IDEvento"],
    inizio: DateTime.parse(json["Inizio"]),
    fine: DateTime.parse(json["Fine"]),
    prezzoAdulti: json["PrezzoAdulti"].toDouble(),
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

class Menu {
  Menu({
    this.idEvento,
    this.portata,
    this.descrizione,
    this.numeroMenu,
    this.categoria,
    this.prezzo,
    this.urlFoto,
  });

  int idEvento;
  String portata;
  String descrizione;
  int numeroMenu;
  Categoria categoria;
  double prezzo;
  String urlFoto;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    idEvento: json["IDEvento"],
    portata: json["Portata"],
    descrizione: json["Descrizione"],
    numeroMenu: json["NumeroMenu"],
    categoria: categoriaValues.map[json["Categoria"]],
    prezzo: json["Prezzo"],
    urlFoto: json["UrlFoto"],
  );

  Map<String, dynamic> toJson() => {
    "IDEvento": idEvento,
    "Portata": portata,
    "Descrizione": descrizione,
    "NumeroMenu": numeroMenu,
    "Categoria": categoriaValues.reverse[categoria],
    "Prezzo": prezzo,
    "UrlFoto": urlFoto,
  };
}

enum Categoria { EMPTY, DOLCE, SECONDO, PRIMO, ANTIPASTO }

final categoriaValues = EnumValues({
  "Antipasto": Categoria.ANTIPASTO,
  "Dolce": Categoria.DOLCE,
  "": Categoria.EMPTY,
  "Primo": Categoria.PRIMO,
  "Secondo": Categoria.SECONDO
});

enum Menu1Titolo { EMPTY, I_SAPORI_DEL_GOLFO }

final menu1TitoloValues = EnumValues({
  "": Menu1Titolo.EMPTY,
  "i sapori del golfo": Menu1Titolo.I_SAPORI_DEL_GOLFO
});

enum Menu2Titolo { EMPTY, CUCINA_NAPOLETANA }

final menu2TitoloValues = EnumValues({
  "cucina napoletana": Menu2Titolo.CUCINA_NAPOLETANA,
  "": Menu2Titolo.EMPTY
});

enum Menu3Titolo { EMPTY, IL_VEGETARIANO_CAMPANO }

final menu3TitoloValues = EnumValues({
  "": Menu3Titolo.EMPTY,
  "il Vegetariano Campano": Menu3Titolo.IL_VEGETARIANO_CAMPANO
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






