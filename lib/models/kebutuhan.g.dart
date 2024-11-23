// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kebutuhan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kebutuhan _$KebutuhanFromJson(Map<String, dynamic> json) => Kebutuhan(
      iDKebutuhan: json['IDKebutuhan'] as String?,
      iDBarang: json['IDBarang'] as String?,
      iDPosko: json['IDPosko'] as String?,
      jumlahKebutuhan: (json['JumlahKebutuhan'] as num?)?.toInt(),
      jumlahDiterima: (json['JumlahDiterima'] as num?)?.toInt(),
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

Map<String, dynamic> _$KebutuhanToJson(Kebutuhan instance) => <String, dynamic>{
      'IDKebutuhan': instance.iDKebutuhan,
      'IDBarang': instance.iDBarang,
      'IDPosko': instance.iDPosko,
      'JumlahKebutuhan': instance.jumlahKebutuhan,
      'JumlahDiterima': instance.jumlahDiterima,
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
