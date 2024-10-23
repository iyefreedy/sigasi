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
    int? idKelurahan,
    String? ktp,
    String? nama,
    String? alamat,
    DateTime? tanggalLahir,
    JenisKelamin? jenisKelamin,
    int? lastUpdatedBy,
    DateTime? lastUpdatedDate,
  }) = _Penduduk;

  factory Penduduk.withLastUpdated() =>
      Penduduk(lastUpdatedDate: DateTime.now(), lastUpdatedBy: 0);

  factory Penduduk.fromJson(Map<String, Object?> json) =>
      _$PendudukFromJson(json);
}
