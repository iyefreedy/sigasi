import 'package:freezed_annotation/freezed_annotation.dart';

import '../penduduk/penduduk.dart';
import '../posko/posko.dart';

part 'pengungsi.freezed.dart';
part 'pengungsi.g.dart';

@freezed
class Pengungsi with _$Pengungsi {
  const factory Pengungsi({
    int? idPengungsi,
    int? idPenduduk,
    int? idPosko,
    String? kondisiKhusus,
    int? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    Penduduk? penduduk,
    Posko? posko,
  }) = _Pengungsi;

  factory Pengungsi.fromJson(Map<String, Object?> json) =>
      _$PengungsiFromJson(json);
}
