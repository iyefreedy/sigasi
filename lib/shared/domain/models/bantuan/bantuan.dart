import 'package:freezed_annotation/freezed_annotation.dart';

import '../detail_bantuan/detail_bantuan.dart';

part 'bantuan.freezed.dart';
part 'bantuan.g.dart';

@freezed
class Bantuan with _$Bantuan {
  const factory Bantuan({
    int? idBantuan,
    int? idDonatur,
    DateTime? tanggalBantuan,
    int? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    List<DetailBantuan>? listDetailBantuan,
  }) = _Bantuan;

  factory Bantuan.fromJson(Map<String, Object?> json) =>
      _$BantuanFromJson(json);
}
