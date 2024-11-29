import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/pengungsi.dart';
import 'package:sigasi/utils/app_constant.dart';
import 'package:sigasi/utils/connectivity.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../utils/database_helper.dart';

class PengungsiService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Pengungsi>> fetchPengungsi({
    String? idKelompok,
    String? idPosko,
  }) async {
    final isConnected = await isConnectedToInternet();
    if (isConnected) {
      final token = (await SharedPreferences.getInstance()).getString('token');
      var uri = '${AppConstant.apiUrl}/api/pengungsi';
      if (idPosko != null) {
        uri += '?idPosko=$idPosko';
      }

      if (idKelompok != null) {
        uri += '&idKelompok=$idKelompok';
      }

      final url = Uri.parse(uri);
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      });
      print(response.body);

      final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
      return (jsonBody['data'] as List)
          .cast<Map<String, dynamic>>()
          .map(Pengungsi.fromJson)
          .toList();
    }

    final db = await dbHelper.database;

    if (idKelompok != null && idPosko != null) {
      final record = await db.rawQuery(
        "SELECT TBL_PENGUNGSI.* FROM TBL_PENGUNGSI JOIN TBL_PENDUDUK ON TBL_PENDUDUK.IDPenduduk = TBL_PENGUNGSI.IDPenduduk WHERE TBL_PENGUNGSI.IDPosko='$idPosko' OR TBL_PENDUDUK.IDKelompok='$idKelompok'",
      );
      return record.map(Pengungsi.fromJson).toList();
    }

    final records = await db.query('TBL_PENGUNGSI');
    return records.map(Pengungsi.fromJson).toList();
  }

  Future<Pengungsi> insertPengungsi(Pengungsi pengungsi) async {
    final newPengungsi = pengungsi.copyWith(iDPengungsi: const Uuid().v4());
    final db = await dbHelper.database;

    await db.insert('TBL_PENGUNGSI', newPengungsi.toJson());

    try {
      final isConnected = await isConnectedToInternet();
      if (isConnected) {
        final token =
            (await SharedPreferences.getInstance()).getString('token');
        final url = Uri.parse('${AppConstant.apiUrl}/api/pengungsi');
        final response = await http.post(url,
            body: jsonEncode(newPengungsi.toJson()),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            });
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    return newPengungsi;
  }

  Future<Pengungsi> updatePengungsi(Pengungsi pengungsi) async {
    final db = await dbHelper.database;
    await db.update(
      'TBL_PENGUNGSI',
      pengungsi.toJson(),
      where: "IDPengungsi=?",
      whereArgs: [pengungsi.iDPengungsi],
    );

    try {
      final isConnected = await isConnectedToInternet();
      if (isConnected) {
        final token =
            (await SharedPreferences.getInstance()).getString('token');
        final url = Uri.parse(
            '${AppConstant.apiUrl}/api/pengungsi/${pengungsi.iDPengungsi}');
        await http.put(url, body: jsonEncode(pengungsi.toJson()), headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });
      }
    } catch (e) {
      print(e);
    }

    return pengungsi;
  }
}
