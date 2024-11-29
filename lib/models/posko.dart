import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/penduduk.dart';

part 'posko.g.dart';

@JsonSerializable()
class Posko {
  const Posko({
    this.iDPosko,
    this.iDKetua,
    this.lokasi,
    this.masalah,
    this.solusiMasalah,
    this.penduduk,
  });

  final String? iDPosko;
  final String? iDKetua;
  final String? lokasi;
  final String? masalah;
  final String? solusiMasalah;

  @JsonKey(name: 'penduduk', includeIfNull: true)
  final List<Penduduk>? penduduk;

  factory Posko.fromJson(Map<String, dynamic> json) => _$PoskoFromJson(json);

  Map<String, dynamic> toJson() => _$PoskoToJson(this);

  Posko copyWith({
    String? iDPosko,
    String? iDKetua,
    String? lokasi,
    String? masalah,
    String? solusiMasalah,
    List<Penduduk>? penduduk,
  }) {
    return Posko(
      iDPosko: iDPosko ?? this.iDPosko,
      iDKetua: iDKetua ?? this.iDKetua,
      lokasi: lokasi ?? this.lokasi,
      masalah: masalah ?? this.masalah,
      solusiMasalah: solusiMasalah ?? this.solusiMasalah,
      penduduk: penduduk ?? this.penduduk,
    );
  }

  @override
  String toString() {
    return iDPosko.toString();
  }
}
