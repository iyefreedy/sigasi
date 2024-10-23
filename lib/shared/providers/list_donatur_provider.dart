import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sigasi/shared/providers/data_service_provider.dart';

import '../domain/models/donatur/donatur.dart';

part 'list_donatur_provider.g.dart';

@riverpod
Future<List<Donatur>> listDonatur(ListDonaturRef ref) {
  final dataService = ref.read(dataServiceProvider);

  return dataService.allDonatur();
}
