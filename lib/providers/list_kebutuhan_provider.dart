import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/kebutuhan.dart';
import 'package:sigasi/services/kebutuhan_service.dart';

final listKebutuhanProvider =
    AsyncNotifierProvider.autoDispose<ListKebutuhanNotifier, List<Kebutuhan>>(
  () => ListKebutuhanNotifier(
    KebutuhanService(),
  ),
);

class ListKebutuhanNotifier extends AutoDisposeAsyncNotifier<List<Kebutuhan>> {
  final KebutuhanService kebutuhanService;

  ListKebutuhanNotifier(this.kebutuhanService);
  @override
  Future<List<Kebutuhan>> build() {
    return kebutuhanService.fetchKebutuhan();
  }

  Future<void> save(Kebutuhan kebutuhan) async {
    if (kebutuhan.iDKebutuhan == null) {
      await kebutuhanService.insertKebutuhan(kebutuhan);
    } else {
      await kebutuhanService.updateKebutuhan(kebutuhan);
    }

    final updatedListKebutuhan = await kebutuhanService.fetchKebutuhan();
    state = AsyncValue.data(updatedListKebutuhan);
  }
}
