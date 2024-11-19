import 'package:json_annotation/json_annotation.dart';

part 'pengguna.g.dart';

@JsonSerializable()
class Pengguna {
  const Pengguna({
    this.iDPengguna,
    this.nama,
    this.nomorKontak,
    this.satuan,
    this.iDPosko,
  });

  final String? iDPengguna;
  final String? nama;
  final String? nomorKontak;
  final String? satuan;
  final int? iDPosko;

  factory Pengguna.fromJson(Map<String, dynamic> json) =>
      _$PenggunaFromJson(json);
}
