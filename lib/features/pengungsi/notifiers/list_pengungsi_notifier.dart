import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sigasi/shared/providers/data_service_provider.dart';

import '../../../shared/domain/models/pengungsi/pengungsi.dart';

part 'list_pengungsi_notifier.g.dart';

@riverpod
class ListPengungsiNotifier extends _$ListPengungsiNotifier {
  @override
  Future<List<Pengungsi>> build({int? idPosko, int? idKelompok}) async {
    final dataService = ref.read(dataServiceProvider);
    final listPengungsi = await dataService.allPengungsi(
      idPosko: idPosko,
      idKelompok: idKelompok,
    );
    return listPengungsi;
  }

  Future<void> save(Pengungsi pengungsi) async {
    final dataService = ref.read(dataServiceProvider);
    if (pengungsi.idPengungsi == null) {
      await dataService.addPengungsi(pengungsi);
    } else {
      await dataService.updatePengungsi(pengungsi);
    }

    final updatedListPengungsi = await future;
    state = AsyncData(updatedListPengungsi);
  }
}
