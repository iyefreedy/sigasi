import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/detail_bantuan.dart';

part 'bantuan.g.dart';

@JsonSerializable()
class Bantuan {
  Bantuan({
    this.iDBantuan,
    this.iDDonatur,
    this.tanggalBantuan,
    this.lastUpdateBy,
    this.lastUpdateDate,
    this.detailBantuan = const [],
  });

  final String? iDBantuan;
  final DateTime? tanggalBantuan;
  final String? iDDonatur;
  final String? lastUpdateDate;
  final String? lastUpdateBy;
  final List<DetailBantuan> detailBantuan;

  factory Bantuan.fromJson(Map<String, dynamic> json) =>
      _$BantuanFromJson(json);

  Map<String, dynamic> toJson() => _$BantuanToJson(this);

  Bantuan copyWith(
      {String? iDBantuan,
      DateTime? tanggalBantuan,
      String? iDDonatur,
      String? lastUpdateDate,
      String? lastUpdateBy,
      List<DetailBantuan>? detailBantuan}) {
    return Bantuan(
      iDBantuan: iDBantuan ?? this.iDBantuan,
      tanggalBantuan: tanggalBantuan ?? this.tanggalBantuan,
      iDDonatur: iDDonatur ?? this.iDDonatur,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      detailBantuan: detailBantuan ?? this.detailBantuan,
    );
  }
}
