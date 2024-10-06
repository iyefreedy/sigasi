// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarangImpl _$$BarangImplFromJson(Map<String, dynamic> json) => _$BarangImpl(
      idBarang: (json['IdBarang'] as num?)?.toInt(),
      idJenisBarang: (json['IdJenisBarang'] as num?)?.toInt(),
      nama: json['Nama'] as String?,
      hargaSatuan: (json['HargaSatuan'] as num?)?.toDouble(),
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
    );

Map<String, dynamic> _$$BarangImplToJson(_$BarangImpl instance) =>
    <String, dynamic>{
      'IdBarang': instance.idBarang,
      'IdJenisBarang': instance.idJenisBarang,
      'Nama': instance.nama,
      'HargaSatuan': instance.hargaSatuan,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
    };
