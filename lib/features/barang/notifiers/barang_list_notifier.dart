import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/barang/barang.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'barang_list_notifier.g.dart';

@riverpod
class BarangListNotifier extends _$BarangListNotifier {
  @override
  Future<List<Barang>> build() {
    final dataService = ref.read(dataServiceProvider);

    return dataService.allBarang();
  }

  Future<void> save(Barang barang) async {
    final dataService = ref.read(dataServiceProvider);

    if (barang.idBarang == null) {
      await dataService.addBarang(barang);
    } else {
      await dataService.updateBarang(barang);
    }

    final newItems = await dataService.allBarang();
    state = AsyncData(newItems);
  }

  Future<void> remove(Barang barang) async {
    final dataService = ref.read(dataServiceProvider);

    await dataService.deleteBarang(barang);

    final newItems = await dataService.allBarang();
    state = AsyncData(newItems);
  }
}
