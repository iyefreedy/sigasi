import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models/desa/desa.dart';
import 'data_service_provider.dart';

part 'list_desa_provider.g.dart';

@riverpod
Future<List<Desa>> listDesa(ListDesaRef ref) async {
  final dataService = ref.read(dataServiceProvider);
  final listDesa = await dataService.allDesa();
  return listDesa;
}
