import 'package:json_annotation/json_annotation.dart';

part 'desa.g.dart';

@JsonSerializable()
class Desa {
  const Desa({
    required this.iDDesa,
    required this.nama,
    required this.iDKecamatan,
  });

  final int iDDesa;
  final int iDKecamatan;
  final String nama;

  factory Desa.fromJson(Map<String, dynamic> json) => _$DesaFromJson(json);
}
