// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'population_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopulationGroupImpl _$$PopulationGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$PopulationGroupImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PopulationGroupImplToJson(
        _$PopulationGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
