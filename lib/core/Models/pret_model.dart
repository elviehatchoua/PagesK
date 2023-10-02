import 'dart:core';

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'base.dart';

part "pret_model.g.dart";

@JsonSerializable()

class PretModel extends BaseModel{
  String ? description;
  double montantDuPret;
  String dateDeLaDemande;
  DateTime dateDeRembourssement;
  String raison;
  int tauxDinteret;
  bool? status;
  String userName;

  PretModel({
    super.id,
    this.description,
    required this.montantDuPret,
    required this.dateDeLaDemande,
    required this.dateDeRembourssement,
    required this.raison,
    required this.tauxDinteret,
    required this.userName,
    this.status
  });

   factory PretModel.fromJson(Map<String, dynamic> json) =>
      _$PretModelFromJson(json);

  Map<String, dynamic> toJson() => _$PretModelToJson(this);

//annotation
  @override
String toString() {
  return jsonEncode(toJson());
}
}