import 'package:json_annotation/json_annotation.dart';

part 'kecamatan.g.dart';

@JsonSerializable()
class Kecamatan {
  const Kecamatan({
    required this.iDKecamatan,
    required this.nama,
  });

  final int iDKecamatan;
  final String nama;

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Kecamatan && other.iDKecamatan == iDKecamatan;
  }

  @override
  int get hashCode => Object.hash(runtimeType, iDKecamatan);
}
