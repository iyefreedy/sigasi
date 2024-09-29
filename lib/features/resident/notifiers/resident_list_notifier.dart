import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/resident/resident.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'resident_list_notifier.g.dart';

@riverpod
class ResidentListNotifier extends _$ResidentListNotifier {
  @override
  Future<List<Resident>> build() async {
    final dataService = ref.read(dataServiceProvider);
    final residents = await dataService.allResidents();

    return residents;
  }

  Future<void> save(Resident resident) async {
    final dataService = ref.read(dataServiceProvider);

    if (resident.id == null) {
      await dataService.createResident(resident);
    } else {
      await dataService.updateResident(resident);
    }

    final newResidents = await dataService.allResidents();
    state = AsyncData(newResidents);
  }

  Future<void> remove(Resident resident) async {
    final dataService = ref.read(dataServiceProvider);

    if (resident.id == null) {
      await dataService.deleteResident(resident.id!);
    }

    final newResidents = await dataService.allResidents();
    state = AsyncData(newResidents);
  }
}
