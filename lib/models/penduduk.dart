import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/anggota_keluarga.dart';
import 'package:sigasi/models/kelompok.dart';

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
    this.kelompok,
  });

  final String? iDPenduduk;
  final String? kTP;
  final String? nama;
  final String? jenisKelamin;
  final DateTime? tanggalLahir;
  final String? alamat;
  final int? iDDesa;
  final int? iDKecamatan;
  final String? iDKelompok;
  final String? lastUpdateBy;
  final String? lastUpdateDate;

  @JsonKey(name: 'anggota', includeToJson: false)
  final AnggotaKeluarga? anggota;

  @JsonKey(name: 'kelompok', includeToJson: false)
  final Kelompok? kelompok;

  factory Penduduk.fromJson(Map<String, dynamic> json) =>
      _$PendudukFromJson(json);

  Map<String, dynamic> toJson() => _$PendudukToJson(this);

  Penduduk copyWith({
    String? iDPenduduk,
    String? kTP,
    String? nama,
    String? jenisKelamin,
    DateTime? tanggalLahir,
    String? alamat,
    int? iDDesa,
    int? iDKecamatan,
    String? iDKelompok,
    String? lastUpdateBy,
    String? lastUpdateDate,
    Kelompok? kelompok,
    AnggotaKeluarga? anggota,
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
      kelompok: kelompok ?? this.kelompok,
      anggota: anggota ?? this.anggota,
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

  @override
  bool operator ==(Object other) {
    return other is Penduduk &&
        other.iDPenduduk == iDPenduduk &&
        other.kTP == kTP;
  }

  @override
  int get hashCode => Object.hash(runtimeType, iDPenduduk, kTP);
}
