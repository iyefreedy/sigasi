// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenis_barang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JenisBarangImpl _$$JenisBarangImplFromJson(Map<String, dynamic> json) =>
    _$JenisBarangImpl(
      idJenisBarang: (json['IdJenisBarang'] as num?)?.toInt(),
      jenisBarang: json['JenisBarang'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
    );

Map<String, dynamic> _$$JenisBarangImplToJson(_$JenisBarangImpl instance) =>
    <String, dynamic>{
      'IdJenisBarang': instance.idJenisBarang,
      'JenisBarang': instance.jenisBarang,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
    };
