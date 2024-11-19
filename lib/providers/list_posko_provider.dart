import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/posko.dart';
import 'package:sigasi/services/posko_service.dart';

final listPoskoProvider =
    AutoDisposeAsyncNotifierProvider<ListPoskoNotifier, List<Posko>>(
  () => ListPoskoNotifier(PoskoService()),
);

class ListPoskoNotifier extends AutoDisposeAsyncNotifier<List<Posko>> {
  final PoskoService poskoService;

  ListPoskoNotifier(this.poskoService);
  @override
  Future<List<Posko>> build() {
    return poskoService.fetchPosko();
  }

  Future<void> save(Posko posko) async {
    if (posko.iDPosko == null) {
      await poskoService.insertPosko(posko);
    } else {
      await poskoService.updatePosko(posko);
    }

    final updatedListPosko = await poskoService.fetchPosko();
    state = AsyncValue.data(updatedListPosko);
  }

  Future<void> remove(Posko posko) async {
    await poskoService.deletePosko(posko);

    final updatedListPosko = await poskoService.fetchPosko();
    state = AsyncValue.data(updatedListPosko);
  }
}
