import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'sigasi.db';
  static const _databaseVersion = 2;

  static DatabaseHelper getInstance() => DatabaseHelper._interal();

  DatabaseHelper._interal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onConfigure: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db) async {
    await db.execute('''
    ALTER TABLE TBL_DISTRIBUSI ADD COLUMN TanggalDistribusi TEXT;
    ''');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
         CREATE TABLE TBL_PENDUDUK(
            IDPenduduk TEXT PRIMARY KEY,
            KTP TEXT,
            Nama TEXT,
            JenisKelamin TEXT,
            TanggalLahir TEXT,
            Alamat TEXT,
            IDDesa INTEGER,
            IDKecamatan TEXT,
            IDKelompok TEXT,
            LastUpdateDate TEXT,
            LastUpdateBy TEXT
         )
      ''');

    await db.execute('''
        CREATE TABLE REF_KELOMPOK(
            IDKelompok TEXT PRIMARY KEY,
            NamaKelompok TEXT,
            Keterangan TEXT
         )
    ''');

    await db.execute('''
        CREATE TABLE TBL_POSKO (
          IDPosko TEXT PRIMARY KEY,
          IDKetua TEXT,
          Lokasi TEXT,
          Masalah TEXT,
          SolusiMasalah TEXT
        )
    ''');

    await db.execute('''
        CREATE TABLE TBL_DONATUR (
          IDDonatur TEXT PRIMARY KEY,
          NamaPerusahaan TEXT,
          NamaKontak TEXT,
          Alamat TEXT,
          NomorKontak TEXT,
          LastUpdateDate TEXT,
          LastUpdateBy TEXT
        )
    ''');

    await db.execute('''
      CREATE TABLE TBL_PENGGUNA (
        IDPengguna TEXT PRIMARY KEY,
        Nama TEXT,
        NomorKontak TEXT,
        Username TEXT,
        KataSandi TEXT,
        IDPosko TEXT,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE TBL_PENGUNGSI (
        IDPengungsi TEXT PRIMARY KEY,
        IDPosko TEXT,
        IDPenduduk TEXT,
        KondisiKhusus TEXT,
        LastUpdateDate TEXT,
        LastUpdateBy TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE TBL_BARANG (
        IDBarang TEXT PRIMARY KEY,
        IDJenisBarang TEXT,
        NamaBarang TEXT,
        HargaSatuan REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE TBL_BANTUAN (
        IDBantuan TEXT PRIMARY KEY,
        IDDonatur TEXT,
        TanggalBantuan TEXT,
        LastUpdateDate TEXT,
        LastUpdateBy TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE TBL_BANTUAN_DTL (
        IDBantuanDTL TEXT PRIMARY KEY,
        IDBantuan TEXT,
        IDBarang TEXT,
        Jumlah INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE TBL_KEBUTUHAN (
        IDKebutuhan TEXT PRIMARY KEY,
        IDPosko TEXT,
        IDBarang TEXT,
        JumlahKebutuhan INTEGER,
        JumlahDiterima INTEGER,
        LastUpdateBy TEXT,
        LastUpdateDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE TBL_DISTRIBUSI (
        IDDistribusi TEXT PRIMARY KEY,
        IDPosko TEXT,
        IDBarang TEXT,
        Jumlah INTEGER,
        TanggalDistribusi TEXT,
        LastUpdateBy TEXT,
        LastUpdateDate TEXT
      )
    ''');
  }
}
