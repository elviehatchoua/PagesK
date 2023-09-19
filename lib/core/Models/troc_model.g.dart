// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'troc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrocModel _$TrocModelFromJson(Map<String, dynamic> json) => TrocModel(
      id: json['_id'] as String?,
      objetARecevoir: json['objetARecevoir'] as String,
      valeurNet: (json['valeurNet'] as num).toDouble(),
      imagePath: json['imagePath'],
      isUrgent: json['isUrgent'] as bool,
      descriptionTroc: json['descriptionTroc'] as String,
      userName: json['userName'] as String,
      categorie: json['categorie'] as String,
    )
      ..version = json['__v'] as int?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String);

Map<String, dynamic> _$TrocModelToJson(TrocModel instance) => <String, dynamic>{
      '_id': instance.id,
      '__v': instance.version,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'imagePath': instance.imagePath,
      'valeurNet': instance.valeurNet,
      'objetARecevoir': instance.objetARecevoir,
      'descriptionTroc': instance.descriptionTroc,
      'isUrgent': instance.isUrgent,
      'categorie': instance.categorie,
      'userName': instance.userName,
    };
