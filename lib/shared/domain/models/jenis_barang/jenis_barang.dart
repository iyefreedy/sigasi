import 'package:freezed_annotation/freezed_annotation.dart';

part 'jenis_barang.freezed.dart';
part 'jenis_barang.g.dart';

@freezed
class JenisBarang with _$JenisBarang {
  const factory JenisBarang({
    int? idJenisBarang,
    String? jenisBarang,
    DateTime? lastUpdatedDate,
  }) = _JenisBarang;

  factory JenisBarang.fromJson(Map<String, Object?> json) =>
      _$JenisBarangFromJson(json);
}
