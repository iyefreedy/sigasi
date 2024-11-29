import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/pengungsi_service.dart';

import '../models/pengungsi.dart';

final listPengungsiProvider = AsyncNotifierProvider.autoDispose
    .family<ListPengungsiNotifier, List<Pengungsi>, ParamArgument>(
  () => ListPengungsiNotifier(PengungsiService()),
);

typedef ParamArgument = ({String? idKelompok, String? idPosko});

class ListPengungsiNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Pengungsi>, ParamArgument> {
  final PengungsiService pengungsiService;

  ListPengungsiNotifier(this.pengungsiService);
  @override
  Future<List<Pengungsi>> build(ParamArgument arg) {
    return pengungsiService.fetchPengungsi(
      idKelompok: arg.idKelompok,
      idPosko: arg.idPosko,
    );
  }

  Future<void> save(Pengungsi pengungsi) async {
    if (pengungsi.iDPengungsi == null) {
      await pengungsiService.insertPengungsi(pengungsi);
    } else {
      await pengungsiService.updatePengungsi(pengungsi);
    }

    final futures = await pengungsiService.fetchPengungsi(
      idKelompok: arg.idKelompok,
      idPosko: arg.idPosko,
    );

    state = AsyncData(futures);
  }
}
