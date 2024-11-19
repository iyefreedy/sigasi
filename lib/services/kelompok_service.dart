import 'package:sigasi/models/kelompok.dart';
import 'package:sigasi/utils/database_helper.dart';

class KelompokService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Kelompok>> fetchKelompok() async {
    final db = await dbHelper.database;
    final records = await db.query('REF_KELOMPOK');

    return records.map(Kelompok.fromJson).toList();
  }
}
