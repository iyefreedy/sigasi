// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VillageImpl _$$VillageImplFromJson(Map<String, dynamic> json) =>
    _$VillageImpl(
      id: (json['id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num).toInt(),
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$VillageImplToJson(_$VillageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_id': instance.districtId,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
