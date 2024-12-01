import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/penduduk.dart';

part 'anggota_keluarga.g.dart';

@JsonSerializable()
class AnggotaKeluarga {
  const AnggotaKeluarga({
    this.iDAnggotaKeluarga,
    this.iDKeluarga,
    this.iDPenduduk,
    this.hubungan,
    this.lastUpdateDate,
    this.lastUpdateBy,
    this.penduduk,
  });

  final String? iDAnggotaKeluarga;
  final String? iDKeluarga;
  final String? iDPenduduk;
  final String? hubungan;
  final DateTime? lastUpdateDate;
  final String? lastUpdateBy;

  @JsonKey(name: 'penduduk', includeToJson: false)
  final Penduduk? penduduk;

  factory AnggotaKeluarga.fromJson(Map<String, dynamic> json) =>
      _$AnggotaKeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$AnggotaKeluargaToJson(this);

  AnggotaKeluarga copyWith({
    String? iDAnggotaKeluarga,
    String? iDKeluarga,
    String? iDPenduduk,
    String? hubungan,
    DateTime? lastUpdateDate,
    String? lastUpdateBy,
    AnggotaKeluarga? anggota,
  }) {
    return AnggotaKeluarga(
      iDAnggotaKeluarga: iDAnggotaKeluarga ?? this.iDAnggotaKeluarga,
      iDKeluarga: iDKeluarga ?? this.iDKeluarga,
      iDPenduduk: iDPenduduk ?? this.iDPenduduk,
      hubungan: hubungan ?? this.hubungan,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
    );
  }

  @override
  String toString() {
    return '''Anggota(
  idAnggota: $iDAnggotaKeluarga,
  hubungan: $hubungan
  penduduk: $penduduk
)''';
  }
}
