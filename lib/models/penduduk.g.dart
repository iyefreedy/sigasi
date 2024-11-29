// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penduduk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Penduduk _$PendudukFromJson(Map<String, dynamic> json) => Penduduk(
      iDPenduduk: json['IDPenduduk'] as String?,
      kTP: json['KTP'] as String?,
      nama: json['Nama'] as String?,
      jenisKelamin: json['JenisKelamin'] as String?,
      tanggalLahir: json['TanggalLahir'] == null
          ? null
          : DateTime.parse(json['TanggalLahir'] as String),
      alamat: json['Alamat'] as String?,
      iDDesa: (json['IDDesa'] as num?)?.toInt(),
      iDKecamatan: (json['IDKecamatan'] as num?)?.toInt(),
      iDKelompok: json['IDKelompok'] as String?,
      lastUpdateBy: json['LastUpdateBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      anggota: json['anggota'] == null
          ? null
          : AnggotaKeluarga.fromJson(json['anggota'] as Map<String, dynamic>),
      kelompok: json['kelompok'] == null
          ? null
          : Kelompok.fromJson(json['kelompok'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PendudukToJson(Penduduk instance) => <String, dynamic>{
      'IDPenduduk': instance.iDPenduduk,
      'KTP': instance.kTP,
      'Nama': instance.nama,
      'JenisKelamin': instance.jenisKelamin,
      'TanggalLahir': instance.tanggalLahir?.toIso8601String(),
      'Alamat': instance.alamat,
      'IDDesa': instance.iDDesa,
      'IDKecamatan': instance.iDKecamatan,
      'IDKelompok': instance.iDKelompok,
      'LastUpdateBy': instance.lastUpdateBy,
      'LastUpdateDate': instance.lastUpdateDate,
    };
