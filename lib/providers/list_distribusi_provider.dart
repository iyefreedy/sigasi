import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/distribusi.dart';
import 'package:sigasi/services/distribusi_service.dart';

final listDistribusiProvider =
    AsyncNotifierProvider.autoDispose<ListDistribusiNotifier, List<Distribusi>>(
  () => ListDistribusiNotifier(DistribusiService()),
);

class ListDistribusiNotifier
    extends AutoDisposeAsyncNotifier<List<Distribusi>> {
  final DistribusiService distribusiService;

  ListDistribusiNotifier(this.distribusiService);

  @override
  FutureOr<List<Distribusi>> build() {
    return distribusiService.fetchDistribusi();
  }

  Future<void> save(Distribusi distribusi) async {
    if (distribusi.iDDistribusi == null) {
      await distribusiService.insertDistribusi(distribusi);
    } else {}

    final updatedListDistribusi = await distribusiService.fetchDistribusi();
    state = AsyncValue.data(updatedListDistribusi);
  }
}
