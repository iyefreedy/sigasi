import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/barang.dart';

part 'kebutuhan.g.dart';

@JsonSerializable()
class Kebutuhan {
  const Kebutuhan({
    this.iDKebutuhan,
    this.iDBarang,
    this.iDPosko,
    this.jumlahDibutuhkan,
    this.jumlahDiterima,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.barang,
  });

  final String? iDKebutuhan;
  final String? iDBarang;
  final String? iDPosko;
  final int? jumlahDibutuhkan;
  final int? jumlahDiterima;
  final DateTime? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(name: 'barang', includeToJson: false)
  final Barang? barang;

  factory Kebutuhan.fromJson(Map<String, dynamic> json) =>
      _$KebutuhanFromJson(json);

  Map<String, dynamic> toJson() => _$KebutuhanToJson(this);

  Kebutuhan copyWith({
    String? iDKebutuhan,
    String? iDBarang,
    String? iDPosko,
    int? jumlahDibutuhkan,
    int? jumlahDiterima,
    DateTime? lastUpdateDate,
    String? lastUpdateBy,
    Barang? barang,
  }) {
    return Kebutuhan(
      iDKebutuhan: iDKebutuhan ?? this.iDKebutuhan,
      iDBarang: iDBarang ?? this.iDBarang,
      iDPosko: iDPosko ?? this.iDPosko,
      jumlahDibutuhkan: jumlahDibutuhkan ?? this.jumlahDibutuhkan,
      jumlahDiterima: jumlahDiterima ?? this.jumlahDiterima,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      barang: barang ?? this.barang,
    );
  }
}
