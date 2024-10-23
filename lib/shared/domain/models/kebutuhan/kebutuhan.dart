import 'package:freezed_annotation/freezed_annotation.dart';

import '../barang/barang.dart';
import '../posko/posko.dart';

part 'kebutuhan.freezed.dart';
part 'kebutuhan.g.dart';

@freezed
class Kebutuhan with _$Kebutuhan {
  const factory Kebutuhan({
    int? idKebutuhan,
    int? idBarang,
    int? idPosko,
    int? jumlahKebutuhan,
    int? jumlahDiterima,
    int? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    Posko? posko,
    Barang? barang,
  }) = _Kebutuhan;

  factory Kebutuhan.fromJson(Map<String, Object?> json) =>
      _$KebutuhanFromJson(json);
}
