import 'package:freezed_annotation/freezed_annotation.dart';

part 'barang.freezed.dart';
part 'barang.g.dart';

@freezed
class Barang with _$Barang {
  const factory Barang({
    int? idBarang,
    int? idJenisBarang,
    String? nama,
    double? hargaSatuan,
    DateTime? lastUpdatedDate,
  }) = _Barang;

  factory Barang.fromJson(Map<String, Object?> json) => _$BarangFromJson(json);
}
