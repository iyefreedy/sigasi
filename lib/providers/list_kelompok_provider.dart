import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/kelompok_service.dart';

final listKelompokProvider = FutureProvider.autoDispose(
  (_) => KelompokService().fetchKelompok(),
);
