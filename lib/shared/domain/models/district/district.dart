import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';
part 'district.g.dart';

@freezed
class District with _$District {
  const factory District({
    int? id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _District;

  factory District.fromJson(Map<String, Object?> json) =>
      _$DistrictFromJson(json);
}
