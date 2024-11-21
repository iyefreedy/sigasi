import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/bantuan.dart';
import 'package:sigasi/services/bantuan_service.dart';

final listBantuanProvider =
    AsyncNotifierProvider.autoDispose<ListBantuanNotifier, List<Bantuan>>(
        () => ListBantuanNotifier(BantuanService()));

class ListBantuanNotifier extends AutoDisposeAsyncNotifier<List<Bantuan>> {
  final BantuanService bantuanService;
  ListBantuanNotifier(this.bantuanService);

  @override
  Future<List<Bantuan>> build() {
    return bantuanService.fetchBantuan();
  }

  Future<void> save(Bantuan bantuan) async {
    print(bantuan);
    if (bantuan.iDBantuan == null) {
      await bantuanService.insertBantuan(bantuan);
    } else {}

    final updatedBantuan = await bantuanService.fetchBantuan();

    state = AsyncData(updatedBantuan);
  }
}
