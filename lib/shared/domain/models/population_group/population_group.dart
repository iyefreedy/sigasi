import 'package:freezed_annotation/freezed_annotation.dart';

part 'population_group.freezed.dart';
part 'population_group.g.dart';

@freezed
class PopulationGroup with _$PopulationGroup {
  const factory PopulationGroup({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PopulationGroup;

  factory PopulationGroup.fromJson(Map<String, Object?> json) =>
      _$PopulationGroupFromJson(json);
}
