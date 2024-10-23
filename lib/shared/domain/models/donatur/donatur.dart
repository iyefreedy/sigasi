import 'package:freezed_annotation/freezed_annotation.dart';

part 'donatur.freezed.dart';
part 'donatur.g.dart';

@freezed
class Donatur with _$Donatur {
  const factory Donatur({
    int? idDonatur,
    String? namaPerusahaan,
    String? namaKontak,
    String? alamat,
    String? nomorKontak,
    int? lastUpdatedBy,
    DateTime? lastUpdatedDate,
  }) = _Donatur;

  factory Donatur.fromJson(Map<String, Object?> json) =>
      _$DonaturFromJson(json);
}
