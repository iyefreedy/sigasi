import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_category.freezed.dart';
part 'item_category.g.dart';

@freezed
class ItemCategory with _$ItemCategory {
  const factory ItemCategory({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ItemCategory;

  factory ItemCategory.fromJson(Map<String, Object?> json) =>
      _$ItemCategoryFromJson(json);
}
