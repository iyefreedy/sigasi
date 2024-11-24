import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/anggota_keluarga.dart';

part 'penduduk.g.dart';

@JsonSerializable()
class Penduduk {
  const Penduduk({
    this.iDPenduduk,
    this.kTP,
    this.nama,
    this.jenisKelamin,
    this.tanggalLahir,
    this.alamat,
    this.iDDesa,
    this.iDKecamatan,
    this.iDKelompok,
    this.lastUpdateBy,
    this.lastUpdateDate,
    this.anggota,
  });

  final String? iDPenduduk;
  final String? kTP;
  final String? nama;
  final String? jenisKelamin;
  final String? tanggalLahir;
  final String? alamat;
  final int? iDDesa;
  final int? iDKecamatan;
  final String? iDKelompok;
  final String? lastUpdateBy;
  final String? lastUpdateDate;

  @JsonKey(name: 'anggota', includeToJson: false)
  final AnggotaKeluarga? anggota;

  factory Penduduk.fromJson(Map<String, dynamic> json) =>
      _$PendudukFromJson(json);

  Map<String, dynamic> toJson() => _$PendudukToJson(this);

  Penduduk copyWith({
    String? iDPenduduk,
    String? kTP,
    String? nama,
    String? jenisKelamin,
    String? tanggalLahir,
    String? alamat,
    int? iDDesa,
    int? iDKecamatan,
    String? iDKelompok,
    String? lastUpdateBy,
    String? lastUpdateDate,
  }) {
    return Penduduk(
      iDPenduduk: iDPenduduk ?? this.iDPenduduk,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      iDDesa: iDDesa ?? this.iDDesa,
      iDKecamatan: iDKecamatan ?? this.iDKecamatan,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      kTP: kTP ?? this.kTP,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      iDKelompok: iDKelompok ?? this.iDKelompok,
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
        idDesa: $iDKecamatan,
        alamat: $alamat,
        lastUpdateDate: $lastUpdateDate,
        lastUpdateBy: $lastUpdateBy,
      )
    ''';
  }
}
