import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/population_group/population_group.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'population_group_notifier.g.dart';

@riverpod
class PopulationGroupNotifier extends _$PopulationGroupNotifier {
  @override
  Future<List<PopulationGroup>> build() async {
    final dataService = ref.read(dataServiceProvider);

    return dataService.allPopulationGroups();
  }

  Future<void> save(PopulationGroup populationGroup) async {
    final dataService = ref.read(dataServiceProvider);

    if (populationGroup.id == null) {
      await dataService.createPopulationGroup(populationGroup);
    } else {
      await dataService.updatePopulationGroup(populationGroup);
    }

    final newPopulationGroups = await dataService.allPopulationGroups();

    state = AsyncData(newPopulationGroups);
  }

  Future<void> remove(PopulationGroup populationGroup) async {
    final dataService = ref.read(dataServiceProvider);
    if (populationGroup.id == null) return;
    await dataService.deletePopulationGroup(populationGroup.id!);

    final newPopulationGroups = await dataService.allPopulationGroups();

    state = AsyncValue.data(newPopulationGroups);
  }
}
