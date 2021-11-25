// To parse this JSON data, do
//
//     final reservationsModel = reservationsModelFromJson(jsonString);

import 'dart:convert';

ReservationsModel reservationsModelFromJson(String str) => ReservationsModel.fromJson(json.decode(str));

String reservationsModelToJson(ReservationsModel data) => json.encode(data.toJson());

class ReservationsModel {
  ReservationsModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory ReservationsModel.fromJson(Map<String, dynamic> json) => ReservationsModel(
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
    this.idPrenotazione,
    this.dataPrenotazione,
    this.stato,
    this.idEvento,
    this.idDataEvento,
    this.idUtente,
    this.referrer,
    this.nomeEvento,
    this.dataInizioEvento,
    this.durataEventoMinuti,
    this.prezzoAdulti,
    this.prezzoBambini,
    this.valuta,
    this.numeroAdulti,
    this.numeroBambini,
    this.importoTotale,
    this.creditoUtilizzato,
    this.immagineEvento,
    this.nominativoUtente,
  });

  int idPrenotazione;
  DateTime dataPrenotazione;
  String stato;
  int idEvento;
  int idDataEvento;
  int idUtente;
  dynamic referrer;
  String nomeEvento;
  DateTime dataInizioEvento;
  int durataEventoMinuti;
  double prezzoAdulti;
  double prezzoBambini;
  String valuta;
  int numeroAdulti;
  int numeroBambini;
  double importoTotale;
  double creditoUtilizzato;
  String immagineEvento;
  String nominativoUtente;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPrenotazione: json["IDPrenotazione"],
    dataPrenotazione: DateTime.parse(json["DataPrenotazione"]),
    stato: json["Stato"],
    idEvento: json["IdEvento"],
    idDataEvento: json["IDDataEvento"],
    idUtente: json["IDUtente"],
    referrer: json["Referrer"],
    nomeEvento: json["NomeEvento"],
    dataInizioEvento: DateTime.parse(json["DataInizioEvento"]),
    durataEventoMinuti: json["DurataEventoMinuti"],
    prezzoAdulti: json["PrezzoAdulti"],
    prezzoBambini: json["PrezzoBambini"],
    valuta: json["Valuta"],
    numeroAdulti: json["NumeroAdulti"],
    numeroBambini: json["NumeroBambini"],
    importoTotale: json["ImportoTotale"].toDouble(),
    creditoUtilizzato: json["CreditoUtilizzato"],
    immagineEvento:json["ImmagineEvento"],
    nominativoUtente:json["NominativoUtente"],
  );

  Map<String, dynamic> toJson() => {
    "IDPrenotazione": idPrenotazione,
    "DataPrenotazione": dataPrenotazione.toIso8601String(),
    "Stato": stato,
    "IdEvento": idEvento,
    "IDDataEvento": idDataEvento,
    "IDUtente": idUtente,
    "Referrer": referrer,
    "NomeEvento": nomeEvento,
    "DataInizioEvento": dataInizioEvento.toIso8601String(),
    "DurataEventoMinuti": durataEventoMinuti,
    "PrezzoAdulti": prezzoAdulti,
    "PrezzoBambini": prezzoBambini,
    "Valuta": valuta,
    "NumeroAdulti": numeroAdulti,
    "NumeroBambini": numeroBambini,
    "ImportoTotale": importoTotale,
    "CreditoUtilizzato": creditoUtilizzato,
  };
}