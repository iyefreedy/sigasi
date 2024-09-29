import 'package:freezed_annotation/freezed_annotation.dart';

part 'village.freezed.dart';
part 'village.g.dart';

@freezed
class Village with _$Village {
  const factory Village({
    int? id,
    required int districtId,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Village;

  factory Village.fromJson(Map<String, Object?> json) =>
      _$VillageFromJson(json);
}
