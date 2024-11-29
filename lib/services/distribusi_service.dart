import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/distribusi.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../utils/app_constant.dart';
import '../utils/database_helper.dart';

class DistribusiService {
  final _databaseHelper = DatabaseHelper.getInstance();

  Future<List<Distribusi>> fetchDistribusi() async {
    final db = await _databaseHelper.database;
    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      final token = (await SharedPreferences.getInstance()).getString('token');
      final url = Uri.parse('${AppConstant.apiUrl}/api/distribusi');
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });

      print(response.body);

      final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

      final listDistribusi = (jsonBody['data'] as List)
          .map(
            (json) => Distribusi.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      await Future.wait(
        listDistribusi.map(
          (distribusi) => db.insert(
            'TBL_DISTRIBUSI',
            distribusi.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          ),
        ),
      );

      return listDistribusi;
    }

    final records = await db.query('TBL_DISTRIBUSI');

    return records.map(Distribusi.fromJson).toList();
  }

  Future<Distribusi> insertDistribusi(Distribusi distribusi) async {
    final newDistribusi = distribusi.copyWith(iDDistribusi: const Uuid().v4());
    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      final token = (await SharedPreferences.getInstance()).getString('token');
      final url = Uri.parse('${AppConstant.apiUrl}/api/distribusi');
      final response = await http.post(
        url,
        body: jsonEncode(newDistribusi.toJson()),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 201) {
        throw Exception('Stok tidak cukup');
      }
    }

    final db = await _databaseHelper.database;
    await db.insert('TBL_DISTRIBUSI', newDistribusi.toJson());

    return newDistribusi;
  }
}
