// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anggota_keluarga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnggotaKeluarga _$AnggotaKeluargaFromJson(Map<String, dynamic> json) =>
    AnggotaKeluarga(
      iDAnggotaKeluarga: json['IDAnggotaKeluarga'] as String?,
      iDKeluarga: json['IDKeluarga'] as String?,
      iDPenduduk: json['IDPenduduk'] as String?,
      hubungan: json['Hubungan'] as String?,
      lastUpdateDate: json['LastUpdateDate'] == null
          ? null
          : DateTime.parse(json['LastUpdateDate'] as String),
      lastUpdateBy: json['LastUpdateBy'] as String?,
      penduduk: json['penduduk'] == null
          ? null
          : Penduduk.fromJson(json['penduduk'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnggotaKeluargaToJson(AnggotaKeluarga instance) =>
    <String, dynamic>{
      'IDAnggotaKeluarga': instance.iDAnggotaKeluarga,
      'IDKeluarga': instance.iDKeluarga,
      'IDPenduduk': instance.iDPenduduk,
      'Hubungan': instance.hubungan,
      'LastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'LastUpdateBy': instance.lastUpdateBy,
    };
