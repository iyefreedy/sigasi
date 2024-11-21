import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/barang.dart';
import 'package:sigasi/services/barang_service.dart';

final listBarangProvider =
    AutoDisposeAsyncNotifierProvider<ListBarangNotifier, List<Barang>>(
  () => ListBarangNotifier(BarangService()),
);

class ListBarangNotifier extends AutoDisposeAsyncNotifier<List<Barang>> {
  final BarangService barangService;
  ListBarangNotifier(this.barangService);

  @override
  Future<List<Barang>> build() {
    return barangService.fetchBarang();
  }
}
