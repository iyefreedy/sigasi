import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/penduduk.dart';

part 'pengungsi.g.dart';

@JsonSerializable()
class Pengungsi {
  const Pengungsi({
    this.iDPengungsi,
    this.iDPenduduk,
    this.iDPosko,
    this.kondisiKhusus,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.penduduk,
  });

  final String? iDPengungsi;
  final String? iDPenduduk;
  final String? iDPosko;
  final String? kondisiKhusus;
  final DateTime? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(name: 'penduduk', includeToJson: false)
  final Penduduk? penduduk;

  factory Pengungsi.fromJson(Map<String, dynamic> json) =>
      _$PengungsiFromJson(json);

  Map<String, dynamic> toJson() => _$PengungsiToJson(this);

  Pengungsi copyWith({
    String? iDPengungsi,
    String? iDPenduduk,
    String? iDPosko,
    String? kondisiKhusus,
    DateTime? lastUpdateDate,
    String? lastUpdateBy,
    Penduduk? penduduk,
  }) {
    return Pengungsi(
      iDPengungsi: iDPengungsi ?? this.iDPengungsi,
      iDPenduduk: iDPenduduk ?? this.iDPenduduk,
      iDPosko: iDPosko ?? this.iDPosko,
      kondisiKhusus: kondisiKhusus ?? this.kondisiKhusus,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      penduduk: penduduk ?? this.penduduk,
    );
  }
}
