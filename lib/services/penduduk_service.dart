import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../models/penduduk.dart';
import '../utils/app_constant.dart';
import '../utils/database_helper.dart';

class PendudukService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Penduduk>> fetchPenduduk({
    String? idKelompok,
    int? desa,
  }) async {
    final isConnected = await isConnectedToInternet();

    if (isConnected) {
      return _fetchPendudukFromServer(
        idDesa: desa,
        idKelompok: idKelompok,
      );
    }

    return _fetchPendudukFromLocal(
      idDesa: desa,
      idKelompok: idKelompok,
    );
  }

  Future<List<Penduduk>> _fetchPendudukFromServer({
    int? idDesa,
    String? idKelompok,
  }) async {
    final token = (await SharedPreferences.getInstance()).getString('token');
    final url = Uri.parse(
        '${AppConstant.apiUrl}/api/penduduk?idKelompok=$idKelompok&idDesa=$idDesa');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map(Penduduk.fromJson)
        .toList();
  }

  Future<List<Penduduk>> _fetchPendudukFromLocal({
    int? idDesa,
    String? idKelompok,
  }) async {
    final db = await dbHelper.database;

    if (idKelompok != null && idDesa != null) {
      final records = await db.query(
        'TBL_PENDUDUK',
        where: "IDKelompok = ? AND IDDesa = ?",
        whereArgs: [idKelompok, idDesa],
      );
      return records.map(Penduduk.fromJson).toList();
    }

    final records = await db.query('TBL_PENDUDUK');
    return records.map(Penduduk.fromJson).toList();
  }

  Future<Penduduk> insertPenduduk(Penduduk penduduk) async {
    final newPenduduk = penduduk.copyWith(iDPenduduk: const Uuid().v4());
    final db = await dbHelper.database;
    final newIdPenduduk = await db.insert('TBL_PENDUDUK', newPenduduk.toJson());
    log('$newIdPenduduk');
    return newPenduduk;
  }

  Future<Penduduk> updatePenduduk(Penduduk penduduk) async {
    final db = await dbHelper.database;
    await db.update(
      'TBL_PENDUDUK',
      penduduk.toJson(),
      where: "IDPenduduk=?",
      whereArgs: [penduduk.iDPenduduk],
    );

    return penduduk;
  }
}
