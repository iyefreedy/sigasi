// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donatur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DonaturImpl _$$DonaturImplFromJson(Map<String, dynamic> json) =>
    _$DonaturImpl(
      idDonatur: (json['IdDonatur'] as num?)?.toInt(),
      namaPerusahaan: json['NamaPerusahaan'] as String?,
      namaKontak: json['NamaKontak'] as String?,
      alamat: json['Alamat'] as String?,
      nomorKontak: json['NomorKontak'] as String?,
      lastUpdatedBy: (json['LastUpdatedBy'] as num?)?.toInt(),
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
    );

Map<String, dynamic> _$$DonaturImplToJson(_$DonaturImpl instance) =>
    <String, dynamic>{
      'IdDonatur': instance.idDonatur,
      'NamaPerusahaan': instance.namaPerusahaan,
      'NamaKontak': instance.namaKontak,
      'Alamat': instance.alamat,
      'NomorKontak': instance.nomorKontak,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
    };
