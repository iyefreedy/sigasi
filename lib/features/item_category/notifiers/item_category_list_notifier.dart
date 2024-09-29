import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/item_category/item_category.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'item_category_list_notifier.g.dart';

@riverpod
class ItemCategoryListNotifier extends _$ItemCategoryListNotifier {
  @override
  Future<List<ItemCategory>> build() async {
    final dataService = ref.read(dataServiceProvider);
    final itemCategories = dataService.allItemCategories();

    return itemCategories;
  }

  Future<void> save(ItemCategory itemCategory) async {
    final dataService = ref.read(dataServiceProvider);

    if (itemCategory.id == null) {
      await dataService.createItemCategory(itemCategory);
    } else {
      await dataService.updateItemCategory(itemCategory);
    }

    final newItemCategories = await dataService.allItemCategories();

    state = AsyncData(newItemCategories);
  }

  Future<void> remove(ItemCategory itemCategory) async {
    final dataService = ref.read(dataServiceProvider);
    if (itemCategory.id == null) return;
    await dataService.deleteItemCategory(itemCategory.id!);

    final newItemCategories = await dataService.allItemCategories();

    state = AsyncValue.data(newItemCategories);
  }
}
