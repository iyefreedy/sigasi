import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/services/penduduk_service.dart';

typedef PendudukParams = ({String? desa, String? idKelompok});

final listPendududukProvider = AsyncNotifierProvider.autoDispose
    .family<ListPendudukNotifier, List<Penduduk>, PendudukParams>(
  () => ListPendudukNotifier(PendudukService()),
);

class ListPendudukNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Penduduk>, PendudukParams> {
  final PendudukService pendudukService;

  ListPendudukNotifier(this.pendudukService);

  @override
  Future<List<Penduduk>> build(PendudukParams arg) {
    return pendudukService.fetchPenduduk(
      desa: arg.desa,
      idKelompok: arg.idKelompok,
    );
  }

  Future<void> save(Penduduk penduduk) async {
    if (penduduk.iDPenduduk == null) {
      await pendudukService.insertPenduduk(penduduk);
    } else {
      await pendudukService.updatePenduduk(penduduk);
    }
  }
}
