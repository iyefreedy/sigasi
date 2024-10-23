// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_bantuan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailBantuanImpl _$$DetailBantuanImplFromJson(Map<String, dynamic> json) =>
    _$DetailBantuanImpl(
      idBantuanDtl: (json['IdBantuanDtl'] as num?)?.toInt(),
      idBarang: (json['IdBarang'] as num?)?.toInt(),
      idBantuan: (json['IdBantuan'] as num?)?.toInt(),
      jumlah: (json['Jumlah'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DetailBantuanImplToJson(_$DetailBantuanImpl instance) =>
    <String, dynamic>{
      'IdBantuanDtl': instance.idBantuanDtl,
      'IdBarang': instance.idBarang,
      'IdBantuan': instance.idBantuan,
      'Jumlah': instance.jumlah,
    };
