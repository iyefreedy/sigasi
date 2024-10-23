// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesaImpl _$$DesaImplFromJson(Map<String, dynamic> json) => _$DesaImpl(
      idKelurahan: (json['IdKelurahan'] as num?)?.toInt(),
      idKecamatan: (json['IdKecamatan'] as num?)?.toInt(),
      nama: json['Nama'] as String?,
    );

Map<String, dynamic> _$$DesaImplToJson(_$DesaImpl instance) =>
    <String, dynamic>{
      'IdKelurahan': instance.idKelurahan,
      'IdKecamatan': instance.idKecamatan,
      'Nama': instance.nama,
    };
