// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posko.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoskoImpl _$$PoskoImplFromJson(Map<String, dynamic> json) => _$PoskoImpl(
      idPosko: (json['IdPosko'] as num?)?.toInt(),
      ketua: json['Ketua'] as String?,
      lokasi: json['Lokasi'] as String?,
      masalah: json['Masalah'] as String?,
      solusiMasalah: json['SolusiMasalah'] as String?,
    );

Map<String, dynamic> _$$PoskoImplToJson(_$PoskoImpl instance) =>
    <String, dynamic>{
      'IdPosko': instance.idPosko,
      'Ketua': instance.ketua,
      'Lokasi': instance.lokasi,
      'Masalah': instance.masalah,
      'SolusiMasalah': instance.solusiMasalah,
    };
