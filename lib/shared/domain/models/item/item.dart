import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    int? id,
    required int itemCategoryId,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}
