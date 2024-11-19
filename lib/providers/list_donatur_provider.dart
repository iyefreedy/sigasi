import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/donatur_service.dart';

import '../models/donatur.dart';

final listDonaturProvider =
    AutoDisposeAsyncNotifierProvider<ListDonaturNotifier, List<Donatur>>(
  () => ListDonaturNotifier(DonaturService()),
);

class ListDonaturNotifier extends AutoDisposeAsyncNotifier<List<Donatur>> {
  final DonaturService donaturService;

  ListDonaturNotifier(this.donaturService);

  @override
  Future<List<Donatur>> build() {
    return donaturService.fetchDonatur();
  }

  Future<void> save(Donatur donatur) async {
    if (donatur.iDDonatur == null) {
      await donaturService.insertDonatur(donatur);
    } else {
      await donaturService.updateDonatur(donatur);
    }

    final updatedListDonatur = await donaturService.fetchDonatur();

    state = AsyncData(updatedListDonatur);
  }

  Future<void> remove(Donatur donatur) async {
    await donaturService.deleteDonatur(donatur);

    final updatedListDonatur = await donaturService.fetchDonatur();

    state = AsyncData(updatedListDonatur);
  }
}
