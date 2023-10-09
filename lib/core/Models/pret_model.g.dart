// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PretModel _$PretModelFromJson(Map<String, dynamic> json) => PretModel(
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      montantDuPret: (json['montantDuPret'] as num).toDouble(),
      dateDeRembourssement:
          DateTime.parse(json['dateDeRembourssement'] as String),
      raison: json['raison'] as String,
      tauxDinteret: json['tauxDinteret'] as int,
      userName: json['userName'] as String,
      status: json['status'] as bool?,
      isLiked: json['isLiked'] as bool?,
      pretLikedCount: json['pretLikedCount'] as int?,
      index: json['index'] as int?,
    )
      ..version = json['__v'] as int?
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
      'dateDeRembourssement': instance.dateDeRembourssement.toIso8601String(),
      'raison': instance.raison,
      'tauxDinteret': instance.tauxDinteret,
      'status': instance.status,
      'userName': instance.userName,
      'isLiked': instance.isLiked,
      'pretLikedCount': instance.pretLikedCount,
      'index': instance.index,
    };
