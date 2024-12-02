import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/kebutuhan.dart';
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
    this.kebutuhan,
  });

  final String? iDPosko;
  final String? iDKetua;
  final String? lokasi;
  final String? masalah;
  final String? solusiMasalah;

  @JsonKey(name: 'penduduk', includeToJson: false)
  final List<Penduduk>? penduduk;

  @JsonKey(name: 'kebutuhan', includeToJson: false, includeFromJson: false)
  final List<Kebutuhan>? kebutuhan;

  factory Posko.fromJson(Map<String, dynamic> json) => _$PoskoFromJson(json);

  Map<String, dynamic> toJson() => _$PoskoToJson(this);

  Posko copyWith({
    String? iDPosko,
    String? iDKetua,
    String? lokasi,
    String? masalah,
    String? solusiMasalah,
    List<Penduduk>? penduduk,
    List<Kebutuhan>? kebutuhan,
  }) {
    return Posko(
      iDPosko: iDPosko ?? this.iDPosko,
      iDKetua: iDKetua ?? this.iDKetua,
      lokasi: lokasi ?? this.lokasi,
      masalah: masalah ?? this.masalah,
      solusiMasalah: solusiMasalah ?? this.solusiMasalah,
      penduduk: penduduk ?? this.penduduk,
      kebutuhan: kebutuhan ?? this.kebutuhan,
    );
  }

  @override
  String toString() {
    return iDPosko.toString();
  }

  @override
  bool operator ==(Object other) {
    return other is Posko && other.iDPosko == iDPosko;
  }

  @override
  int get hashCode => Object.hash(runtimeType, iDPosko);
}
