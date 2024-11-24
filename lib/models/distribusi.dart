import 'package:json_annotation/json_annotation.dart';

part 'distribusi.g.dart';

@JsonSerializable()
class Distribusi {
  const Distribusi({
    this.iDDistribusi,
    this.iDBarang,
    this.iDPosko,
    this.jumlah,
    this.lastUpdateDate,
    this.tanggalDistribusi,
    this.lastUpdateBy,
  });

  final String? iDDistribusi;
  final String? iDBarang;
  final String? iDPosko;
  final int? jumlah;
  final DateTime? tanggalDistribusi;
  final DateTime? lastUpdateDate;
  final String? lastUpdateBy;

  factory Distribusi.fromJson(Map<String, dynamic> json) =>
      _$DistribusiFromJson(json);

  Map<String, dynamic> toJson() => _$DistribusiToJson(this);

  Distribusi copyWith({
    String? iDDistribusi,
    String? iDBarang,
    String? iDPosko,
    DateTime? tanggalDistribusi,
    int? jumlah,
    DateTime? lastUpdateDate,
    String? lastUpdateBy,
  }) {
    return Distribusi(
      iDDistribusi: iDDistribusi ?? this.iDDistribusi,
      iDBarang: iDBarang ?? this.iDBarang,
      iDPosko: iDPosko ?? this.iDPosko,
      jumlah: jumlah ?? this.jumlah,
      tanggalDistribusi: tanggalDistribusi ?? this.tanggalDistribusi,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
    );
  }
}
