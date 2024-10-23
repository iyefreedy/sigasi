// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bantuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BantuanImpl _$$BantuanImplFromJson(Map<String, dynamic> json) =>
    _$BantuanImpl(
      idBantuan: (json['IdBantuan'] as num?)?.toInt(),
      idDonatur: (json['IdDonatur'] as num?)?.toInt(),
      tanggalBantuan: json['TanggalBantuan'] == null
          ? null
          : DateTime.parse(json['TanggalBantuan'] as String),
      lastUpdatedBy: (json['LastUpdatedBy'] as num?)?.toInt(),
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
      listDetailBantuan: (json['ListDetailBantuan'] as List<dynamic>?)
          ?.map((e) => DetailBantuan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BantuanImplToJson(_$BantuanImpl instance) =>
    <String, dynamic>{
      'IdBantuan': instance.idBantuan,
      'IdDonatur': instance.idDonatur,
      'TanggalBantuan': instance.tanggalBantuan?.toIso8601String(),
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
      'ListDetailBantuan': instance.listDetailBantuan,
    };
