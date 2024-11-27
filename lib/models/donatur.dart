import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/bantuan.dart';

part 'donatur.g.dart';

@JsonSerializable()
class Donatur {
  const Donatur({
    this.iDDonatur,
    this.namaPerusahaan,
    this.namaKontak,
    this.nomorKontak,
    this.alamat,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.bantuan,
  });

  final String? iDDonatur;
  final String? namaPerusahaan;
  final String? namaKontak;
  final String? nomorKontak;
  final String? alamat;
  final String? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(name: 'bantuan', includeToJson: false)
  final List<Bantuan>? bantuan;

  factory Donatur.fromJson(Map<String, dynamic> json) =>
      _$DonaturFromJson(json);

  Map<String, dynamic> toJson() => _$DonaturToJson(this);

  Donatur copyWith({
    String? iDDonatur,
    String? namaPerusahaan,
    String? nomorKontak,
    String? namaKontak,
    String? alamat,
    String? lastUpdateDate,
    String? lastUpdateBy,
    List<Bantuan>? bantuan,
  }) {
    return Donatur(
      iDDonatur: iDDonatur ?? this.iDDonatur,
      namaPerusahaan: namaPerusahaan ?? this.namaPerusahaan,
      nomorKontak: nomorKontak ?? this.nomorKontak,
      namaKontak: namaKontak ?? this.namaKontak,
      alamat: alamat ?? this.alamat,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      bantuan: bantuan ?? this.bantuan,
    );
  }
}
