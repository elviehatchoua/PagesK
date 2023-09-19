import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable()
abstract class BaseModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: '__v')
  int? version;
  DateTime? createdAt;
  DateTime? updatedAt;

  /// Base constructor
  BaseModel({this.id, this.version, this.createdAt, this.updatedAt});

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
