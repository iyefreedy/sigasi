import 'package:freezed_annotation/freezed_annotation.dart';

part 'penduduk.freezed.dart';
part 'penduduk.g.dart';

enum JenisKelamin {
  @JsonValue('Pria')
  pria('Pria'),
  @JsonValue('Wanita')
  wanita('Wanita');

  const JenisKelamin(this.label);
  final String label;
}

@freezed
class Penduduk with _$Penduduk {
  const factory Penduduk({
    int? idPenduduk,
    int? idKelompok,
    String? ktp,
    String? nama,
    String? alamat,
    String? desa,
    DateTime? tanggalLahir,
    JenisKelamin? jenisKelamin,
    int? lastUpdatedBy,
    DateTime? lastUpdatedDate,
  }) = _Penduduk;

  factory Penduduk.withLastUpdated() =>
      Penduduk(lastUpdatedDate: DateTime.now());

  factory Penduduk.fromJson(Map<String, Object?> json) =>
      _$PendudukFromJson(json);
}
