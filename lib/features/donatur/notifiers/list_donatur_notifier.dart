import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sigasi/shared/providers/data_service_provider.dart';

import '../../../shared/domain/models/donatur/donatur.dart';

part 'list_donatur_notifier.g.dart';

@riverpod
class ListDonaturNotifier extends _$ListDonaturNotifier {
  @override
  Future<List<Donatur>> build() {
    final dataService = ref.read(dataServiceProvider);
    return dataService.allDonatur();
  }

  Future<void> save(Donatur donatur) async {
    final dataService = ref.read(dataServiceProvider);

    if (donatur.idDonatur == null) {
      await dataService.addDonatur(donatur);
    } else {
      await dataService.updateDonatur(donatur);
    }

    final newListDonatur = await dataService.allDonatur();
    state = AsyncData(newListDonatur);
  }

  Future<void> remove(Donatur donatur) async {
    final dataService = ref.read(dataServiceProvider);

    await dataService.deleteDonatur(donatur);

    final newListDonatur = await future;
    state = AsyncData(newListDonatur);
  }
}
