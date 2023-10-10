import 'dart:core';

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'base.dart';

part "troc_model.g.dart";

@JsonSerializable()
class TrocModel extends BaseModel{
  var     imagePath;
  double  valeurNet;
  String  objetARecevoir;
  String  descriptionTroc;
  bool    isUrgent;
  String categorie; 
  String  userName;


  TrocModel({
    super.id,
    required this.objetARecevoir,//3
    required this.valeurNet,//2
    this.imagePath,//1
    required this.isUrgent,
    required this.descriptionTroc, 
    required this.userName,
    required this.categorie,
    super.createdAt,
  }
  );

  factory TrocModel.fromJson(Map<String, dynamic> json) =>
      _$TrocModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrocModelToJson(this);

//annotation
  @override
String toString() {
  return jsonEncode(toJson());
}
}

 