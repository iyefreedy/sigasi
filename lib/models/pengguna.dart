import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/role.dart';

part 'pengguna.g.dart';

@JsonSerializable()
class Pengguna {
  const Pengguna({
    this.iDPengguna,
    this.nama,
    this.nomorKontak,
    this.iDPosko,
    this.roles,
  });

  final String? iDPengguna;
  final String? nama;
  final String? nomorKontak;
  final String? iDPosko;

  @JsonKey(name: 'roles', includeToJson: false)
  final List<Role>? roles;

  factory Pengguna.fromJson(Map<String, dynamic> json) =>
      _$PenggunaFromJson(json);

  Map<String, dynamic> toJson() => _$PenggunaToJson(this);

  Pengguna copyWith({
    String? iDPengguna,
    String? nama,
    String? nomorKontak,
    String? satuan,
    String? iDPosko,
    List<Role>? roles,
  }) {
    return Pengguna(
      iDPengguna: iDPengguna ?? this.iDPengguna,
      nama: nama ?? this.nama,
      nomorKontak: nomorKontak ?? this.nomorKontak,
      iDPosko: iDPosko ?? this.iDPosko,
      roles: roles ?? this.roles,
    );
  }
}
