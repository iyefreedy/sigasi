import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribusi.freezed.dart';
part 'distribusi.g.dart';

@freezed
class Distribusi with _$Distribusi {
  const factory Distribusi({
    int? idDistribusi,
  }) = _Distribusi;

  factory Distribusi.fromJson(Map<String, Object?> json) =>
      _$DistribusiFromJson(json);
}
