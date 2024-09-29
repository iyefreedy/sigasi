import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/district/district.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'district_list_notifier.g.dart';

@riverpod
class DistrictListNotifier extends _$DistrictListNotifier {
  @override
  Future<List<District>> build() async {
    final dataService = ref.read(dataServiceProvider);
    final districts = await dataService.allDistricts();

    return districts;
  }

  Future<void> add(District district) async {
    final dataService = ref.read(dataServiceProvider);
    await dataService.saveDistrict(district);

    final newDistricts = await dataService.allDistricts();

    state = AsyncValue.data(newDistricts);
  }

  Future<void> remove(District district) async {
    final dataService = ref.read(dataServiceProvider);
    if (district.id == null) return;
    await dataService.deleteDistrict(district.id!);

    final newDistricts = await dataService.allDistricts();

    state = AsyncValue.data(newDistricts);
  }
}
