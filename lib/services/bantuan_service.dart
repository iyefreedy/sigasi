import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;

import '../models/bantuan.dart';

class BantuanService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();

  Future<List<Bantuan>> fetchBantuan() async {
    // final db = await _databaseHelper.database;
    // final records = await db.query('TBL_BANTUAN');

    // return records.map(Bantuan.fromJson).toList();
    return [];
  }

  Future<Bantuan> insertBantuan(Bantuan bantuan) async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('http://10.0.2.2:8000/api/bantuan');

    print(bantuan.toJson());

    final response = await http.post(
      url,
      body: jsonEncode(bantuan.toJson()),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    if (response.statusCode != 201) {
      throw Exception(response.body);
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final newBantuan = Bantuan.fromJson(jsonBody);
    return newBantuan;
  }
}
