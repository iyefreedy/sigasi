// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posko.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posko _$PoskoFromJson(Map<String, dynamic> json) => Posko(
      iDPosko: json['IDPosko'] as String?,
      iDKetua: json['IDKetua'] as String?,
      lokasi: json['Lokasi'] as String?,
      masalah: json['Masalah'] as String?,
      solusiMasalah: json['SolusiMasalah'] as String?,
    );

Map<String, dynamic> _$PoskoToJson(Posko instance) => <String, dynamic>{
      'IDPosko': instance.iDPosko,
      'IDKetua': instance.iDKetua,
      'Lokasi': instance.lokasi,
      'Masalah': instance.masalah,
      'SolusiMasalah': instance.solusiMasalah,
    };
