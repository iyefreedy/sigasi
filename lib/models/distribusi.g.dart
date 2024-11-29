// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribusi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Distribusi _$DistribusiFromJson(Map<String, dynamic> json) => Distribusi(
      iDDistribusi: json['IDDistribusi'] as String?,
      iDBarang: json['IDBarang'] as String?,
      iDPosko: json['IDPosko'] as String?,
      jumlah: (json['Jumlah'] as num?)?.toInt(),
      lastUpdateDate: json['LastUpdateDate'] == null
          ? null
          : DateTime.parse(json['LastUpdateDate'] as String),
      lastUpdateBy: json['LastUpdateBy'] as String?,
      barang: json['barang'] == null
          ? null
          : Barang.fromJson(json['barang'] as Map<String, dynamic>),
      posko: json['posko'] == null
          ? null
          : Posko.fromJson(json['posko'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistribusiToJson(Distribusi instance) =>
    <String, dynamic>{
      'IDDistribusi': instance.iDDistribusi,
      'IDBarang': instance.iDBarang,
      'IDPosko': instance.iDPosko,
      'Jumlah': instance.jumlah,
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
