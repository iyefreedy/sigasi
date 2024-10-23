import 'package:freezed_annotation/freezed_annotation.dart';

part 'anggaran.freezed.dart';
part 'anggaran.g.dart';

@freezed
class Anggaran with _$Anggaran {
  const factory Anggaran({int? idAnggaran}) = _Anggaran;

  factory Anggaran.fromJson(Map<String, Object?> json) =>
      _$AnggaranFromJson(json);
}
