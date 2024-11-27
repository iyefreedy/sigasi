import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/anggota_keluarga.dart';
import 'package:sigasi/models/desa.dart';
import 'package:sigasi/models/kecamatan.dart';

part 'keluarga.g.dart';

@JsonSerializable()
class Keluarga {
  const Keluarga({
    this.iDKeluarga,
    this.nomorKK,
    this.alamat,
    this.iDDesa,
    this.iDKecamatan,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.anggota,
    this.desa,
    this.kecamatan,
  });

  final String? iDKeluarga;
  final String? nomorKK;
  final String? alamat;
  final int? iDKecamatan;
  final int? iDDesa;
  final DateTime? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(includeToJson: false, name: 'anggota')
  final List<AnggotaKeluarga>? anggota;

  @JsonKey(includeToJson: false, name: 'kecamatan')
  final Kecamatan? kecamatan;

  @JsonKey(includeToJson: false, name: 'desa')
  final Desa? desa;

  factory Keluarga.fromJson(Map<String, dynamic> json) =>
      _$KeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$KeluargaToJson(this);

  @override
  String toString() {
    return nomorKK ?? '-';
  }
}
