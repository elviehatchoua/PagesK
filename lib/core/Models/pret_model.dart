import 'dart:core';

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base.dart';

part "pret_model.g.dart";

@JsonSerializable()

class PretModel extends BaseModel{
  String ? description;
  double montantDuPret;
  DateTime dateDeRembourssement;
  String raison;
  int tauxDinteret;
  bool? status;
  String userName;
  bool ? isLiked;
  int ? pretLikedCount;
  int ? index;

  PretModel({
    super.id,
    super.createdAt,
    this.description,
    required this.montantDuPret,
    required this.dateDeRembourssement,
    required this.raison,
    required this.tauxDinteret,
    required this.userName,
    this.status,
    this.isLiked,
    this.pretLikedCount,
    this.index
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