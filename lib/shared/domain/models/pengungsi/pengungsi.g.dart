// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengungsi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PengungsiImpl _$$PengungsiImplFromJson(Map<String, dynamic> json) =>
    _$PengungsiImpl(
      idPengungsi: (json['IdPengungsi'] as num?)?.toInt(),
      idPenduduk: (json['IdPenduduk'] as num?)?.toInt(),
      idPosko: (json['IdPosko'] as num?)?.toInt(),
      kondisiKhusus: json['KondisiKhusus'] as String?,
      lastUpdatedBy: (json['LastUpdatedBy'] as num?)?.toInt(),
      lastUpdatedDate: json['LastUpdatedDate'] == null
          ? null
          : DateTime.parse(json['LastUpdatedDate'] as String),
      penduduk: json['Penduduk'] == null
          ? null
          : Penduduk.fromJson(json['Penduduk'] as Map<String, dynamic>),
      posko: json['Posko'] == null
          ? null
          : Posko.fromJson(json['Posko'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PengungsiImplToJson(_$PengungsiImpl instance) =>
    <String, dynamic>{
      'IdPengungsi': instance.idPengungsi,
      'IdPenduduk': instance.idPenduduk,
      'IdPosko': instance.idPosko,
      'KondisiKhusus': instance.kondisiKhusus,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
      'Penduduk': instance.penduduk,
      'Posko': instance.posko,
    };
