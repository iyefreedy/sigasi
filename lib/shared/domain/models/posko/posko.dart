import 'package:freezed_annotation/freezed_annotation.dart';

part 'posko.freezed.dart';
part 'posko.g.dart';

@freezed
class Posko with _$Posko {
  const factory Posko({
    int? idPosko,
    String? ketua,
    String? lokasi,
    String? masalah,
    String? solusiMasalah,
  }) = _Posko;

  factory Posko.fromJson(Map<String, Object?> json) => _$PoskoFromJson(json);
}
