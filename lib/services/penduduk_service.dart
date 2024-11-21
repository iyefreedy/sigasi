import 'dart:developer';

import 'package:uuid/uuid.dart';

import '../models/penduduk.dart';
import '../utils/database_helper.dart';

class PendudukService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Penduduk>> fetchPenduduk({
    String? idKelompok,
    String? desa,
  }) async {
    final db = await dbHelper.database;

    if (idKelompok != null && desa != null) {
      final records = await db.query(
        'TBL_PENDUDUK',
        where: "IDKelompok = ? AND Desa LIKE ?",
        whereArgs: [idKelompok, "%$desa%"],
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
