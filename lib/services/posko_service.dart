import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../models/posko.dart';

class PoskoService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Posko>> fetchPosko() async {
    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      return _fetchPoskoFromLocal();
    }
    return _fetchPoskoFromServer();
  }

  Future<List<Posko>> _fetchPoskoFromLocal() async {
    try {
      final db = await dbHelper.database;
      final records = await db.query('TBL_POSKO');

      final token =
          (await (SharedPreferences.getInstance())).getString('token');
      final futures = records.map((record) => http.post(
              Uri.parse('http://10.0.2.2:8000/api/posko'),
              body: jsonEncode(record),
              headers: {
                "Authorization": 'Bearer $token',
                'Content-Type': 'application/json'
              }));

      await Future.any(futures);
      print(records);

      return records.map(Posko.fromJson).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Posko>> _fetchPoskoFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('http://10.0.2.2:8000/api/posko');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    final data = jsonDecode(response.body) as Map<String, dynamic>;

    final listPosko = (data['data'] as List)
        .map((item) => Posko.fromJson(item as Map<String, dynamic>))
        .toList();

    return listPosko;
  }

  Future<Posko> insertPosko(Posko posko) async {
    final newPosko = posko.copyWith(iDPosko: const Uuid().v4());
    final db = await dbHelper.database;
    await db.insert('TBL_POSKO', newPosko.toJson());

    return newPosko;
  }

  Future<Posko> updatePosko(Posko posko) async {
    final db = await dbHelper.database;
    await db.update(
      'TBL_POSKO',
      posko.toJson(),
      where: 'IDPosko=?',
      whereArgs: [posko.iDPosko],
    );

    return posko;
  }

  Future<Posko> deletePosko(Posko posko) async {
    final db = await dbHelper.database;
    await db.delete(
      'TBL_POSKO',
      where: 'IDPosko=?',
      whereArgs: [posko.iDPosko],
    );

    return posko;
  }
}
