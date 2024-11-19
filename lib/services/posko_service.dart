import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../models/posko.dart';

class PoskoService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Posko>> fetchPosko() async {
    return _fetchPoskoFromLocal();
  }

  Future<List<Posko>> _fetchPoskoFromLocal() async {
    final db = await dbHelper.database;
    final records = await db.query('TBL_POSKO');

    return records.map(Posko.fromJson).toList();
  }

  Future<List<Posko>> _fetchPoskoFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('http://10.0.2.2:8000/api/posko/index');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    print(data['data']['data']);
    final listPosko = (data['data']['data'] as List)
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
