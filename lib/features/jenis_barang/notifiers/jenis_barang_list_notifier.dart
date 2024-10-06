import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/jenis_barang/jenis_barang.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'jenis_barang_list_notifier.g.dart';

@riverpod
class JenisBarangListNotifier extends _$JenisBarangListNotifier {
  @override
  Future<List<JenisBarang>> build() async {
    final dataService = ref.read(dataServiceProvider);
    final jenisBarangList = dataService.allJenisBarang();

    return jenisBarangList;
  }

  Future<void> save(JenisBarang jenisBarang) async {
    final dataService = ref.read(dataServiceProvider);

    if (jenisBarang.idJenisBarang == null) {
      await dataService.addJenisBarang(jenisBarang);
    } else {
      await dataService.updateJenisBarang(jenisBarang);
    }

    final newJenisBarangList = await dataService.allJenisBarang();

    state = AsyncData(newJenisBarangList);
  }

  Future<void> remove(JenisBarang jenisBarang) async {
    final dataService = ref.read(dataServiceProvider);
    await dataService.deleteJenisBarang(jenisBarang);

    final newItemCategories = await dataService.allJenisBarang();

    state = AsyncValue.data(newItemCategories);
  }
}
