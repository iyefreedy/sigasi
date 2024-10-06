import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/posko/posko.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'posko_list_notifier.g.dart';

@riverpod
class PoskoListNotifier extends _$PoskoListNotifier {
  @override
  Future<List<Posko>> build() async {
    final dataService = ref.read(dataServiceProvider);

    final poskoList = await dataService.allPosko();

    return poskoList;
  }

  Future<void> save(Posko posko) async {
    final dataService = ref.read(dataServiceProvider);

    if (posko.idPosko == null) {
      await dataService.addPosko(posko);
    } else {
      await dataService.updatePosko(posko);
    }

    final newPoskoList = await dataService.allPosko();

    state = AsyncData(newPoskoList);
  }
}
