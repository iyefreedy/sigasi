import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/keluarga_service.dart';

import '../models/keluarga.dart';

final listKeluargaProvider = AsyncNotifierProvider.autoDispose
    .family<ListKeluargaNotifier, List<Keluarga>, ListKeluargaParam>(
  () => ListKeluargaNotifier(KeluargaService()),
);

typedef ListKeluargaParam = ({int idKecamatan, int idDesa});

class ListKeluargaNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Keluarga>, ListKeluargaParam> {
  final KeluargaService keluargaService;

  ListKeluargaNotifier(this.keluargaService);

  @override
  Future<List<Keluarga>> build(ListKeluargaParam arg) {
    return keluargaService.fetchKeluarga(
      idKecamatan: arg.idKecamatan,
      idDesa: arg.idDesa,
    );
  }

  Future<void> save(Keluarga keluarga) async {
    await keluargaService.insertKeluarga(keluarga);

    final updatedListKeluarga = await keluargaService.fetchKeluarga(
      idKecamatan: keluarga.iDKecamatan!,
      idDesa: keluarga.iDDesa!,
    );

    state = AsyncValue.data(updatedListKeluarga);
  }
}
