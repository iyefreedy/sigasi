import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sigasi/models/desa.dart';

final listDesaProvider = FutureProvider.autoDispose.family<List<Desa>, int?>(
  (ref, arg) async {
    if (arg == null) return [];

    final url = Uri.parse('https://sigasi.my.id/api/$arg/desa');
    final response = await http.get(url);
    print(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final listDesa = (jsonBody['data'] as List)
        .map((json) => Desa.fromJson(json as Map<String, dynamic>))
        .toList();
    return listDesa;
  },
);
