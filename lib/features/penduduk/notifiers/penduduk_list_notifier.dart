import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/penduduk/penduduk.dart';
import '../../../shared/providers/data_service_provider.dart';

part 'penduduk_list_notifier.g.dart';

@riverpod
class PendudukListNotifier extends _$PendudukListNotifier {
  @override
  Future<List<Penduduk>> build({
    int? idKelompok,
    int? idKelurahan,
  }) async {
    final dataService = ref.read(dataServiceProvider);
    final listPenduduk = await dataService.allPenduduk(
      idKelurahan: idKelurahan,
      idKelompok: idKelompok,
    );

    return listPenduduk;
  }

  Future<void> save(Penduduk penduduk) async {
    final dataService = ref.read(dataServiceProvider);

    if (penduduk.idPenduduk == null) {
      await dataService.addPenduduk(penduduk);
    } else {
      await dataService.updatePenduduk(penduduk);
    }

    final newListPenduduk = await dataService.allPenduduk(
      idKelurahan: idKelurahan,
      idKelompok: idKelompok,
    );

    state = AsyncData(newListPenduduk);
  }

  Future<void> remove(Penduduk penduduk) async {
    final dataService = ref.read(dataServiceProvider);

    if (penduduk.idPenduduk == null) {
      await dataService.deletePenduduk(penduduk);
    }

    final newListPenduduk = await dataService.allPenduduk(
      idKelurahan: idKelurahan,
      idKelompok: idKelompok,
    );
    state = AsyncData(newListPenduduk);
  }
}
