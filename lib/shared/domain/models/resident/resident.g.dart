// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResidentImpl _$$ResidentImplFromJson(Map<String, dynamic> json) =>
    _$ResidentImpl(
      id: (json['id'] as num?)?.toInt(),
      populationGroupId: (json['population_group_id'] as num?)?.toInt(),
      villageId: (json['village_id'] as num?)?.toInt(),
      identityNumber: json['identity_number'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ResidentImplToJson(_$ResidentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'population_group_id': instance.populationGroupId,
      'village_id': instance.villageId,
      'identity_number': instance.identityNumber,
      'name': instance.name,
      'address': instance.address,
      'birth_date': instance.birthDate?.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender],
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
};
