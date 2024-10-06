import '../domain/models/barang/barang.dart';
import '../domain/models/jenis_barang/jenis_barang.dart';
import '../domain/models/kelompok/kelompok.dart';
import '../domain/models/penduduk/penduduk.dart';
import '../domain/models/posko/posko.dart';

abstract class DataService {
  Future<List<Penduduk>> allPenduduk();
  Future<Penduduk> findPendudukById(int id);
  Future<Penduduk> addPenduduk(Penduduk penduduk);
  Future<Penduduk> updatePenduduk(Penduduk penduduk);
  Future<void> deletePenduduk(Penduduk penduduk);

  Future<List<Kelompok>> allKelompok();
  Future<Kelompok> findKelompokById(int id);
  Future<Kelompok> addKelompok(Kelompok kelompok);
  Future<Kelompok> updateKelompok(Kelompok kelompok);
  Future<void> deleteKelompok(Kelompok kelompok);

  Future<List<JenisBarang>> allJenisBarang();
  Future<JenisBarang> findJenisBarangById(int id);
  Future<JenisBarang> addJenisBarang(JenisBarang jenisBarang);
  Future<JenisBarang> updateJenisBarang(JenisBarang jenisBarang);
  Future<void> deleteJenisBarang(JenisBarang jenisBarang);

  Future<List<Barang>> allBarang();
  Future<Barang> findBarangById(int id);
  Future<Barang> addBarang(Barang barang);
  Future<Barang> updateBarang(Barang barang);
  Future<void> deleteBarang(Barang barang);

  Future<List<Posko>> allPosko();
  Future<Posko> findPoskoById(int id);
  Future<Posko> addPosko(Posko posko);
  Future<Posko> updatePosko(Posko posko);
  Future<void> deletePosko(Posko posko);
}
