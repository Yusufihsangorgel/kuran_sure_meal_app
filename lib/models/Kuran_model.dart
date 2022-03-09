// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productToJson(Map<String, Product> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  Product({
    required this.sureaditr,
    required this.sureadiar,
    required this.sureadiaroku,
    required this.sureadien,
    required this.ayetsayisi,
    required this.cuz,
    required this.sayfa,
    required this.kuransira,
    required this.inissira,
    required this.alfabesira,
    required this.yer,
    required this.sureaciklama,
  });

  String sureaditr;
  String sureadiar;
  String sureadiaroku;
  String sureadien;
  String ayetsayisi;
  String cuz;
  String sayfa;
  String kuransira;
  String inissira;
  String alfabesira;
  Yer? yer;
  String sureaciklama;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        sureaditr: json["sureaditr"],
        sureadiar: json["sureadiar"],
        sureadiaroku: json["sureadiaroku"],
        sureadien: json["sureadien"],
        ayetsayisi: json["ayetsayisi"],
        cuz: json["cuz"],
        sayfa: json["sayfa"],
        kuransira: json["kuransira"],
        inissira: json["inissira"],
        alfabesira: json["alfabesira"],
        yer: yerValues.map[json["yer"]],
        sureaciklama: json["sureaciklama"],
      );

  Map<String, dynamic> toJson() => {
        "sureaditr": sureaditr,
        "sureadiar": sureadiar,
        "sureadiaroku": sureadiaroku,
        "sureadien": sureadien,
        "ayetsayisi": ayetsayisi,
        "cuz": cuz,
        "sayfa": sayfa,
        "kuransira": kuransira,
        "inissira": inissira,
        "alfabesira": alfabesira,
        "yer": yerValues.reverse[yer],
        "sureaciklama": sureaciklama,
      };
}

enum Yer { MEKKI, MEDENI }

final yerValues = EnumValues({"Medeni": Yer.MEDENI, "Mekki": Yer.MEKKI});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
