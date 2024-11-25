import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/kebutuhan.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class KebutuhanService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();

  Future<List<Kebutuhan>> fetchKebutuhan() async {
    final isConnected = await isConnectedToInternet();
    if (!isConnected) {
      return _fetchKebutuhanFromLocal();
    }

    return _fetchKebutuhanFromServer();
  }

  Future<List<Kebutuhan>> _fetchKebutuhanFromServer() async {
    final token = (await SharedPreferences.getInstance()).getString('token');

    final url = Uri.parse('https://sigasi.my.id/api/kebutuhan');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonBody);
    final listKebutuhan = (jsonBody['data'] as List)
        .map(
          (json) => Kebutuhan.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    return listKebutuhan;
  }

  Future<List<Kebutuhan>> _fetchKebutuhanFromLocal() async {
    final db = await _databaseHelper.database;
    final records = await db.query('TBL_KEBUTUHAN');
    print(records);

    return records.map(Kebutuhan.fromJson).toList();
  }

  Future<Kebutuhan> insertKebutuhan(Kebutuhan kebutuhan) async {
    final db = await _databaseHelper.database;
    final newKebutuhan = kebutuhan.copyWith(iDKebutuhan: const Uuid().v4());

    await db.insert('TBL_KEBUTUHAN', newKebutuhan.toJson());

    final isConnected = await isConnectedToInternet();

    if (isConnected) {
      final token = (await SharedPreferences.getInstance()).getString('token');

      final url = Uri.parse('https://sigasi.my.id/api/kebutuhan');
      final response = await http.post(
        url,
        body: jsonEncode(newKebutuhan.toJson()),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print(response.body);
    }

    return newKebutuhan;
  }

  Future<Kebutuhan> updateKebutuhan(Kebutuhan kebutuhan) async {
    final db = await _databaseHelper.database;

    await db.update(
      'TBL_KEBUTUHAN',
      kebutuhan.toJson(),
      where: 'IDKebutuhan=?',
      whereArgs: [kebutuhan.iDKebutuhan],
    );

    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      final token = (await SharedPreferences.getInstance()).getString('token');

      final url = Uri.parse('https://sigasi.my.id/api/kebutuhan');
      await http.post(url, body: jsonEncode(kebutuhan.toJson()), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
    }

    return kebutuhan;
  }
}
