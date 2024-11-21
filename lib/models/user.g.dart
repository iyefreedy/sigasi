// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      iDPengguna: json['IDPengguna'] as String?,
      nama: json['Nama'] as String?,
      nomorKontak: json['NomorKontak'] as String?,
      iDPosko: json['IDPosko'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'IDPengguna': instance.iDPengguna,
      'Nama': instance.nama,
      'NomorKontak': instance.nomorKontak,
      'IDPosko': instance.iDPosko,
      'roles': instance.roles,
    };
