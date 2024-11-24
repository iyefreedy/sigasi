// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keluarga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Keluarga _$KeluargaFromJson(Map<String, dynamic> json) => Keluarga(
      iDKeluarga: json['IDKeluarga'] as String?,
      nomorKK: json['NomorKK'] as String?,
      alamat: json['Alamat'] as String?,
      iDDesa: (json['IDDesa'] as num?)?.toInt(),
      iDKecamatan: (json['IDKecamatan'] as num?)?.toInt(),
      lastUpdateDate: json['LastUpdateDate'] == null
          ? null
          : DateTime.parse(json['LastUpdateDate'] as String),
      lastUpdateBy: json['LastUpdateBy'] as String?,
      anggota: (json['anggota'] as List<dynamic>?)
          ?.map((e) => AnggotaKeluarga.fromJson(e as Map<String, dynamic>))
          .toList(),
      desa: json['desa'] == null
          ? null
          : Desa.fromJson(json['desa'] as Map<String, dynamic>),
      kecamatan: json['kecamatan'] == null
          ? null
          : Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeluargaToJson(Keluarga instance) => <String, dynamic>{
      'IDKeluarga': instance.iDKeluarga,
      'NomorKK': instance.nomorKK,
      'Alamat': instance.alamat,
      'IDKecamatan': instance.iDKecamatan,
      'IDDesa': instance.iDDesa,
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
