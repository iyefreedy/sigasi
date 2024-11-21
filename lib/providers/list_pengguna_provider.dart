import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/pengguna_service.dart';

final listPenggunaProvider = AutoDisposeFutureProvider(
  (_) {
    return PenggunaService().fetchPengguna();
  },
);
