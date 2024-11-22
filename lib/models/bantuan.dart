import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/detail_bantuan.dart';

import 'donatur.dart';

part 'bantuan.g.dart';

@JsonSerializable(explicitToJson: true)
class Bantuan {
  Bantuan({
    this.iDBantuan,
    this.iDDonatur,
    this.tanggalBantuan,
    this.lastUpdateBy,
    this.lastUpdateDate,
    this.detailBantuan = const [],
    this.donatur,
  });

  final String? iDBantuan;
  final DateTime? tanggalBantuan;
  final String? iDDonatur;
  final String? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(name: 'bantuan_detail')
  final List<DetailBantuan> detailBantuan;

  @JsonKey(includeToJson: false, name: 'donatur')
  final Donatur? donatur;

  factory Bantuan.fromJson(Map<String, dynamic> json) =>
      _$BantuanFromJson(json);

  Map<String, dynamic> toJson() => _$BantuanToJson(this);

  Bantuan copyWith({
    String? iDBantuan,
    DateTime? tanggalBantuan,
    String? iDDonatur,
    String? lastUpdateDate,
    String? lastUpdateBy,
    List<DetailBantuan>? detailBantuan,
    Donatur? donatur,
  }) {
    return Bantuan(
      iDBantuan: iDBantuan ?? this.iDBantuan,
      tanggalBantuan: tanggalBantuan ?? this.tanggalBantuan,
      iDDonatur: iDDonatur ?? this.iDDonatur,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      detailBantuan: detailBantuan ?? this.detailBantuan,
      donatur: donatur ?? this.donatur,
    );
  }
}
