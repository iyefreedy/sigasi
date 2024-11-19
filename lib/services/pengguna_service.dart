import 'package:sigasi/models/pengguna.dart';
import 'package:sigasi/utils/database_helper.dart';

class PenggunaService {
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();

  Future<List<Pengguna>> fetchPengguna() async {
    final db = await dbHelper.database;
    final records = await db.query('TBL_PENGGUNA');

    return records.map(Pengguna.fromJson).toList();
  }
}
