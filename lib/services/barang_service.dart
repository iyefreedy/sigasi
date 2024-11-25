import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/barang.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class BarangService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();

  Future<List<Barang>> fetchBarang() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      final db = await _databaseHelper.database;
      final records = await db.query('TBL_BARANG');

      return records.map(Barang.fromJson).toList();
    }

    return _fetchBarangFromServer();
  }

  Future<List<Barang>> _fetchBarangFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('https://sigasi.my.id/api/barang');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final donaturList = (jsonBody['data'] as List)
        .map((json) => Barang.fromJson(json as Map<String, dynamic>))
        .toList();

    final db = await _databaseHelper.database;
    if (donaturList.isNotEmpty) {
      final futureUser = donaturList.map((donatur) => db.insert(
            'TBL_BARANG',
            donatur.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          ));
      await Future.any(futureUser);
    }

    print(donaturList);
    return donaturList;
  }
}
