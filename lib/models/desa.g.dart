// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Desa _$DesaFromJson(Map<String, dynamic> json) => Desa(
      iDDesa: (json['IDDesa'] as num).toInt(),
      nama: json['Nama'] as String,
      iDKecamatan: (json['IDKecamatan'] as num).toInt(),
    );

Map<String, dynamic> _$DesaToJson(Desa instance) => <String, dynamic>{
      'IDDesa': instance.iDDesa,
      'IDKecamatan': instance.iDKecamatan,
      'Nama': instance.nama,
    };
