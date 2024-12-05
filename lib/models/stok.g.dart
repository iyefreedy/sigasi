// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stok _$StokFromJson(Map<String, dynamic> json) => Stok(
      iDPenyimpanan: (json['IDPenyimpanan'] as num?)?.toInt(),
      jumlah: (json['Jumlah'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StokToJson(Stok instance) => <String, dynamic>{
      'IDPenyimpanan': instance.iDPenyimpanan,
      'Jumlah': instance.jumlah,
    };
