import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/donatur.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../utils/database_helper.dart';

class DonaturService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Donatur>> fetchDonatur() async {
    final connectivityResult = (await Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return _fetchDonaturFromLocal();
    }

    return _fetchDonaturFromServer();
  }

  Future<List<Donatur>> _fetchDonaturFromLocal() async {
    final db = await dbHelper.database;

    final records = await db.query('TBL_DONATUR');
    return records.map(Donatur.fromJson).toList();
  }

  Future<List<Donatur>> _fetchDonaturFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('https://sigasi.my.id/api/donatur');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final donaturList = (jsonBody['data'] as List)
        .map((json) => Donatur.fromJson(json as Map<String, dynamic>))
        .toList();

    final db = await dbHelper.database;
    if (donaturList.isNotEmpty) {
      final futureUser = donaturList.map((donatur) => db.insert(
            'TBL_DONATUR',
            donatur.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          ));
      await Future.any(futureUser);
    }

    print(donaturList);
    return donaturList;
  }

  Future<Donatur> insertDonatur(Donatur donatur) async {
    print('Fetch from local storage');
    await _insertDonaturToLocal(donatur);

    print('Fetch from server storage');
    await _insertDonaturToServer(donatur);

    return donatur;
  }

  Future<Donatur> _insertDonaturToLocal(Donatur donatur) async {
    final newDonatur = donatur.copyWith(iDDonatur: const Uuid().v4());
    final db = await dbHelper.database;
    await db.insert('TBL_DONATUR', newDonatur.toJson());
    return donatur;
  }

  Future<Donatur> _insertDonaturToServer(Donatur donatur) async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('https://sigasi.my.id/api/donatur');

    final response = await http.post(url,
        body: jsonEncode(donatur.toJson()),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final dataDonatur =
        Donatur.fromJson(jsonBody['data'] as Map<String, dynamic>);

    return dataDonatur;
  }

  Future<Donatur> updateDonatur(Donatur donatur) async {
    try {
      await _updateDonaturToLocal(donatur);

      await _updateDonaturToServer(donatur);

      return donatur;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Donatur> _updateDonaturToLocal(Donatur donatur) async {
    final db = await dbHelper.database;
    await db.update(
      'TBL_DONATUR',
      donatur.toJson(),
      where: "IDDonatur=?",
      whereArgs: [donatur.iDDonatur],
    );

    return donatur;
  }

  Future<Donatur> _updateDonaturToServer(Donatur donatur) async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse(
      'https://sigasi.my.id/api/donatur/${donatur.iDDonatur}',
    );

    final response = await http.put(url,
        body: jsonEncode(donatur.toJson()),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final dataDonatur =
        Donatur.fromJson(jsonBody['data'] as Map<String, dynamic>);

    return dataDonatur;
  }

  Future<void> deleteDonatur(Donatur donatur) async {
    final db = await dbHelper.database;
    await db.delete(
      'TBL_DONATUR',
      where: "IDDonatur=?",
      whereArgs: [donatur.iDDonatur],
    );
  }
}
