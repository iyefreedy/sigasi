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
      detailBantuan: (json['bantuan_detail'] as List<dynamic>?)
              ?.map((e) => DetailBantuan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      donatur: json['donatur'] == null
          ? null
          : Donatur.fromJson(json['donatur'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BantuanToJson(Bantuan instance) => <String, dynamic>{
      'IDBantuan': instance.iDBantuan,
      'TanggalBantuan': instance.tanggalBantuan?.toIso8601String(),
      'IDDonatur': instance.iDDonatur,
      'LastUpdateDate': instance.lastUpdateDate,
      'LastUpdateBy': instance.lastUpdateBy,
      'bantuan_detail': instance.detailBantuan.map((e) => e.toJson()).toList(),
    };
