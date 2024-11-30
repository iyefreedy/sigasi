import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/utils/app_constant.dart';
import 'package:http/http.dart' as http;

import '../models/penduduk.dart';

final pendudukProvider = AsyncNotifierProvider.autoDispose
    .family<PendudukNotifier, List<Penduduk>, int?>(
  () => PendudukNotifier(),
);

class PendudukNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Penduduk>, int?> {
  @override
  Future<List<Penduduk>> build(arg) async {
    final token = (await SharedPreferences.getInstance()).getString('token');
    final url = Uri.parse(
        '${AppConstant.apiUrl}/api/penduduk-tanpa-pengungsi?idDesa=$arg');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    print(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map(Penduduk.fromJson)
        .toList();
  }
}
