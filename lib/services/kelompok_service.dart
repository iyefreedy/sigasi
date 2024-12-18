import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/kelompok.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;

import '../utils/app_constant.dart';

class KelompokService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Kelompok>> fetchKelompok() async {
    final token = (await SharedPreferences.getInstance()).getString('token');
    final url = Uri.parse('${AppConstant.apiUrl}/api/kelompok');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final listKelompok = (jsonBody['data'] as List)
        .map(
          (json) => Kelompok.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    return listKelompok;
  }
}
