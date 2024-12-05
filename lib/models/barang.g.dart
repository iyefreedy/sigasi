// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barang _$BarangFromJson(Map<String, dynamic> json) => Barang(
      iDBarang: json['IDBarang'] as String?,
      namaBarang: json['NamaBarang'] as String?,
      hargaSatuan: json['HargaSatuan'] as num?,
      stok: json['stok'] == null
          ? null
          : Stok.fromJson(json['stok'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BarangToJson(Barang instance) => <String, dynamic>{
      'IDBarang': instance.iDBarang,
      'NamaBarang': instance.namaBarang,
      'HargaSatuan': instance.hargaSatuan,
    };
