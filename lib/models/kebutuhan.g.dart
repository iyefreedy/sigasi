// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kebutuhan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kebutuhan _$KebutuhanFromJson(Map<String, dynamic> json) => Kebutuhan(
      iDKebutuhan: json['IDKebutuhan'] as String?,
      iDBarang: json['IDBarang'] as String?,
      iDPosko: json['IDPosko'] as String?,
      jumlahDibutuhkan: (json['JumlahDibutuhkan'] as num?)?.toInt(),
      jumlahDiterima: (json['JumlahDiterima'] as num?)?.toInt(),
      lastUpdateDate: json['LastUpdateDate'] == null
          ? null
          : DateTime.parse(json['LastUpdateDate'] as String),
      lastUpdateBy: json['LastUpdateBy'] as String?,
      barang: json['barang'] == null
          ? null
          : Barang.fromJson(json['barang'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KebutuhanToJson(Kebutuhan instance) => <String, dynamic>{
      'IDKebutuhan': instance.iDKebutuhan,
      'IDBarang': instance.iDBarang,
      'IDPosko': instance.iDPosko,
      'JumlahDibutuhkan': instance.jumlahDibutuhkan,
      'JumlahDiterima': instance.jumlahDiterima,
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
