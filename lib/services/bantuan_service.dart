import 'package:sigasi/models/bantuan.dart';
import 'package:sigasi/utils/database_helper.dart';

class BantuanService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();

  Future<List<Bantuan>> fetchBantuan() async {
    final db = await _databaseHelper.database;
    final records = await db.query('TBL_BANTUAN');

    return records.map(Bantuan.fromJson).toList();
  }
}
