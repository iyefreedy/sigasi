// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kebutuhan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kebutuhan _$KebutuhanFromJson(Map<String, dynamic> json) => Kebutuhan(
      json['IDKebutuhan'] as String?,
      json['IDBarang'] as String?,
      (json['JumlahDibutuhkan'] as num?)?.toInt(),
      (json['JumlahDiterima'] as num?)?.toInt(),
      json['LastUpdateDate'] == null
          ? null
          : DateTime.parse(json['LastUpdateDate'] as String),
      json['LastUpdateBy'] as String?,
      Barang.fromJson(json['barang'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KebutuhanToJson(Kebutuhan instance) => <String, dynamic>{
      'IDKebutuhan': instance.iDKebutuhan,
      'IDBarang': instance.iDBarang,
      'JumlahDibutuhkan': instance.jumlahDibutuhkan,
      'JumlahDiterima': instance.jumlahDiterima,
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
