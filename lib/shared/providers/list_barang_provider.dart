import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sigasi/shared/providers/data_service_provider.dart';

import '../domain/models/barang/barang.dart';
part 'list_barang_provider.g.dart';

@riverpod
Future<List<Barang>> listBarang(ListBarangRef ref) {
  final dataService = ref.read(dataServiceProvider);
  return dataService.allBarang();
}
