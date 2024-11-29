import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/anggota_keluarga.dart';
import 'package:sigasi/models/keluarga.dart';
import 'package:sigasi/services/keluarga_service.dart';

final keluargaProvider = AsyncNotifierProvider.autoDispose
    .family<KeluargaNotifier, Keluarga, String>(
  () => KeluargaNotifier(KeluargaService()),
);

class KeluargaNotifier
    extends AutoDisposeFamilyAsyncNotifier<Keluarga, String> {
  final KeluargaService keluargaService;

  KeluargaNotifier(this.keluargaService);

  @override
  Future<Keluarga> build(String arg) {
    return keluargaService.fetchKeluargaById(arg);
  }

  Future<void> save({
    required AnggotaKeluarga anggota,
  }) async {
    await keluargaService.insertAnggota(
      idKeluarga: arg,
      anggota: anggota,
    );

    final updatedKeluarga = await keluargaService.fetchKeluargaById(arg);
    state = AsyncValue.data(updatedKeluarga);
  }
}
