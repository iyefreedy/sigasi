// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penduduk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Penduduk _$PendudukFromJson(Map<String, dynamic> json) => Penduduk(
      iDPenduduk: json['IDPenduduk'] as String?,
      desa: json['Desa'] as String?,
      jenisKelamin: json['JenisKelamin'] as String?,
      kTP: json['KTP'] as String?,
      iDKelompok: json['IDKelompok'] as String?,
      lastUpdateBy: json['LastUpdateBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      nama: json['Nama'] as String?,
      tanggalLahir: json['TanggalLahir'] as String?,
      alamat: json['Alamat'] as String?,
    );

Map<String, dynamic> _$PendudukToJson(Penduduk instance) => <String, dynamic>{
      'IDPenduduk': instance.iDPenduduk,
      'JenisKelamin': instance.jenisKelamin,
      'Desa': instance.desa,
      'TanggalLahir': instance.tanggalLahir,
      'KTP': instance.kTP,
      'Nama': instance.nama,
      'Alamat': instance.alamat,
      'IDKelompok': instance.iDKelompok,
      'LastUpdateBy': instance.lastUpdateBy,
      'LastUpdateDate': instance.lastUpdateDate,
    };
