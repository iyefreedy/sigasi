import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/barang.dart';
import 'package:sigasi/models/posko.dart';

part 'distribusi.g.dart';

@JsonSerializable()
class Distribusi {
  Distribusi({
    this.iDDistribusi,
    this.iDBarang,
    this.iDPosko,
    this.jumlah,
    this.tanggalDistribusi,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.barang,
    this.posko,
  });

  final String? iDDistribusi;
  final String? iDBarang;
  final String? iDPosko;
  final int? jumlah;
  final DateTime? lastUpdateDate;
  final DateTime? tanggalDistribusi;
  final String? lastUpdateBy;

  @JsonKey(name: 'barang', includeToJson: false)
  final Barang? barang;
  @JsonKey(name: 'posko', includeToJson: false)
  final Posko? posko;

  factory Distribusi.fromJson(Map<String, dynamic> json) =>
      _$DistribusiFromJson(json);

  Map<String, dynamic> toJson() => _$DistribusiToJson(this);

  Distribusi copyWith({
    String? iDDistribusi,
    String? iDBarang,
    String? iDPosko,
    int? jumlah,
    DateTime? tanggalDistribusi,
    DateTime? lastUpdateDate,
    String? lastUpdateBy,
    Barang? barang,
    Posko? posko,
  }) {
    return Distribusi(
      iDDistribusi: iDDistribusi ?? this.iDDistribusi,
      iDBarang: iDBarang ?? this.iDBarang,
      iDPosko: iDPosko ?? this.iDPosko,
      jumlah: jumlah ?? this.jumlah,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      barang: barang ?? this.barang,
      posko: posko ?? this.posko,
      tanggalDistribusi: tanggalDistribusi ?? this.tanggalDistribusi,
    );
  }
}
