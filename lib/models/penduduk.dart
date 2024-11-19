import 'package:json_annotation/json_annotation.dart';

part 'penduduk.g.dart';

@JsonSerializable()
class Penduduk {
  const Penduduk({
    this.iDPenduduk,
    this.desa,
    this.jenisKelamin,
    this.kTP,
    this.iDKelompok,
    this.lastUpdateBy,
    this.lastUpdateDate,
    this.nama,
    this.tanggalLahir,
    this.alamat,
  });

  final String? iDPenduduk;
  final String? jenisKelamin;
  final String? desa;
  final String? tanggalLahir;
  final String? kTP;
  final String? nama;
  final String? alamat;
  final String? iDKelompok;
  final String? lastUpdateBy;
  final String? lastUpdateDate;

  factory Penduduk.fromJson(Map<String, dynamic> json) =>
      _$PendudukFromJson(json);

  Map<String, dynamic> toJson() => _$PendudukToJson(this);

  Penduduk copyWith({
    String? iDPenduduk,
    String? kTP,
    String? nama,
    String? jenisKelamin,
    String? desa,
    String? tanggalLahir,
    String? alamat,
    String? kelompok,
    String? lastUpdateBy,
    String? lastUpdateDate,
  }) {
    return Penduduk(
      iDPenduduk: iDPenduduk ?? this.iDPenduduk,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      desa: desa ?? this.desa,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      kTP: kTP ?? this.kTP,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      iDKelompok: kelompok ?? this.iDKelompok,
      lastUpdateBy: lastUpdateBy ?? this.lastUpdateBy,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
    );
  }

  @override
  String toString() {
    return '''
      Penduduk(
        iDPenduduk: $iDPenduduk,
        nama: $nama,
        jenisKelamin: $jenisKelamin,
        kTP: $kTP,
        tanggalLahir: $tanggalLahir,
        kelompok: $iDKelompok,
        desa: $desa,
        alamat: $alamat,
        lastUpdateDate: $lastUpdateDate,
        lastUpdateBy: $lastUpdateBy,
      )
    ''';
  }
}
