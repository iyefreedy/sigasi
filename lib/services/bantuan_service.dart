import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/barang.dart';
import 'package:sigasi/models/detail_bantuan.dart';
import 'package:sigasi/models/donatur.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:sigasi/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../models/bantuan.dart';

class BantuanService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();

  Future<List<Bantuan>> _fetchBantuanFromServer() async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('http://10.0.2.2:8000/api/bantuan');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final listBantuan = (jsonBody['data'] as List)
        .map((json) => Bantuan.fromJson(json))
        .toList();

    final listDetailBantuan =
        listBantuan.expand((bantuan) => bantuan.detailBantuan).toList();

    final db = await _databaseHelper.database;

    final queueBantuan = listBantuan.map((bantuan) => db.insert(
        'TBL_BANTUAN', bantuan.toJson()..remove('bantuan_detail'),
        conflictAlgorithm: ConflictAlgorithm.replace));
    final queueDetailBantuan = listDetailBantuan.map((detail) => db.insert(
        'TBL_BANTUAN_DTL', detail.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace));

    final queue = [...queueBantuan, ...queueDetailBantuan];
    await Future.any(queue);

    return listBantuan;
  }

  Future<List<Bantuan>> fetchBantuan() async {
    final connectivityResult = await isConnectedToInternet();

    if (!connectivityResult) {
      final db = await _databaseHelper.database;
      final records = await db.query('TBL_BANTUAN');

      final listBantuan = records.map(Bantuan.fromJson).toList();

      final futures = listBantuan.map((bantuan) async {
        final donaturRecord = await db.query('TBL_DONATUR',
            where: 'IDDonatur=?', whereArgs: [bantuan.iDDonatur]);
        if (donaturRecord.isNotEmpty) {
          return Donatur.fromJson(donaturRecord.first);
        } else {
          return null; // Handle case where donator not found
        }
      });

      final donators = await Future.wait(futures);

      for (int i = 0; i < listBantuan.length; i++) {
        listBantuan[i] = listBantuan[i].copyWith(donatur: donators[i]);
      }

      // Fetch detail bantuan
      final listDetailBantuanQueue = listBantuan.map((bantuan) => db.query(
            'TBL_BANTUAN_DTL',
            where: 'IDBantuan=?',
            whereArgs: [bantuan.iDBantuan],
          ));
      final listDetailBantuanResult = await Future.wait(listDetailBantuanQueue);

      for (int i = 0; i < listDetailBantuanResult.length; i++) {
        final listDetailBantuan =
            listDetailBantuanResult[i].map(DetailBantuan.fromJson).toList();

        for (int j = 0; j < listDetailBantuan.length; j++) {
          final records = await db.query('TBL_BARANG',
              where: 'IDBarang=?', whereArgs: [listDetailBantuan[j].iDBarang]);
          listDetailBantuan[j] = listDetailBantuan[j]
              .copyWith(barang: Barang.fromJson(records.first));
        }

        listBantuan[i] = listBantuan[i].copyWith(
          detailBantuan: listDetailBantuan,
        );
      }

      return listBantuan;
    }

    print('Fetch from server');
    return _fetchBantuanFromServer();
  }

  Future<Bantuan> insertBantuan(Bantuan bantuan) async {
    final token = (await (SharedPreferences.getInstance())).getString('token');
    final url = Uri.parse('http://10.0.2.2:8000/api/bantuan');

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
