import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/barang.dart';

part 'detail_bantuan.g.dart';

@JsonSerializable()
class DetailBantuan {
  const DetailBantuan({
    this.iDBantuan,
    this.iDBantuanDTL,
    this.iDBarang,
    this.jumlah,
    this.barang,
  });

  final String? iDBantuanDTL;
  final String? iDBantuan;
  final String? iDBarang;
  final int? jumlah;

  @JsonKey(includeToJson: false, name: 'barang')
  final Barang? barang;

  factory DetailBantuan.fromJson(Map<String, dynamic> json) =>
      _$DetailBantuanFromJson(json);

  Map<String, dynamic> toJson() => _$DetailBantuanToJson(this);

  DetailBantuan copyWith({
    String? iDBantuanDTL,
    String? iDBantuan,
    String? iDBarang,
    int? jumlah,
    Barang? barang,
  }) =>
      DetailBantuan(
        iDBantuanDTL: iDBantuanDTL ?? this.iDBantuanDTL,
        iDBantuan: iDBantuan ?? this.iDBantuan,
        iDBarang: iDBarang ?? this.iDBarang,
        jumlah: jumlah ?? this.jumlah,
        barang: barang ?? this.barang,
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

  @override
  String toString() {
    return 'DetailBantuan(iDBantuanDTL: $iDBantuanDTL, iDBantuan: $iDBantuan, iDBarang: $iDBarang, jumlah: $jumlah)';
  }
}
