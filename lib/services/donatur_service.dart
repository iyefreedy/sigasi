import 'package:sigasi/models/donatur.dart';
import 'package:uuid/uuid.dart';

import '../utils/database_helper.dart';

class DonaturService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Donatur>> fetchDonatur() async {
    final db = await dbHelper.database;

    final records = await db.query('TBL_DONATUR');
    return records.map(Donatur.fromJson).toList();
  }

  Future<Donatur> insertDonatur(Donatur donatur) async {
    final newDonatur = donatur.copyWith(iDDonatur: const Uuid().v4());
    final db = await dbHelper.database;
    await db.insert('TBL_DONATUR', newDonatur.toJson());
    return donatur;
  }

  Future<Donatur> updateDonatur(Donatur donatur) async {
    final db = await dbHelper.database;
    await db.update(
      'TBL_DONATUR',
      donatur.toJson(),
      where: "IDDonatur=?",
      whereArgs: [donatur.iDDonatur],
    );

    return donatur;
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
