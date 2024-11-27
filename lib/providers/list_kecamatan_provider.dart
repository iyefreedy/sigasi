import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sigasi/models/kecamatan.dart';

import '../utils/app_constant.dart';

final listKecamatanProvider = FutureProvider.autoDispose((_) async {
  final url = Uri.parse('${AppConstant.apiUrl}/api/kecamatan');
  final response = await http.get(url);
  final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
  final listKecamatan = (jsonBody['data'] as List)
      .map((json) => Kecamatan.fromJson(json as Map<String, dynamic>))
      .toList();
  return listKecamatan;
});
