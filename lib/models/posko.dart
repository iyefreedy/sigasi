import 'package:json_annotation/json_annotation.dart';

part 'posko.g.dart';

@JsonSerializable()
class Posko {
  const Posko({
    this.iDPosko,
    this.iDKetua,
    this.lokasi,
    this.masalah,
    this.solusiMasalah,
  });

  final String? iDPosko;
  final String? iDKetua;
  final String? lokasi;
  final String? masalah;
  final String? solusiMasalah;

  factory Posko.fromJson(Map<String, dynamic> json) => _$PoskoFromJson(json);

  Map<String, dynamic> toJson() => _$PoskoToJson(this);

  Posko copyWith({
    String? iDPosko,
    String? iDKetua,
    String? lokasi,
    String? masalah,
    String? solusiMasalah,
  }) {
    return Posko(
      iDPosko: iDPosko ?? this.iDPosko,
      iDKetua: iDKetua ?? this.iDKetua,
      lokasi: lokasi ?? this.lokasi,
      masalah: masalah ?? this.masalah,
      solusiMasalah: solusiMasalah ?? this.solusiMasalah,
    );
  }

  @override
  String toString() {
    return iDPosko.toString();
  }
}
