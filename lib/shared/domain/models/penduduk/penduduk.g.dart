// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penduduk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendudukImpl _$$PendudukImplFromJson(Map<String, dynamic> json) =>
    _$PendudukImpl(
      idPenduduk: (json['IdPenduduk'] as num?)?.toInt(),
      idKelompok: (json['IdKelompok'] as num?)?.toInt(),
      idKelurahan: (json['IdKelurahan'] as num?)?.toInt(),
      ktp: json['Ktp'] as String?,
      nama: json['Nama'] as String?,
      alamat: json['Alamat'] as String?,
      tanggalLahir: json['TanggalLahir'] == null
          ? null
          : DateTime.parse(json['TanggalLahir'] as String),
      jenisKelamin:
          $enumDecodeNullable(_$JenisKelaminEnumMap, json['JenisKelamin']),
      lastUpdatedBy: (json['LastUpdatedBy'] as num?)?.toInt(),
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
    );

Map<String, dynamic> _$$PendudukImplToJson(_$PendudukImpl instance) =>
    <String, dynamic>{
      'IdPenduduk': instance.idPenduduk,
      'IdKelompok': instance.idKelompok,
      'IdKelurahan': instance.idKelurahan,
      'Ktp': instance.ktp,
      'Nama': instance.nama,
      'Alamat': instance.alamat,
      'TanggalLahir': instance.tanggalLahir?.toIso8601String(),
      'JenisKelamin': _$JenisKelaminEnumMap[instance.jenisKelamin],
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
    };

const _$JenisKelaminEnumMap = {
  JenisKelamin.pria: 'Pria',
  JenisKelamin.wanita: 'Wanita',
};
