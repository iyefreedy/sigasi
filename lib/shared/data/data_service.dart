import '../domain/models/bantuan/bantuan.dart';
import '../domain/models/barang/barang.dart';
import '../domain/models/desa/desa.dart';
import '../domain/models/detail_bantuan/detail_bantuan.dart';
import '../domain/models/donatur/donatur.dart';
import '../domain/models/jenis_barang/jenis_barang.dart';
import '../domain/models/kebutuhan/kebutuhan.dart';
import '../domain/models/kelompok/kelompok.dart';
import '../domain/models/penduduk/penduduk.dart';
import '../domain/models/pengungsi/pengungsi.dart';
import '../domain/models/posko/posko.dart';

abstract class DataService {
  Future<List<Desa>> allDesa();

  Future<List<Penduduk>> allPenduduk({int? idKelurahan, int? idKelompok});
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

  Future<List<Pengungsi>> allPengungsi({int? idPosko, int? idKelompok});
  Future<Pengungsi> findPengungsiById(int id);
  Future<Pengungsi> addPengungsi(Pengungsi pengungsi);
  Future<Pengungsi> updatePengungsi(Pengungsi pengungsi);
  Future<void> deletePengungsi(Pengungsi pengungsi);

  Future<List<Kebutuhan>> allKebutuhan({int? idPosko});
  Future<Kebutuhan> findKebutuhanById(int id);
  Future<Kebutuhan> addKebutuhan(Kebutuhan kebutuhan);
  Future<Kebutuhan> updateKebutuhan(Kebutuhan kebutuhan);
  Future<void> deleteKebutuhan(Kebutuhan kebutuhan);

  Future<List<Donatur>> allDonatur();
  Future<Donatur> findDonaturById(int id);
  Future<Donatur> addDonatur(Donatur donatur);
  Future<Donatur> updateDonatur(Donatur donatur);
  Future<void> deleteDonatur(Donatur donatur);

  Future<List<Bantuan>> allBantuan();
  Future<Bantuan> findBantuanById(int id);
  Future<Bantuan> addBantuan(Bantuan bantuan);
  Future<Bantuan> updateBantuan(Bantuan bantuan);
  Future<void> deleteBantuan(Bantuan bantuan);

  Future<List<DetailBantuan>> allBantuanDetail({int? idBantuan});
  Future<DetailBantuan> findBantuanDetail(int id);
  Future<DetailBantuan> addBantuanDetail(DetailBantuan detail);
  Future<DetailBantuan> updateBantuanDetail(DetailBantuan detail);
  Future<void> deleteBantuanDetail(DetailBantuan detail);
}
