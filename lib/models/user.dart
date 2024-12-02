import 'package:json_annotation/json_annotation.dart';
import 'package:sigasi/models/role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
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
  @JsonKey(name: 'roles')
  final List<Role>? roles;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is User && other.iDPengguna == iDPengguna;
  }

  @override
  int get hashCode => Object.hash(runtimeType, iDPengguna);
}
