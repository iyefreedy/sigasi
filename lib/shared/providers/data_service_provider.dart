import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data_service.dart';
import '../data/local_data_service.dart';

part 'data_service_provider.g.dart';

@riverpod
DataService dataService(DataServiceRef ref) {
  return LocalDataService();
}
