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
      tanggalDistribusi: json['TanggalDistribusi'] == null
          ? null
          : DateTime.parse(json['TanggalDistribusi'] as String),
      lastUpdateBy: json['LastUpdateBy'] as String?,
    );

Map<String, dynamic> _$DistribusiToJson(Distribusi instance) =>
    <String, dynamic>{
      'IDDistribusi': instance.iDDistribusi,
      'IDBarang': instance.iDBarang,
      'IDPosko': instance.iDPosko,
      'Jumlah': instance.jumlah,
      'TanggalDistribusi': instance.tanggalDistribusi?.toIso8601String(),
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
