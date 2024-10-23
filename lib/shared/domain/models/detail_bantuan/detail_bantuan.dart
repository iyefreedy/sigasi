import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_bantuan.freezed.dart';
part 'detail_bantuan.g.dart';

@freezed
class DetailBantuan with _$DetailBantuan {
  const factory DetailBantuan({
    int? idBantuanDtl,
    int? idBarang,
    int? idBantuan,
    int? jumlah,
  }) = _DetailBantuan;

  factory DetailBantuan.fromJson(Map<String, Object?> json) =>
      _$DetailBantuanFromJson(json);
}
