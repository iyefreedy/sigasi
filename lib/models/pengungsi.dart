import 'package:json_annotation/json_annotation.dart';

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
  });

  final String? iDPengungsi;
  final String? iDPenduduk;
  final String? iDPosko;
  final String? kondisiKhusus;
  final String? lastUpdateDate;
  final String? lastUpdateBy;

  factory Pengungsi.fromJson(Map<String, dynamic> json) =>
      _$PengungsiFromJson(json);

  Map<String, dynamic> toJson() => _$PengungsiToJson(this);

  Pengungsi copyWith({
    String? iDPengungsi,
    String? iDPenduduk,
    String? iDPosko,
    String? kondisiKhusus,
    String? lastUpdateDate,
    String? lastUpdateBy,
  }) {
    return Pengungsi(
      iDPengungsi: iDPengungsi ?? this.iDPengungsi,
      iDPenduduk: iDPenduduk ?? this.iDPenduduk,
      iDPosko: iDPosko ?? this.iDPosko,
      kondisiKhusus: kondisiKhusus ?? this.kondisiKhusus,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
    );
  }
}
