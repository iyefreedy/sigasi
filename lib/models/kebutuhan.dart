import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/barang.dart';
import 'package:sigasi/models/posko.dart';

part 'kebutuhan.g.dart';

@JsonSerializable()
class Kebutuhan {
  const Kebutuhan({
    this.iDKebutuhan,
    this.iDBarang,
    this.iDPosko,
    this.jumlahKebutuhan,
    this.jumlahDiterima,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.barang,
    this.posko,
  });

  final String? iDKebutuhan;
  final String? iDBarang;
  final String? iDPosko;
  final int? jumlahKebutuhan;
  final int? jumlahDiterima;
  final DateTime? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(name: 'barang', includeToJson: false)
  final Barang? barang;

  @JsonKey(name: 'posko', includeToJson: false)
  final Posko? posko;

  factory Kebutuhan.fromJson(Map<String, dynamic> json) =>
      _$KebutuhanFromJson(json);

  Map<String, dynamic> toJson() => _$KebutuhanToJson(this);

  Kebutuhan copyWith({
    String? iDKebutuhan,
    String? iDBarang,
    String? iDPosko,
    int? jumlahKebutuhan,
    int? jumlahDiterima,
    DateTime? lastUpdateDate,
    String? lastUpdateBy,
    Barang? barang,
    Posko? posko,
  }) {
    return Kebutuhan(
      iDKebutuhan: iDKebutuhan ?? this.iDKebutuhan,
      iDBarang: iDBarang ?? this.iDBarang,
      iDPosko: iDPosko ?? this.iDPosko,
      jumlahKebutuhan: jumlahKebutuhan ?? this.jumlahKebutuhan,
      jumlahDiterima: jumlahDiterima ?? this.jumlahDiterima,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      barang: barang ?? this.barang,
      posko: posko ?? this.posko,
    );
  }
}
