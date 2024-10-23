import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sigasi/shared/providers/data_service_provider.dart';

import '../../../shared/domain/models/kebutuhan/kebutuhan.dart';

part 'list_kebutuhan_notifier.g.dart';

@riverpod
class ListKebutuhanNotifier extends _$ListKebutuhanNotifier {
  @override
  Future<List<Kebutuhan>> build({int? idPosko}) {
    final dataService = ref.read(dataServiceProvider);
    return dataService.allKebutuhan(idPosko: idPosko);
  }

  Future<void> save(Kebutuhan kebutuhan) async {
    final dataService = ref.read(dataServiceProvider);

    if (kebutuhan.idKebutuhan == null) {
      await dataService.addKebutuhan(kebutuhan);
    } else {
      await dataService.updateKebutuhan(kebutuhan);
    }

    final newListKebutuhan = await future;

    state = AsyncData(newListKebutuhan);
  }

  Future<void> remove(Kebutuhan kebutuhan) async {}
}
