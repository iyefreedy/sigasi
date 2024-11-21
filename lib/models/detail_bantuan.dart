import 'package:json_annotation/json_annotation.dart';

part 'detail_bantuan.g.dart';

@JsonSerializable()
class DetailBantuan {
  const DetailBantuan({
    this.iDBantuan,
    this.iDBantuanDTL,
    this.iDBarang,
    this.jumlah,
  });

  final String? iDBantuanDTL;
  final String? iDBantuan;
  final String? iDBarang;
  final int? jumlah;

  factory DetailBantuan.fromJson(Map<String, dynamic> json) =>
      _$DetailBantuanFromJson(json);

  DetailBantuan copyWith({
    String? iDBantuanDTL,
    String? iDBantuan,
    String? iDBarang,
    int? jumlah,
  }) =>
      DetailBantuan(
        iDBantuanDTL: iDBantuanDTL ?? this.iDBantuanDTL,
        iDBantuan: iDBantuan ?? this.iDBantuan,
        iDBarang: iDBarang ?? this.iDBarang,
        jumlah: jumlah ?? this.jumlah,
      );

  @override
  bool operator ==(Object other) {
    return other is DetailBantuan &&
        other.iDBantuanDTL == iDBantuanDTL &&
        other.iDBantuan == iDBantuan &&
        other.iDBarang == iDBarang &&
        other.jumlah == jumlah;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, iDBantuanDTL, iDBantuan, iDBarang, jumlah);
}
