// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

MyUser userFromJson(String str) => MyUser.fromJson(json.decode(str));

String userToJson(MyUser data) => json.encode(data.toJson());

class MyUser {
  MyUser({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.dataRegistrazione,
    this.nome,
    this.cognome,
    this.referrer,
    this.referral,
    this.eMail,
    this.attivo,
    this.genere,
    this.payoff,
    this.urlFoto,
    this.dataDiNascita,
    this.natoA,
    this.host,
    this.chef,
    this.guide,
    this.ambassador,
    this.airagency,
    this.disponibileXEventiPrivati,
    this.telefono,
    this.indirizzo,
    this.nazione,
    this.citta,
    this.cap,
    this.idTitoloDiStudio,
    this.listaAllergie,
    this.listaTipiDiCucinaGuest,
    this.listaTipiDiCucinaHost,
    this.listaLingue,
    this.idProfessione,
    this.linguaMadre,
    this.valuta,
    this.valutazione,
    this.descrizione,
    this.iban,
    this.ragioneSociale,
    this.sedeLegale,
    this.piva,
    this.cf,
    this.referenteAzienda,
    this.pec,
    this.sdi,
    this.profiloCompleto,
    this.credito,
    this.ricaricoEvento,
    this.inAttesadiEssereEliminato,
    this.sitoWeb,
    this.urlVideo,
  });

  int id;
  DateTime dataRegistrazione;
  String nome;
  String cognome;
  String referrer;
  String referral;
  String eMail;
  bool attivo;
  String genere;
  String payoff;
  String urlFoto;
  DateTime dataDiNascita;
  String natoA;
  bool host;
  bool chef;
  bool guide;
  bool ambassador;
  bool airagency;
  bool disponibileXEventiPrivati;
  String telefono;
  String indirizzo;
  String nazione;
  String citta;
  String cap;
  int idTitoloDiStudio;
  String listaAllergie;
  String listaTipiDiCucinaGuest;
  String listaTipiDiCucinaHost;
  String listaLingue;
  int idProfessione;
  String linguaMadre;
  String valuta;
  double valutazione;
  String descrizione;
  String iban;
  String ragioneSociale;
  String sedeLegale;
  String piva;
  String cf;
  String referenteAzienda;
  String pec;
  String sdi;
  int profiloCompleto;
  double credito;
  int ricaricoEvento;
  bool inAttesadiEssereEliminato;
  String sitoWeb;
  String urlVideo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"],
    dataRegistrazione: DateTime.parse(json["DataRegistrazione"]),
    nome: json["Nome"],
    cognome: json["Cognome"],
    referrer: json["Referrer"],
    referral: json["Referral"],
    eMail: json["eMail"],
    attivo: json["Attivo"],
    genere: json["Genere"],
    payoff: json["Payoff"],
    urlFoto: json["UrlFoto"],
    dataDiNascita: DateTime.parse(json["DataDiNascita"]),
    natoA: json["NatoA"],
    host: json["Host"],
    chef: json["Chef"],
    guide: json["Guide"],
    ambassador: json["Ambassador"],
    airagency: json["Airagency"],
    disponibileXEventiPrivati: json["DisponibileXEventiPrivati"],
    telefono: json["Telefono"],
    indirizzo: json["Indirizzo"],
    nazione: json["Nazione"],
    citta: json["Citta"],
    cap: json["CAP"],
    idTitoloDiStudio: json["IdTitoloDiStudio"],
    listaAllergie: json["ListaAllergie"],
    listaTipiDiCucinaGuest: json["ListaTipiDiCucinaGuest"],
    listaTipiDiCucinaHost: json["ListaTipiDiCucinaHost"],
    listaLingue: json["ListaLingue"],
    idProfessione: json["IdProfessione"],
    linguaMadre: json["LinguaMadre"],
    valuta: json["Valuta"],
    valutazione: json["Valutazione"],
    descrizione: json["Descrizione"],
    iban: json["IBAN"],
    ragioneSociale: json["RagioneSociale"],
    sedeLegale: json["SedeLegale"],
    piva: json["PIVA"],
    cf: json["CF"],
    referenteAzienda: json["ReferenteAzienda"],
    pec: json["PEC"],
    sdi: json["SDI"],
    profiloCompleto: json["ProfiloCompleto"],
    credito: json["Credito"],
    ricaricoEvento: json["RicaricoEvento"],
    inAttesadiEssereEliminato: json["InAttesadiEssereEliminato"],
    sitoWeb: json["SitoWeb"],
    urlVideo: json["UrlVideo"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "DataRegistrazione": dataRegistrazione.toIso8601String(),
    "Nome": nome,
    "Cognome": cognome,
    "Referrer": referrer,
    "Referral": referral,
    "eMail": eMail,
    "Attivo": attivo,
    "Genere": genere,
    "Payoff": payoff,
    "UrlFoto": urlFoto,
    "DataDiNascita": dataDiNascita.toIso8601String(),
    "NatoA": natoA,
    "Host": host,
    "Chef": chef,
    "Guide": guide,
    "Ambassador": ambassador,
    "Airagency": airagency,
    "DisponibileXEventiPrivati": disponibileXEventiPrivati,
    "Telefono": telefono,
    "Indirizzo": indirizzo,
    "Nazione": nazione,
    "Citta": citta,
    "CAP": cap,
    "IdTitoloDiStudio": idTitoloDiStudio,
    "ListaAllergie": listaAllergie,
    "ListaTipiDiCucinaGuest": listaTipiDiCucinaGuest,
    "ListaTipiDiCucinaHost": listaTipiDiCucinaHost,
    "ListaLingue": listaLingue,
    "IdProfessione": idProfessione,
    "LinguaMadre": linguaMadre,
    "Valuta": valuta,
    "Valutazione": valutazione,
    "Descrizione": descrizione,
    "IBAN": iban,
    "RagioneSociale": ragioneSociale,
    "SedeLegale": sedeLegale,
    "PIVA": piva,
    "CF": cf,
    "ReferenteAzienda": referenteAzienda,
    "PEC": pec,
    "SDI": sdi,
    "ProfiloCompleto": profiloCompleto,
    "Credito": credito,
    "RicaricoEvento": ricaricoEvento,
    "InAttesadiEssereEliminato": inAttesadiEssereEliminato,
    "SitoWeb": sitoWeb,
    "UrlVideo": urlVideo,
  };
}
