// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengungsi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pengungsi _$PengungsiFromJson(Map<String, dynamic> json) => Pengungsi(
      iDPengungsi: json['IDPengungsi'] as String?,
      iDPenduduk: json['IDPenduduk'] as String?,
      iDPosko: json['IDPosko'] as String?,
      kondisiKhusus: json['KondisiKhusus'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      lastUpdateBy: json['LastUpdateBy'] as String?,
    );

Map<String, dynamic> _$PengungsiToJson(Pengungsi instance) => <String, dynamic>{
      'IDPengungsi': instance.iDPengungsi,
      'IDPenduduk': instance.iDPenduduk,
      'IDPosko': instance.iDPosko,
      'KondisiKhusus': instance.kondisiKhusus,
      'LastUpdateDate': instance.lastUpdateDate,
      'LastUpdateBy': instance.lastUpdateBy,
    };
