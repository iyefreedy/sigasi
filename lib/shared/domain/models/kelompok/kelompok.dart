import 'package:freezed_annotation/freezed_annotation.dart';

part 'kelompok.freezed.dart';
part 'kelompok.g.dart';

@freezed
class Kelompok with _$Kelompok {
  const factory Kelompok({
    int? idKelompok,
    String? namaKelompok,
    String? keterangan,
  }) = _Kelompok;

  factory Kelompok.fromJson(Map<String, Object?> json) =>
      _$KelompokFromJson(json);
}
