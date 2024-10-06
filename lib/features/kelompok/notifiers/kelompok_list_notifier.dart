import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/kelompok/kelompok.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'kelompok_list_notifier.g.dart';

@riverpod
class KelompokListNotifier extends _$KelompokListNotifier {
  @override
  Future<List<Kelompok>> build() async {
    final dataService = ref.read(dataServiceProvider);

    return dataService.allKelompok();
  }

  Future<void> save(Kelompok kelompok) async {
    final dataService = ref.read(dataServiceProvider);

    if (kelompok.idKelompok == null) {
      await dataService.addKelompok(kelompok);
    } else {
      await dataService.updateKelompok(kelompok);
    }

    final newPopulationGroups = await dataService.allKelompok();

    state = AsyncData(newPopulationGroups);
  }

  Future<void> remove(Kelompok kelompok) async {
    final dataService = ref.read(dataServiceProvider);
    if (kelompok.idKelompok == null) return;
    await dataService.deleteKelompok(kelompok);

    final newPopulationGroups = await dataService.allKelompok();

    state = AsyncValue.data(newPopulationGroups);
  }
}
