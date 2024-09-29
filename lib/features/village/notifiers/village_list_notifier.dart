import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/village/village.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'village_list_notifier.g.dart';

@riverpod
class VillageListNotifier extends _$VillageListNotifier {
  @override
  Future<List<Village>> build() async {
    final dataService = ref.read(dataServiceProvider);
    final districts = await dataService.allVillages();

    return districts;
  }

  Future<void> save(Village village) async {
    final dataService = ref.read(dataServiceProvider);
    await dataService.createVillage(village);

    final newDistricts = await dataService.allVillages();

    state = AsyncValue.data(newDistricts);
  }

  Future<void> remove(Village village) async {
    final dataService = ref.read(dataServiceProvider);
    if (village.id == null) return;
    await dataService.deleteDistrict(village.id!);

    final newDistricts = await dataService.allVillages();

    state = AsyncValue.data(newDistricts);
  }
}
