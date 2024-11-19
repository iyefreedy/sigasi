import 'package:json_annotation/json_annotation.dart';

part 'kelompok.g.dart';

@JsonSerializable()
class Kelompok {
  const Kelompok({
    this.iDKelompok,
    this.namaKelompok,
    this.keterangan,
  });

  final String? iDKelompok;
  final String? namaKelompok;
  final String? keterangan;

  factory Kelompok.fromJson(Map<String, dynamic> json) =>
      _$KelompokFromJson(json);
}
