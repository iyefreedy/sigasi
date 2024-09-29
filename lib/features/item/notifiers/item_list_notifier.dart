import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/item/item.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'item_list_notifier.g.dart';

@riverpod
class ItemListNotifier extends _$ItemListNotifier {
  @override
  Future<List<Item>> build() {
    final dataService = ref.read(dataServiceProvider);

    return dataService.allItems();
  }

  Future<void> save(Item item) async {
    final dataService = ref.read(dataServiceProvider);

    if (item.id == null) {
      await dataService.createItem(item);
    } else {
      await dataService.updateItem(item);
    }

    final newItems = await dataService.allItems();
    state = AsyncData(newItems);
  }

  Future<void> remove(Item item) async {
    final dataService = ref.read(dataServiceProvider);

    if (item.id == null) return;

    await dataService.deleteItem(item.id!);

    final newItems = await dataService.allItems();
    state = AsyncData(newItems);
  }
}
