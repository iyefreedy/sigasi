import 'package:json_annotation/json_annotation.dart';

part 'barang.g.dart';

@JsonSerializable()
class Barang {
  const Barang({
    this.iDBarang,
    this.namaBarang,
    this.hargaSatuan,
  });

  final String? iDBarang;
  final String? namaBarang;
  final num? hargaSatuan;

  factory Barang.fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);

  Map<String, dynamic> toJson() => _$BarangToJson(this);
}
