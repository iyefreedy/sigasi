// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bantuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bantuan _$BantuanFromJson(Map<String, dynamic> json) => Bantuan(
      iDBantuan: json['IDBantuan'] as String?,
      iDDonatur: json['IDDonatur'] as String?,
      tanggalBantuan: json['TanggalBantuan'] == null
          ? null
          : DateTime.parse(json['TanggalBantuan'] as String),
      lastUpdateBy: json['LastUpdateBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      detailBantuan: (json['DetailBantuan'] as List<dynamic>?)
              ?.map((e) => DetailBantuan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BantuanToJson(Bantuan instance) => <String, dynamic>{
      'IDBantuan': instance.iDBantuan,
      'TanggalBantuan': instance.tanggalBantuan?.toIso8601String(),
      'IDDonatur': instance.iDDonatur,
      'LastUpdateDate': instance.lastUpdateDate,
      'LastUpdateBy': instance.lastUpdateBy,
      'DetailBantuan': instance.detailBantuan.map((e) => e.toJson()).toList(),
    };
