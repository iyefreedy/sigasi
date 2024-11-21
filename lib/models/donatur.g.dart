// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donatur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donatur _$DonaturFromJson(Map<String, dynamic> json) => Donatur(
      iDDonatur: json['IDDonatur'] as String?,
      namaPerusahaan: json['NamaPerusahaan'] as String?,
      nomorKontak: json['NomorKontak'] as String?,
      alamat: json['Alamat'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      lastUpdateBy: json['LastUpdateBy'] as String?,
    );

Map<String, dynamic> _$DonaturToJson(Donatur instance) => <String, dynamic>{
      'IDDonatur': instance.iDDonatur,
      'NamaPerusahaan': instance.namaPerusahaan,
      'NomorKontak': instance.nomorKontak,
      'Alamat': instance.alamat,
      'LastUpdateDate': instance.lastUpdateDate,
      'LastUpdateBy': instance.lastUpdateBy,
    };
