import 'package:freezed_annotation/freezed_annotation.dart';

part 'desa.freezed.dart';
part 'desa.g.dart';

@freezed
class Desa with _$Desa {
  const factory Desa({int? idKelurahan, int? idKecamatan, String? nama}) =
      _Desa;

  factory Desa.fromJson(Map<String, Object?> json) => _$DesaFromJson(json);
}
