import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/bantuan.dart';
import 'package:sigasi/services/bantuan_service.dart';

class ListBantuanNotifier extends AsyncNotifier {
  final BantuanService bantuanService;
  ListBantuanNotifier(this.bantuanService);

  @override
  Future<List<Bantuan>> build() {
    return bantuanService.fetchBantuan();
  }
}
