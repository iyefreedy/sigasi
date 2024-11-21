import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'sigasi.db';
  static const _databaseVersion = 1;

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
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
         CREATE TABLE TBL_PENDUDUK(
            IDPenduduk TEXT PRIMARY KEY,
            KTP TEXT,
            Nama TEXT,
            JenisKelamin TEXT,
            TanggalLahir TEXT,
            Desa TEXT,
            Alamat TEXT,
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
        HargaSatuan TEXT
      )
    ''');

    await db.execute('''
        INSERT INTO REF_KELOMPOK (IDKelompok, NamaKelompok, Keterangan)
          VALUES
            ('91e307b0-eb0d-45ca-8b7a-0b92286473ba', 'Bayi', '0 - 1 tahun'),
            ('1db93958-b8fb-49b2-a34e-a5fcd1f8b6fb', 'Anak Balita', '1 - 4 tahun'),
            ('d5cfbb50-e1c0-44c0-aeaf-5c90c8b77dd2', 'Pra sekolah', '5 - 6 tahun'),
            ('f2010e0f-a4e4-4289-a2fe-32e2704959f4', 'Anak usia SD/Setingkat', '7 - 12 tahun'),
            ('7f40cd27-c932-4b43-8b1f-2cd79b60a69b', 'Penduduk Usia Lanjut (pria)', '≥ 60 tahun'),
            ('0d33acb9-d80b-4892-8f9f-04083f3f499e', 'Penduduk Usia Lanjut (wanita)', '≥ 60 tahun'),
            ('027fff6f-8bfc-4737-a3a8-f9bb5ada873f', 'Penduduk Usia Lanjut Risiko Tinggi (pria)', '≥ 70 tahun'),
            ('d0101a87-dd23-42ce-a382-38a2bcb0fb54', 'Penduduk Usia Lanjut Risiko Tinggi (wanita)', '≥ 70 tahun'),
            ('a32d990c-bf8f-436e-99cf-91ac71706e3d', 'Ibu Hamil', 'Ibu hamil'),
            ('125504cd-fb47-457e-8855-30c13bc31dcf', 'Ibu Bersalin/Nifas', 'Mempunyai anak BADUTA (bawah dua tahun)'),
            ('7f102efd-cdf4-443c-a30c-307109f3303f', 'Difabel kesulitan fisik', 'Gangguan penglihatan, pendengaran, motorik (tangan/kaki).'),
            ('408172cb-31d5-4006-a648-eda64d425b93', 'Difabel kesulitan memori dan emosi', 'Kesulitan mengingat/berkonsentrasi, gangguan perilaku/emosional, berbicara, serta mengurus diri sendiri/'),
            ('47ebb884-8731-4a99-90d2-e246f18aff11', 'Non rentan pria', '< 60 tahun'),
            ('2acdb74b-aeb8-41ab-a9e5-2816ff9c9bc8', 'Non rentan wanita', '< 60 tahun');
    ''');
  }
}
