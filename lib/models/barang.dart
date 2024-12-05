import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/stok.dart';

part 'barang.g.dart';

@JsonSerializable()
class Barang {
  const Barang({
    this.iDBarang,
    this.namaBarang,
    this.hargaSatuan,
    this.stok,
  });

  final String? iDBarang;
  final String? namaBarang;
  final num? hargaSatuan;

  @JsonKey(name: 'stok', includeToJson: false)
  final Stok? stok;

  factory Barang.fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);

  Map<String, dynamic> toJson() => _$BarangToJson(this);
}
