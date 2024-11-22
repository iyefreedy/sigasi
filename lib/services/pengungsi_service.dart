import 'package:sigasi/models/pengungsi.dart';
import 'package:uuid/uuid.dart';

import '../utils/database_helper.dart';

class PengungsiService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Pengungsi>> fetchPengungsi({
    String? idKelompok,
    String? idPosko,
  }) async {
    final db = await dbHelper.database;

    if (idKelompok != null && idPosko != null) {
      final record = await db.rawQuery(
        "SELECT TBL_PENGUNGSI.* FROM TBL_PENGUNGSI JOIN TBL_PENDUDUK ON TBL_PENDUDUK.IDPenduduk = TBL_PENGUNGSI.IDPenduduk AND TBL_PENDUDUK.IDKelompok='$idKelompok' WHERE TBL_PENGUNGSI.IDPosko='$idPosko'",
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

    return pengungsi;
  }
}
