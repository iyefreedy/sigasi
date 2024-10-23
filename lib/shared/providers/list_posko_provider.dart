import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models/posko/posko.dart';
import 'data_service_provider.dart';

part 'list_posko_provider.g.dart';

@riverpod
Future<List<Posko>> listPosko(ListPoskoRef ref) async {
  final dataService = ref.read(dataServiceProvider);
  final listPosko = await dataService.allPosko();

  return listPosko;
}
