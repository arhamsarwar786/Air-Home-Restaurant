// To parse this JSON data, do
//
//     final matchListResponseModel = matchListResponseModelFromJson(jsonString);

import 'dart:convert';

MatchListResponseModel matchListResponseModelFromJson(String str) => MatchListResponseModel.fromJson(json.decode(str));

String matchListResponseModelToJson(MatchListResponseModel data) => json.encode(data.toJson());

class MatchListResponseModel {
  MatchListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory MatchListResponseModel.fromJson(Map<String, dynamic> json) => MatchListResponseModel(
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
    this.nomeUtente,
    this.idUser,
    this.tipo,
    this.tipoId,
    this.titolo,
    this.testo,
    this.citta,
    this.categoria,
    this.categoriaId,
    this.foto,
  });

  int id;
  DateTime data;
  String nomeUtente;
  int idUser;
  Tipo tipo;
  String tipoId;
  String titolo;
  String testo;
  String citta;
  Categoria categoria;
  int categoriaId;
  List<String> foto;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    data: DateTime.parse(json["Data"]),
    nomeUtente: json["NomeUtente"],
    idUser: json["IdUser"],
    tipo: tipoValues.map[json["Tipo"]],
    tipoId: json["TipoID"],
    titolo: json["Titolo"],
    testo: json["Testo"],
    citta: json["Citta"],
    categoria: categoriaValues.map[json["Categoria"]],
    categoriaId: json["CategoriaID"],
    foto: List<String>.from(json["Foto"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Data": data.toIso8601String(),
    "NomeUtente": nomeUtente,
    "IdUser": idUser,
    "Tipo": tipoValues.reverse[tipo],
    "TipoID": tipoId,
    "Titolo": titolo,
    "Testo": testo,
    "Citta": citta,
    "Categoria": categoriaValues.reverse[categoria],
    "CategoriaID": categoriaId,
    "Foto": List<dynamic>.from(foto.map((x) => x)),
  };
}

enum Categoria { CAMPAGNA, MONTAGNA, CITTA }

final categoriaValues = EnumValues({
  "Campagna": Categoria.CAMPAGNA,
  "Citta'": Categoria.CITTA,
  "Montagna": Categoria.MONTAGNA
});

enum Tipo { HOST, CHEF }

final tipoValues = EnumValues({
  "Chef": Tipo.CHEF,
  "Host": Tipo.HOST
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