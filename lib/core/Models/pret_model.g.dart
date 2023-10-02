// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PretModel _$PretModelFromJson(Map<String, dynamic> json) => PretModel(
      id: json['_id'] as String?,
      description: json['description'] as String?,
      montantDuPret: (json['montantDuPret'] as num).toDouble(),
      dateDeLaDemande: json['dateDeLaDemande'] as String,
      dateDeRembourssement:
          DateTime.parse(json['dateDeRembourssement'] as String),
      raison: json['raison'] as String,
      tauxDinteret: json['tauxDinteret'] as int,
      userName: json['userName'] as String,
      status: json['status'] as bool?,
    )
      ..version = json['__v'] as int?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String);

Map<String, dynamic> _$PretModelToJson(PretModel instance) => <String, dynamic>{
      '_id': instance.id,
      '__v': instance.version,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'montantDuPret': instance.montantDuPret,
      'dateDeLaDemande': instance.dateDeLaDemande,
      'dateDeRembourssement': instance.dateDeRembourssement.toIso8601String(),
      'raison': instance.raison,
      'tauxDinteret': instance.tauxDinteret,
      'status': instance.status,
      'userName': instance.userName,
    };
