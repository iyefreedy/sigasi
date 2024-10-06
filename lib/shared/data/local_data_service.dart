import 'dart:developer' show log;

import 'package:path/path.dart';
import 'package:sigasi/shared/domain/models/barang/barang.dart';
import 'package:sigasi/shared/domain/models/jenis_barang/jenis_barang.dart';
import 'package:sigasi/shared/domain/models/kelompok/kelompok.dart';
import 'package:sigasi/shared/domain/models/penduduk/penduduk.dart';
import 'package:sigasi/shared/domain/models/posko/posko.dart';

import 'package:sqflite/sqflite.dart';

import 'data_service.dart';

class LocalDataService implements DataService {
  Database? _database;

  @override
  Future<Penduduk> addPenduduk(Penduduk penduduk) async {
    try {
      final db = await _getDatabase();
      final newIdPenduduk = await db.insert(
        'TBL_PENDUDUK',
        penduduk.toJson()..remove('IdPenduduk'),
      );
      return penduduk.copyWith(idPenduduk: newIdPenduduk);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Penduduk>> allPenduduk() async {
    try {
      final db = await _getDatabase();
      final records = await db.query('TBL_PENDUDUK');
      return records.map(Penduduk.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deletePenduduk(Penduduk penduduk) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        'TBL_PENDUDUK',
        where: "IdPenduduk=?",
        whereArgs: [
          penduduk.idPenduduk,
        ],
      );
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Penduduk> findPendudukById(int id) async {
    try {
      final db = await _getDatabase();
      final records = await db
          .query('TBL_PENDUDUK', where: "IdPenduduk=?", whereArgs: [id]);
      return Penduduk.fromJson(records.first);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Penduduk> updatePenduduk(Penduduk penduduk) async {
    try {
      final db = await _getDatabase();
      await db.update(
        'TBL_PENDUDUK',
        penduduk.toJson()..remove('IdPenduduk'),
        where: 'IdPenduduk=?',
        whereArgs: [penduduk.idPenduduk],
      );
      return penduduk;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Kelompok> addKelompok(Kelompok kelompok) async {
    try {
      final db = await _getDatabase();
      final newIdKelompok = await db.insert(
          "REF_KELOMPOK", kelompok.toJson()..remove('IdKelompok'));

      return kelompok.copyWith(idKelompok: newIdKelompok);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Kelompok>> allKelompok() async {
    try {
      final db = await _getDatabase();
      final records = await db.query("REF_KELOMPOK");

      return records.map(Kelompok.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteKelompok(Kelompok kelompok) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        "REF_KELOMPOK",
        where: "IdKelompok=?",
        whereArgs: [kelompok.idKelompok],
      );
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Kelompok> findKelompokById(int id) async {
    try {
      final db = await _getDatabase();
      final records = await db.query(
        "REF_KELOMPOK",
        where: "IdKelompok=?",
        whereArgs: [id],
      );

      return Kelompok.fromJson(records.first);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Kelompok> updateKelompok(Kelompok kelompok) async {
    try {
      final db = await _getDatabase();
      await db.update(
        "REF_KELOMPOK",
        kelompok.toJson()..remove('IdKelompok'),
        where: "idKelompok=?",
        whereArgs: [kelompok.idKelompok],
      );

      return kelompok;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<JenisBarang> addJenisBarang(JenisBarang jenisBarang) async {
    try {
      final db = await _getDatabase();
      final newIdJenisBarang = await db.insert(
        'REF_JENIS_BARANG',
        jenisBarang.toJson()..remove('IdJenisBarang'),
      );

      return jenisBarang.copyWith(idJenisBarang: newIdJenisBarang);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<JenisBarang>> allJenisBarang() async {
    try {
      final db = await _getDatabase();
      final records = await db.query('REF_JENIS_BARANG');
      return records.map(JenisBarang.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteJenisBarang(JenisBarang jenisBarang) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        'REF_JENIS_BARANG',
        where: 'IdJenisBarang=?',
        whereArgs: [jenisBarang.idJenisBarang],
      );
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<JenisBarang> findJenisBarangById(int id) async {
    try {
      final db = await _getDatabase();
      final records = await db.query(
        'REF_JENIS_BARANG',
        where: "IdJenisBarang=?",
        whereArgs: [id],
      );

      return JenisBarang.fromJson(records.first);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<JenisBarang> updateJenisBarang(JenisBarang jenisBarang) async {
    try {
      final db = await _getDatabase();
      await db.update(
        'REF_JENIS_BARANG',
        jenisBarang.toJson()
          ..remove('IdJenisBarang')
          ..update(
              'LastUpdatedDate', (value) => DateTime.now().toIso8601String()),
        where: "IdJenisBarang=?",
        whereArgs: [jenisBarang.idJenisBarang],
      );

      return jenisBarang;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Barang> addBarang(Barang barang) async {
    try {
      final db = await _getDatabase();
      final newIdBarang = await db.insert(
        'REF_BARANG',
        barang.toJson()
          ..remove('IdBarang')
          ..update(
            'LastUpdatedDate',
            (value) => DateTime.now().toIso8601String(),
          ),
      );
      return barang.copyWith(idBarang: newIdBarang);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Barang>> allBarang() async {
    try {
      final db = await _getDatabase();
      final records = await db.query('REF_BARANG');
      return records.map(Barang.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteBarang(Barang barang) {
    // TODO: implement deleteBarang
    throw UnimplementedError();
  }

  @override
  Future<Barang> findBarangById(int id) {
    // TODO: implement findBarangById
    throw UnimplementedError();
  }

  @override
  Future<Barang> updateBarang(Barang barang) async {
    try {
      final db = await _getDatabase();
      await db.update(
        'REF_BARANG',
        barang.toJson()..remove('IdBarang'),
        where: "IdBarang=?",
        whereArgs: [barang.idBarang],
      );
      return barang;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Posko> addPosko(Posko posko) async {
    try {
      final db = await _getDatabase();
      final newIdPosko = await db.insert(
        'TBL_POSKO',
        posko.toJson()..remove('IdPosko'),
      );
      return posko.copyWith(idPosko: newIdPosko);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Posko>> allPosko() async {
    try {
      final db = await _getDatabase();
      final records = await db.query('TBL_POSKO');
      return records.map(Posko.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deletePosko(Posko posko) {
    // TODO: implement deletePosko
    throw UnimplementedError();
  }

  @override
  Future<Posko> findPoskoById(int id) {
    // TODO: implement findPoskoById
    throw UnimplementedError();
  }

  @override
  Future<Posko> updatePosko(Posko posko) async {
    try {
      final db = await _getDatabase();
      await db.update(
        'TBL_POSKO',
        posko.toJson()..remove('IdPosko'),
        where: "IdPosko=?",
        whereArgs: [posko.idPosko],
      );
      return posko;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  Future<Database> _getDatabase() async {
    if (_database != null) return _database!;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'sigasi.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.transaction((trans) async {
          await trans.execute(createJenisBarangTableQuery);
          await trans.execute(createBarangTableTable);
          await trans.execute(createKelompokTableQuery);
          await trans.execute(createPoskoTableQuery);
          await trans.execute(createPenggunaTableQuery);
          await trans.execute(createDonaturTableQuery);
          await trans.execute(createPendudukTableQuery);
          await trans.execute(createPengungsiTableQuery);
          await trans.execute(createKebutuhanTableQuery);
          await trans.execute(createBantuanTableQuery);
          await trans.execute(createBantuanDetailTableQuery);

          await trans.execute(seedJenisBarangQuery);
          await trans.execute(seedKelompokQuery);
        });
      },
    );

    return database;
  }
}

const String createKelompokTableQuery = '''
CREATE TABLE REF_KELOMPOK (
    IdKelompok INTEGER PRIMARY KEY AUTOINCREMENT,
    NamaKelompok TEXT NOT NULL,
    Keterangan TEXT
);
''';

const String createJenisBarangTableQuery = '''
CREATE TABLE REF_JENIS_BARANG (
    IdJenisBarang INTEGER PRIMARY KEY AUTOINCREMENT,
    JenisBarang TEXT NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
''';

const String createPoskoTableQuery = '''
CREATE TABLE TBL_POSKO (
    IdPosko INTEGER PRIMARY KEY AUTOINCREMENT,
    Ketua TEXT NOT NULL,
    Lokasi TEXT NOT NULL,
    Masalah TEXT NOT NULL,
    SolusiMasalah TEXT NOT NULL
);
''';

const String createBarangTableTable = '''
CREATE TABLE REF_BARANG (
    IdBarang INTEGER PRIMARY KEY AUTOINCREMENT,
    IdJenisBarang INTEGER NOT NULL,
    Nama TEXT NOT NULL,
    HargaSatuan REAL NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdJenisBarang) REFERENCES REF_JENIS_BARANG (IdJenisBarang)
);
''';

const String createPenggunaTableQuery = '''
CREATE TABLE TBL_PENGGUNA (
    IdPengguna INTEGER PRIMARY KEY AUTOINCREMENT,
    Nama TEXT NOT NULL,
    Username TEXT NOT NULL UNIQUE,
    PasswordHash TEXT NOT NULL,
    Satuan TEXT NOT NULL,
    NomorKontak INTEGER NOT NULL,
    IdPosko INTEGER,
    LastUpdatedBy INTEGER NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdPosko) REFERENCES TBL_POSKO (IdPosko),
    FOREIGN KEY (LastUpdatedBy) REFERENCES TBL_PENGGUNA (IdPengguna)
);
''';

const String createDonaturTableQuery = '''
CREATE TABLE TBL_DONATUR (
    IdDonatur INTEGER PRIMARY KEY AUTOINCREMENT,
    NamaPerusahaan TEXT NOT NULL,
    NamaKontak TEXT NOT NULL,
    Alamat TEXT NOT NULL,
    NomorKontak TEXT NOT NULL,
    LastUpdatedBy INTEGER NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (LastUpdatedBy) REFERENCES TBL_PENGGUNA (IdPengguna)
);
''';

const String createPendudukTableQuery = '''
CREATE TABLE TBL_PENDUDUK (
    IdPenduduk INTEGER PRIMARY KEY AUTOINCREMENT,
    KTP TEXT UNIQUE,
    Nama TEXT NOT NULL,
    JenisKelamin TEXT NOT NULL,
    Alamat TEXT,
    TanggalLahir DATE NOT NULL,
    IdKelurahan INTEGER NOT NULL,
    IdKelompok INTEGER NOT NULL,
    LastUpdatedBy INTEGER NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdKelompok) REFERENCES REF_KELOMPOK (IdKelompok),
    FOREIGN KEY (LastUpdatedBy) REFERENCES TBL_PENGGUNA (IdPengguna)
);
''';

const String createKebutuhanTableQuery = '''
CREATE TABLE TBL_KEBUTUHAN (
    IdKebutuhan INTEGER PRIMARY KEY AUTOINCREMENT,
    IdBarang INTEGER NOT NULL,
    IdPosko INTEGER NOT NULL,
    JumlahKebutuhan INTEGER NOT NULL DEFAULT 0,
    JumlahDiterima INTEGER NOT NULL DEFAULT 0,
    LastUpdatedBy INTEGER NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdBarang) REFERENCES REF_BARANG (IdBarang),
    FOREIGN KEY (IdPosko) REFERENCES TBL_POSKO (IdPosko),
    FOREIGN KEY (LastUpdatedBy) REFERENCES TBL_PENGGUNA (IdPengguna)
);
''';

const String createBantuanTableQuery = '''
CREATE TABLE TBL_BANTUAN (
    IdBantuan INTEGER PRIMARY KEY AUTOINCREMENT,
    IdDonatur INTEGER NOT NULL,
    TanggalBantuan TIMESTAMP NOT NULL,
    LastUpdatedBy INTEGER NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdDonatur) REFERENCES TBL_DONATUR (IdDonatur),
    FOREIGN KEY (LastUpdatedBy) REFERENCES TBL_PENGGUNA (IdPengguna)
);
''';

const String createBantuanDetailTableQuery = '''
CREATE TABLE TBL_BANTUAN_DTL (
    IdBantuanDtl INTEGER PRIMARY KEY AUTOINCREMENT,
    IdBantuan INTEGER NOT NULL,
    IdBarang INTEGER NOT NULL,
    Jumlah INTEGER NOT NULL,
    FOREIGN KEY (IdBantuan) REFERENCES TBL_BANTUAN (IdBantuan),
    FOREIGN KEY (IdBarang) REFERENCES REF_BARANG (IdBarang)
);
''';

const String createPengungsiTableQuery = '''
CREATE TABLE TBL_PENGUNGSI (
    IdPengungsi INTEGER PRIMARY KEY AUTOINCREMENT,
    IdPosko INTEGER NOT NULL,
    IdPenduduk INTEGER NOT NULL,
    KondisiKhusus TEXT NOT NULL,
    LastUpdatedBy INTEGER NOT NULL,
    LastUpdatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdPosko) REFERENCES TBL_POSKO (IdPosko),
    FOREIGN KEY (IdPenduduk) REFERENCES TBL_PENDUDUK (IdPenduduk),
    FOREIGN KEY (LastUpdatedBy) REFERENCES TBL_PENGGUNA (IdPengguna)
);
''';

const String createKecamatanTableQuery = '''
CREATE TABLE TBL_KECAMATAN (
  IdKecamatan INTEGER PRIMARY KEY,
  Nama TEXT,
  NamaAlternatif TEXT
);
''';

const String createKelurahanTableQuery = '''
CREATE TABLE TBL_KELURAHAN (
  IdKelurahan INTEGER PRIMARY KEY,
  IdKecamatan INTEGER NOT NULL,
  Nama TEXT,
  FOREIGN KEY (IdKecamatan) REFERENCES TBL_KECAMATAN (IdKecamatan),
);
''';

const String seedJenisBarangQuery = '''
INSERT INTO REF_JENIS_BARANG (JenisBarang) VALUES
('Makanan'), ('Minuman'), ('Pakaian'), ('Kebutuhan Khusus'), ('Obat & Vitamin');
''';

const String seedKelompokQuery = '''
INSERT INTO REF_KELOMPOK (IDKelompok, NamaKelompok, Keterangan)
VALUES
  (1, 'Bayi', '0 - 1 tahun'),
  (2, 'Anak Balita', '1 - 4 tahun'),
  (3, 'Pra sekolah', '5 - 6 tahun'),
  (4, 'Anak usia SD/Setingkat', '7 - 12 tahun'),
  (5, 'Penduduk Usia Lanjut (pria)', '≥ 60 tahun'),
  (6, 'Penduduk Usia Lanjut (wanita)', '≥ 60 tahun'),
  (7, 'Penduduk Usia Lanjut Risiko Tinggi (pria)', '≥ 70 tahun'),
  (8, 'Penduduk Usia Lanjut Risiko Tinggi (wanita)', '≥ 70 tahun'),
  (9, 'Ibu Hamil', 'Ibu hamil'),
  (10, 'Ibu Bersalin/Nifas', 'Mempunyai anak BADUTA (bawah dua tahun)'),
  (11, 'Difabel kesulitan fisik', 'Gangguan penglihatan, pendengaran, motorik (tangan/kaki).'),
  (12, 'Difabel kesulitan memori dan emosi', 'Kesulitan mengingat/berkonsentrasi, gangguan perilaku/emosional, berbicara, serta mengurus diri sendiri/'),
  (13, 'Non rentan pria', '< 60 tahun'),
  (14, 'Non rentan wanita', '< 60 tahun');
''';

const String seedKecamatanQuery = '''
INSERT INTO TBL_KECAMATAN (IdKecamatan,Nama,NamaAlternatif)
VALUES
('3203010','AGRABINTA','Agrabinta, Cianjur Regency, West Java, Indonesia'),
('3203011','LELES','Leles, Cianjur Regency, West Java, Indonesia'),
('3203020','SINDANGBARANG','Sindangbarang, Saganten, Sindangbarang, Kabupaten Cianjur, Jawa Barat, Indonesia'),
('3203030','CIDAUN','Cidaun, Cianjur Regency, West Java, Indonesia'),
('3203040','NARINGGUL','Naringgul, Cianjur Regency, West Java, Indonesia'),
('3203050','CIBINONG','Cibinong, Bogor, West Java, Indonesia'),
('3203051','CIKADU','Cikadu, Cianjur Regency, West Java, Indonesia'),
('3203060','TANGGEUNG','Tanggeung, Cianjur Regency, West Java, Indonesia'),
('3203061','PASIRKUDA','Pasirkuda, Cianjur Regency, West Java, Indonesia'),
('3203070','KADUPANDAK','Kadupandak, Cianjur Regency, West Java, Indonesia'),
('3203071','CIJATI','Cijati, Cianjur Regency, West Java, Indonesia'),
('3203080','TAKOKAK','Takokak, Cianjur Regency, West Java, Indonesia'),
('3203090','SUKANAGARA','Sukanagara, Cianjur Regency, West Java, Indonesia'),
('3203100','PAGELARAN','Pagelaran, Malang, East Java, Indonesia'),
('3203110','CAMPAKA','Jl. Campaka, Campakamulya, Cimaung, Bandung, Jawa Barat 40374, Indonesia'),
('3203111','CAMPAKA MULYA','Campaka Mulya, Cianjur Regency, West Java, Indonesia'),
('3203120','CIBEBER','Cibeber, Cianjur Regency, West Java, Indonesia'),
('3203130','WARUNGKONDANG','Warungkondang, Cianjur Regency, West Java, Indonesia'),
('3203131','GEKBRONG','Gekbrong, Cianjur Regency, West Java, Indonesia'),
('3203140','CILAKU','Cilaku, Cianjur Regency, West Java, Indonesia'),
('3203150','SUKALUYU','Sukaluyu, Cianjur Regency, West Java, Indonesia'),
('3203160','BOJONGPICUNG','Bojongpicung, Cianjur Regency, West Java, Indonesia'),
('3203161','HAURWANGI','Haurwangi, Cianjur Regency, West Java, Indonesia'),
('3203170','CIRANJANG','Ciranjang, Cianjur Regency, West Java, Indonesia'),
('3203180','MANDE','Mande, Cianjur Regency, West Java, Indonesia'),
('3203190','KARANGTENGAH','Karangtengah, Cianjur Regency, West Java, Indonesia'),
('3203200','CIANJUR','Cianjur, Cianjur Sub-District, Cianjur Regency, West Java, Indonesia'),
('3203210','CUGENANG','Cugenang, Cianjur Regency, West Java, Indonesia'),
('3203220','PACET','Pacet, Bandung, West Java, Indonesia'),
('3203221','CIPANAS','Cipanas, Cianjur Regency, West Java, Indonesia'),
('3203230','SUKARESMI','Sukaresmi, South Cikarang, Bekasi, West Java, Indonesia'),
('3203240','CIKALONGKULON','Cikalongkulon, Cianjur Regency, West Java, Indonesia');
''';

const String seedKelurahanQuery = '''
INSERT INTO TBL_KELURAHAN (IdKelurahan,IdKecamatan,Nama)
VALUES
('3203010001','3203010','SINARLAUT'),
('3203010002','3203010','BOJONGKASO'),
('3203010003','3203010','SUKAMANAH'),
('3203010004','3203010','WANASARI'),
('3203010007','3203010','KARANGSARI'),
('3203010008','3203010','NEGLASARI'),
('3203010009','3203010','MULYASARI'),
('3203010010','3203010','BUNISARI'),
('3203010011','3203010','MEKARSARI'),
('3203010012','3203010','TANJUNGSARI'),
('3203010013','3203010','WANGUNJAYA'),
('3203011001','3203011','PUSAKASARI'),
('3203011002','3203011','NAGASARI'),
('3203011003','3203011','SUKAJAYA'),
('3203011004','3203011','SUKAMULYA'),
('3203011005','3203011','PURABAYA'),
('3203011006','3203011','SUKASIRNA'),
('3203011007','3203011','WALAHIR'),
('3203011008','3203011','PUNCAKWANGI'),
('3203011009','3203011','SIRNASARI'),
('3203011010','3203011','KARYAMUKTI'),
('3203011011','3203011','MANDALAWANGI'),
('3203011012','3203011','SINDANGSARI'),
('3203020001','3203020','HEGARSARI'),
('3203020002','3203020','JATISARI'),
('3203020003','3203020','KERTASARI'),
('3203020004','3203020','TALAGASARI'),
('3203020005','3203020','SIRNAGALIH'),
('3203020006','3203020','SAGANTEN'),
('3203020007','3203020','JAYAGIRI'),
('3203020008','3203020','MUARACIKADU'),
('3203020009','3203020','GIRIMUKTI'),
('3203020010','3203020','MEKARLAKSANA'),
('3203020011','3203020','KERTAMUKTI'),
('3203030001','3203030','KARYABAKTI'),
('3203030002','3203030','SUKAPURA'),
('3203030003','3203030','CISALAK'),
('3203030004','3203030','JAYAPURA'),
('3203030005','3203030','KERTAJADI'),
('3203030006','3203030','CIDAMAR'),
('3203030007','3203030','KARANGWANGI'),
('3203030008','3203030','CIMARAGANG'),
('3203030009','3203030','GELARPAWITAN'),
('3203030010','3203030','NEGLASARI'),
('3203030011','3203030','CIBULUH'),
('3203030012','3203030','PUNCAKBARU'),
('3203030013','3203030','MEKARJAYA'),
('3203030014','3203030','GELARWANGI'),
('3203040001','3203040','CINERANG'),
('3203040002','3203040','WANGUNJAYA'),
('3203040003','3203040','MEKARSARI'),
('3203040004','3203040','WANGUNSARI'),
('3203040005','3203040','MALATI'),
('3203040006','3203040','SUKAMULYA'),
('3203040007','3203040','NARINGGUL'),
('3203040008','3203040','WANASARI'),
('3203040009','3203040','SUKABAKTI'),
('3203040010','3203040','BALEGEDE'),
('3203040011','3203040','MARGASARI'),
('3203050001','3203050','PANYINDANGAN'),
('3203050002','3203050','WARGALUYU'),
('3203050003','3203050','HAMERANG'),
('3203050004','3203050','PANANGGAPAN'),
('3203050005','3203050','GIRIJAYA'),
('3203050006','3203050','SUKAJADI'),
('3203050007','3203050','SUKAMEKAR'),
('3203050008','3203050','BATULAWANG'),
('3203050009','3203050','CIKANGKARENG'),
('3203050015','3203050','PAMOYANAN'),
('3203050016','3203050','CIMASKARA'),
('3203050020','3203050','PADASUKA'),
('3203050021','3203050','MEKARMUKTI'),
('3203050022','3203050','CIBURIAL'),
('3203051001','3203051','PADALUYU'),
('3203051002','3203051','SUKALUYU'),
('3203051003','3203051','MEKARLAKSANA'),
('3203051004','3203051','CIKADU'),
('3203051005','3203051','KALAPANUNGGAL'),
('3203051006','3203051','MEKARWANGI'),
('3203051007','3203051','CISARANTEN'),
('3203051008','3203051','SUKAMULYA'),
('3203051009','3203051','MEKARJAYA'),
('3203051010','3203051','SUKAMANAH'),
('3203060001','3203060','KARANGTENGAH'),
('3203060002','3203060','RAWAGEDE'),
('3203060003','3203060','SUKAJAYA'),
('3203060004','3203060','TANGGEUNG'),
('3203060005','3203060','KERTAJAYA'),
('3203060006','3203060','SIRNAJAYA'),
('3203060007','3203060','PASIR JAMBU'),
('3203060008','3203060','CILONGSONG'),
('3203060009','3203060','MARGALUYU'),
('3203060010','3203060','PAGERMANEUH'),
('3203060011','3203060','BOJONGPETIR'),
('3203060012','3203060','PADALUYU'),
('3203061001','3203061','MEKARMULYA'),
('3203061002','3203061','KUBANG'),
('3203061003','3203061','GIRIJAYA'),
('3203061004','3203061','GIRIMUKTI'),
('3203061005','3203061','SIMPANG'),
('3203061006','3203061','KALIBARU'),
('3203061007','3203061','PUSAKAJAYA'),
('3203061008','3203061','KARANGJAYA'),
('3203061009','3203061','PADAMULYA'),
('3203070010','3203070','PASIRDALEM'),
('3203070011','3203070','SUKARAJA'),
('3203070012','3203070','KADUPANDAK'),
('3203070013','3203070','TALAGASARI'),
('3203070014','3203070','NEGLASARI'),
('3203070015','3203070','SUKAKERTA'),
('3203070016','3203070','SUKARAHARJA'),
('3203070017','3203070','BOJONGKASIH'),
('3203070018','3203070','SUKASARI'),
('3203070019','3203070','WARGASARI'),
('3203070020','3203070','WARGAASIH'),
('3203070021','3203070','SUKARESMI'),
('3203070022','3203070','GANDASARI'),
('3203070023','3203070','SINDANGSARI'),
('3203071001','3203071','PADAASIH'),
('3203071002','3203071','SUKALUYU'),
('3203071003','3203071','SINARBAKTI'),
('3203071004','3203071','BOJONGLARANG'),
('3203071005','3203071','SUKAMAHI'),
('3203071006','3203071','CIJATI'),
('3203071007','3203071','CIBODAS'),
('3203071008','3203071','CARINGIN'),
('3203071009','3203071','PARAKANTUGU'),
('3203071010','3203071','SUKAMAJU'),
('3203080001','3203080','WARINGINSARI'),
('3203080002','3203080','SUKAGALIH'),
('3203080003','3203080','SIMPANG'),
('3203080004','3203080','SINDANGHAYU'),
('3203080005','3203080','SINDANGRESMI'),
('3203080006','3203080','BUNGBANGSARI'),
('3203080007','3203080','CISUJEN'),
('3203080008','3203080','PASAWAHAN'),
('3203080009','3203080','HEGARMANAH'),
('3203090001','3203090','JAYAGIRI'),
('3203090002','3203090','CIGUHA'),
('3203090003','3203090','SUKAKARYA'),
('3203090004','3203090','SUKARAME'),
('3203090005','3203090','SUKALAKSANA'),
('3203090006','3203090','SUKANAGARA'),
('3203090007','3203090','GUNUNGSARI'),
('3203090008','3203090','SINDANGSARI'),
('3203090009','3203090','SUKAJEMBAR'),
('3203090010','3203090','SUKAMEKAR'),
('3203100001','3203100','KERTARAHARJA'),
('3203100002','3203100','PAGELARAN'),
('3203100003','3203100','PADAMAJU'),
('3203100008','3203100','BUNIWANGI'),
('3203100009','3203100','BUNIJAYA'),
('3203100010','3203100','PANGADEGAN'),
('3203100011','3203100','SITUHIANG'),
('3203100012','3203100','PASIRBARU'),
('3203100013','3203100','SINDANGKERTA'),
('3203100014','3203100','KARANGHARJA'),
('3203100015','3203100','SELAGEDANG'),
('3203100016','3203100','GELAR ANYAR'),
('3203100017','3203100','MEKARSARI'),
('3203100018','3203100','SUKAMAJU'),
('3203110001','3203110','WANGUNJAYA'),
('3203110002','3203110','SUKADANA'),
('3203110003','3203110','KARYAMUKTI'),
('3203110004','3203110','CIMENTENG'),
('3203110005','3203110','GIRIMUKTI'),
('3203110006','3203110','SUSUKAN'),
('3203110007','3203110','SUKAJADI'),
('3203110008','3203110','MARGALUYU'),
('3203110009','3203110','MEKARJAYA'),
('3203110010','3203110','CIDADAP'),
('3203110011','3203110','CAMPAKA'),
('3203111001','3203111','CAMPAKAWARNA'),
('3203111002','3203111','CAMPAKAMULYA'),
('3203111003','3203111','SUKABUNGAH'),
('3203111004','3203111','CIBANGGALA'),
('3203111005','3203111','SUKASIRNA'),
('3203120001','3203120','CIBOKOR'),
('3203120002','3203120','KANOMAN'),
('3203120003','3203120','CIPETIR'),
('3203120004','3203120','CIKONDANG'),
('3203120005','3203120','CIHAUR'),
('3203120006','3203120','SUKAMANAH'),
('3203120007','3203120','SALAGEDANG'),
('3203120008','3203120','CIBADAK'),
('3203120009','3203120','GIRIMULYA'),
('3203120010','3203120','CIMANGGU'),
('3203120011','3203120','CISALAK'),
('3203120012','3203120','MAYAK'),
('3203120013','3203120','PEUTEUYCONDONG'),
('3203120014','3203120','SUKARAHARJA'),
('3203120015','3203120','SUKAMAJU'),
('3203120016','3203120','CIBAREGBEG'),
('3203120017','3203120','KARANGNUNGGAL'),
('3203120018','3203120','SALAMNUNGGAL'),
('3203130002','3203130','CISARANDI'),
('3203130003','3203130','SUKAMULYA'),
('3203130004','3203130','CIKAROYA'),
('3203130012','3203130','JAMBUDIPA'),
('3203130013','3203130','MEKARWANGI'),
('3203130014','3203130','TEGALLEGA'),
('3203130015','3203130','BUNIKASIH'),
('3203130016','3203130','BUNISARI'),
('3203130017','3203130','CIEUNDEUR'),
('3203130018','3203130','CIWALEN'),
('3203130019','3203130','SUKAWANGI'),
('3203131001','3203131','CINTAASIH'),
('3203131002','3203131','CIKANCANA'),
('3203131003','3203131','SUKARATU'),
('3203131004','3203131','BANGBAYANG'),
('3203131005','3203131','SONGGOM'),
('3203131006','3203131','CIKAHURIPAN'),
('3203131007','3203131','GEKBRONG'),
('3203131008','3203131','KEBONPEUTEUY'),
('3203140001','3203140','SUKASARI'),
('3203140002','3203140','SUKAKERTA'),
('3203140003','3203140','SINDANGSARI'),
('3203140004','3203140','MULYASARI'),
('3203140005','3203140','CIHARASHAS'),
('3203140006','3203140','CIBINONG HILIR'),
('3203140007','3203140','SIRNAGALIH'),
('3203140008','3203140','RAHONG'),
('3203140009','3203140','MUNJUL'),
('3203140010','3203140','RANCAGOONG'),
('3203150001','3203150','MEKARJAYA'),
('3203150002','3203150','PANYUSUHAN'),
('3203150003','3203150','SUKALUYU'),
('3203150004','3203150','SUKAMULYA'),
('3203150005','3203150','BABAKANSARI'),
('3203150006','3203150','TANJUNGSARI'),
('3203150007','3203150','SELAJAMBE'),
('3203150008','3203150','HEGARMANAH'),
('3203150009','3203150','SUKASIRNA'),
('3203150010','3203150','SINDANGRAJA'),
('3203160001','3203160','SUKARAMA'),
('3203160002','3203160','SUKAJAYA'),
('3203160003','3203160','CIKONDANG'),
('3203160004','3203160','JATISARI'),
('3203160005','3203160','KEMANG'),
('3203160006','3203160','CIBARENGKOK'),
('3203160007','3203160','JATI'),
('3203160008','3203160','BOJONGPICUNG'),
('3203160009','3203160','SUKARATU'),
('3203160012','3203160','NEGLASARI'),
('3203160013','3203160','HEGARMANAH'),
('3203161001','3203161','CIHEA'),
('3203161002','3203161','SUKATANI'),
('3203161003','3203161','RAMASARI'),
('3203161004','3203161','HAURWANGI'),
('3203161005','3203161','KERTASARI'),
('3203161006','3203161','KERTAMUKTI'),
('3203161007','3203161','CIPEUYEUM'),
('3203161008','3203161','MEKARWANGI'),
('3203170004','3203170','KARANGWANGI'),
('3203170005','3203170','GUNUNGSARI'),
('3203170006','3203170','KERTAJAYA'),
('3203170007','3203170','SINDANGJAYA'),
('3203170008','3203170','SINDANGSARI'),
('3203170009','3203170','CIBIUK'),
('3203170010','3203170','MEKARGALIH'),
('3203170011','3203170','CIRANJANG'),
('3203170012','3203170','NANGGALAMEKAR'),
('3203180001','3203180','MEKARJAYA'),
('3203180002','3203180','LEUWIKOJA'),
('3203180003','3203180','KUTAWARINGIN'),
('3203180004','3203180','SUKAMANAH'),
('3203180005','3203180','CIANDAM'),
('3203180006','3203180','JAMALI'),
('3203180007','3203180','KADEMANGAN'),
('3203180008','3203180','MULYASARI'),
('3203180009','3203180','BOBOJONG'),
('3203180010','3203180','CIKIDANGBAYABANG'),
('3203180011','3203180','MURNISARI'),
('3203180012','3203180','MANDE'),
('3203190001','3203190','SUKAMANAH'),
('3203190002','3203190','SINDANGASIH'),
('3203190003','3203190','LANGENSARI'),
('3203190004','3203190','SUKASARI'),
('3203190005','3203190','MALEBER'),
('3203190006','3203190','SABANDAR'),
('3203190007','3203190','BOJONG'),
('3203190008','3203190','HEGARMANAH'),
('3203190009','3203190','BABAKANCARINGIN'),
('3203190010','3203190','CIHERANG'),
('3203190011','3203190','SUKAJADI'),
('3203190012','3203190','SUKASARANA'),
('3203190013','3203190','SUKAMANTRI'),
('3203190014','3203190','SUKAMULYA'),
('3203190015','3203190','SINDANGLAKA'),
('3203190016','3203190','SUKATARIS'),
('3203200001','3203200','NAGRAK'),
('3203200002','3203200','SUKAMAJU'),
('3203200003','3203200','SAYANG'),
('3203200004','3203200','SOLOKPANDAN'),
('3203200005','3203200','MUKA'),
('3203200006','3203200','BOJONGHERANG'),
('3203200007','3203200','PAMOYANAN'),
('3203200008','3203200','SAWAH GEDE'),
('3203200009','3203200','LIMBANGAN SARI'),
('3203200010','3203200','MEKARSARI'),
('3203200011','3203200','BABAKANKARET'),
('3203210001','3203210','PADALUYU'),
('3203210002','3203210','SUKAJAYA'),
('3203210003','3203210','CIBULAKAN'),
('3203210004','3203210','CIRUMPUT'),
('3203210005','3203210','TALAGA'),
('3203210006','3203210','BENJOT'),
('3203210007','3203210','GASOL'),
('3203210008','3203210','SARAMPAD'),
('3203210009','3203210','MANGUNKERTA'),
('3203210010','3203210','SUKAMULYA'),
('3203210011','3203210','GALUDRA'),
('3203210012','3203210','NYALINDUNG'),
('3203210013','3203210','CIBEUREUM'),
('3203210014','3203210','CIJEDIL'),
('3203210015','3203210','SUKAMANAH'),
('3203210016','3203210','WANGUNJAYA'),
('3203220001','3203220','CIPUTRI'),
('3203220002','3203220','CIHERANG'),
('3203220003','3203220','CIPENDAWA'),
('3203220004','3203220','CIBODAS'),
('3203220005','3203220','GADOG'),
('3203220008','3203220','SUKATANI'),
('3203220014','3203220','SUKANAGALIH'),
('3203221001','3203221','SINDANGJAYA'),
('3203221002','3203221','CIPANAS'),
('3203221003','3203221','SINDANGLAYA'),
('3203221004','3203221','PALASARI'),
('3203221005','3203221','CIMACAN'),
('3203221006','3203221','CILOTO'),
('3203221007','3203221','BATULAWANG'),
('3203230001','3203230','PAKUON'),
('3203230002','3203230','CIKANYERE'),
('3203230003','3203230','SUKARESMI'),
('3203230004','3203230','CIWALEN'),
('3203230005','3203230','KAWUNGLUWUK'),
('3203230006','3203230','CIBADAK'),
('3203230007','3203230','RAWABELUT'),
('3203230008','3203230','CIBANTENG'),
('3203230009','3203230','KUBANG'),
('3203230010','3203230','SUKAMAHI'),
('3203230011','3203230','CIKANCANA'),
('3203240001','3203240','PADAJAYA'),
('3203240002','3203240','CINANGSI'),
('3203240003','3203240','MENTENGSARI'),
('3203240004','3203240','GUDANG'),
('3203240005','3203240','SUKAGALIH'),
('3203240006','3203240','MAJALAYA'),
('3203240007','3203240','CIJAGANG'),
('3203240008','3203240','MEKARJAYA'),
('3203240009','3203240','MEKAR SARI'),
('3203240010','3203240','SUKAMULYA'),
('3203240011','3203240','MEKARGALIH'),
('3203240012','3203240','NEGLASARI'),
('3203240013','3203240','LEMBAHSARI'),
('3203240014','3203240','WARUDOYONG'),
('3203240015','3203240','KAMURANG'),
('3203240016','3203240','CIRAMA GIRANG'),
('3203240017','3203240','MEKAR MULYA'),
('3203240018','3203240','CIGUNUNGHERANG');
''';
