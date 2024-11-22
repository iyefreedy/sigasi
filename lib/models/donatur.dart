import 'package:json_annotation/json_annotation.dart';

part 'donatur.g.dart';

@JsonSerializable()
class Donatur {
  const Donatur({
    this.iDDonatur,
    this.namaPerusahaan,
    this.nomorKontak,
    this.alamat,
    this.lastUpdateDate,
    this.lastUpdateBy,
  });

  final String? iDDonatur;
  final String? namaPerusahaan;
  final String? nomorKontak;
  final String? alamat;
  final String? lastUpdateDate;
  final String? lastUpdateBy;

  factory Donatur.fromJson(Map<String, dynamic> json) =>
      _$DonaturFromJson(json);

  Map<String, dynamic> toJson() => _$DonaturToJson(this);

  Donatur copyWith({
    String? iDDonatur,
    String? namaPerusahaan,
    String? nomorKontak,
    String? alamat,
    String? lastUpdateDate,
    String? lastUpdateBy,
    Donatur? donatur,
  }) {
    return Donatur(
      iDDonatur: iDDonatur ?? this.iDDonatur,
      namaPerusahaan: namaPerusahaan ?? this.namaPerusahaan,
      nomorKontak: nomorKontak ?? this.nomorKontak,
      alamat: alamat ?? this.alamat,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
    );
  }
}
