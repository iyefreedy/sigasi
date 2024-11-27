import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/pengguna.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../utils/app_constant.dart';

class PenggunaService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Pengguna>> fetchPengguna() async {
    final connectivityResult = (await Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      print('Fetch from local storage');
      return _fetchPenggunaFromLocal();
    }

    print('Fetch from server storage');
    return _fetchPenggunaFromServer();
  }

  Future<Pengguna> insertPengguna(Pengguna pengguna) async {
    final newPengguna = pengguna.copyWith(iDPengguna: const Uuid().v4());

    final db = await dbHelper.database;
    await db.insert('TBL_PENGGUNA', pengguna.toJson());

    return newPengguna;
  }

  Future<List<Pengguna>> _fetchPenggunaFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('${AppConstant.apiUrl}/api/user-management');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    print(jsonBody);

    final userList = (jsonBody['data'] as List)
        .map((json) => Pengguna.fromJson(json as Map<String, dynamic>))
        .toList();

    final db = await dbHelper.database;
    final futureUser = userList.map((user) => db.insert(
          'TBL_PENGGUNA',
          user.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ));

    await Future.any(futureUser);

    return userList;
  }

  Future<List<Pengguna>> _fetchPenggunaFromLocal() async {
    final db = await dbHelper.database;
    final records = await db.query('TBL_PENGGUNA');

    return records.map(Pengguna.fromJson).toList();
  }
}
