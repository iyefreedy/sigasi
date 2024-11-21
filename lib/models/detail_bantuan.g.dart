// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_bantuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailBantuan _$DetailBantuanFromJson(Map<String, dynamic> json) =>
    DetailBantuan(
      iDBantuan: json['IDBantuan'] as String?,
      iDBantuanDTL: json['IDBantuanDTL'] as String?,
      iDBarang: json['IDBarang'] as String?,
      jumlah: (json['Jumlah'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetailBantuanToJson(DetailBantuan instance) =>
    <String, dynamic>{
      'IDBantuanDTL': instance.iDBantuanDTL,
      'IDBantuan': instance.iDBantuan,
      'IDBarang': instance.iDBarang,
      'Jumlah': instance.jumlah,
    };
