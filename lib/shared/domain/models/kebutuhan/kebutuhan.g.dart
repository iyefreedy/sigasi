// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kebutuhan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KebutuhanImpl _$$KebutuhanImplFromJson(Map<String, dynamic> json) =>
    _$KebutuhanImpl(
      idKebutuhan: (json['IdKebutuhan'] as num?)?.toInt(),
      idBarang: (json['IdBarang'] as num?)?.toInt(),
      idPosko: (json['IdPosko'] as num?)?.toInt(),
      jumlahKebutuhan: (json['JumlahKebutuhan'] as num?)?.toInt(),
      jumlahDiterima: (json['JumlahDiterima'] as num?)?.toInt(),
      lastUpdatedBy: (json['LastUpdatedBy'] as num?)?.toInt(),
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
      posko: json['Posko'] == null
          ? null
          : Posko.fromJson(json['Posko'] as Map<String, dynamic>),
      barang: json['Barang'] == null
          ? null
          : Barang.fromJson(json['Barang'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KebutuhanImplToJson(_$KebutuhanImpl instance) =>
    <String, dynamic>{
      'IdKebutuhan': instance.idKebutuhan,
      'IdBarang': instance.idBarang,
      'IdPosko': instance.idPosko,
      'JumlahKebutuhan': instance.jumlahKebutuhan,
      'JumlahDiterima': instance.jumlahDiterima,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
      'Posko': instance.posko,
      'Barang': instance.barang,
    };
