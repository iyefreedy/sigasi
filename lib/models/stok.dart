import 'package:json_annotation/json_annotation.dart';

part 'stok.g.dart';

@JsonSerializable()
class Stok {
  const Stok({
    this.iDPenyimpanan,
    this.jumlah,
  });

  final int? iDPenyimpanan;
  final int? jumlah;

  factory Stok.fromJson(Map<String, dynamic> json) => _$StokFromJson(json);
}
