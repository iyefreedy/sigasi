import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/kebutuhan.dart';
import 'package:sigasi/services/posko_service.dart';

final kebutuhanPoskoProvider = AsyncNotifierProvider.autoDispose
    .family<KebutuhanPoskoNotifier, List<Kebutuhan>, String?>(
  () => KebutuhanPoskoNotifier(PoskoService()),
);

class KebutuhanPoskoNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Kebutuhan>, String?> {
  final PoskoService poskoService;

  KebutuhanPoskoNotifier(this.poskoService);

  @override
  Future<List<Kebutuhan>> build(String? arg) async {
    if (arg == null) return [];
    return poskoService.fetchKebutuhan(arg);
  }
}
