// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelompok.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KelompokImpl _$$KelompokImplFromJson(Map<String, dynamic> json) =>
    _$KelompokImpl(
      idKelompok: (json['IdKelompok'] as num?)?.toInt(),
      namaKelompok: json['NamaKelompok'] as String?,
      keterangan: json['Keterangan'] as String?,
    );

Map<String, dynamic> _$$KelompokImplToJson(_$KelompokImpl instance) =>
    <String, dynamic>{
      'IdKelompok': instance.idKelompok,
      'NamaKelompok': instance.namaKelompok,
      'Keterangan': instance.keterangan,
    };
