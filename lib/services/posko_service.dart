import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/kebutuhan.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../models/posko.dart';
import '../utils/app_constant.dart';

class PoskoService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Posko>> fetchPosko() async {
    final isConnected = await isConnectedToInternet();
    if (!isConnected) {
      return _fetchPoskoFromLocal();
    }
    return _fetchPoskoFromServer();
  }

  Future<List<Posko>> _fetchPoskoFromLocal() async {
    try {
      final db = await dbHelper.database;
      final records = await db.query('TBL_POSKO');

      return records.map(Posko.fromJson).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Posko>> _fetchPoskoFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('${AppConstant.apiUrl}/api/posko');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

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

    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      final token =
          (await (SharedPreferences.getInstance())).getString('token');
      final url = Uri.parse('${AppConstant.apiUrl}/api/posko');
      await http.post(
        url,
        body: jsonEncode(newPosko.toJson()),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
      );
    }

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

    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      final token =
          (await (SharedPreferences.getInstance())).getString('token');
      final url = Uri.parse('${AppConstant.apiUrl}/api/posko/${posko.iDPosko}');
      final response = await http.put(
        url,
        body: jsonEncode(posko.toJson()),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
      );

      print(response.body);
    }

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

  Future<List<Kebutuhan>> fetchKebutuhan(String? idPosko) async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('${AppConstant.apiUrl}/api/posko/$idPosko/kebutuhan');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    print(response.body);
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final listKebutuhan = (jsonBody['data'] as List)
        .map((json) => Kebutuhan.fromJson(json as Map<String, dynamic>))
        .toList();

    return listKebutuhan;
  }
}
