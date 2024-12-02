import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/anggota_keluarga.dart';
import 'package:sigasi/models/keluarga.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/providers/list_keluarga_provider.dart';
import 'package:sigasi/providers/list_penduduk_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:uuid/uuid.dart';

import '../models/desa.dart';
import '../models/kecamatan.dart';
import '../providers/keluarga_provider.dart';
import '../providers/list_desa_provider.dart';
import '../providers/list_kecamatan_provider.dart';
import '../providers/list_kelompok_provider.dart';

final listHubunganKeluarga = [
  'Kepala Keluarga',
  'Istri',
  'Anak',
  'Orang Tua',
  'Lainnya'
];

class FormKeluargaScreen extends ConsumerStatefulWidget {
  const FormKeluargaScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FormKeluargaScreenState();
}

class _FormKeluargaScreenState extends ConsumerState<FormKeluargaScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomorKkController = TextEditingController();
  final _alamatController = TextEditingController();

  final _ktpController = TextEditingController();
  final _namaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();

  Kecamatan? _kecamatan;
  Desa? _desa;

  final String _hubungan = 'Kepala Keluarga';
  String? _jenisKelamin;
  String? _kelompok;
  DateTime? _tanggalLahir;

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nomorKkController.dispose();

    _ktpController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listKelompok = ref.watch(listKelompokProvider);
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_kecamatan?.iDKecamatan));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Kartu Keluarga'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: _nomorKkController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
              decoration: const InputDecoration(
                labelText: 'Nomor Kartu Keluarga',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nomor Kartu Keluarga wajib diisi.';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Alamat wajib diisi.';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<Kecamatan>(
              value: _kecamatan,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
              ),
              validator: (value) {
                if (value == null || _kecamatan == null) {
                  return 'Kecamatan wajib diisi.';
                }

                return null;
              },
              items: listKecamatan.maybeWhen(
                data: (data) => data
                    .map(
                      (kecamatan) => DropdownMenuItem(
                        value: kecamatan,
                        child: Text(kecamatan.nama),
                      ),
                    )
                    .toList(),
                orElse: () => [],
              ),
              onChanged: (value) {
                setState(() {
                  _kecamatan = value;
                  _desa = null;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<Desa>(
              value: _desa,
              items: listDesa.maybeWhen(
                data: (data) => data
                    .map(
                      (desa) => DropdownMenuItem(
                        value: desa,
                        child: Text(desa.nama),
                      ),
                    )
                    .toList(),
                orElse: () => [],
              ),
              validator: (value) {
                if (value == null || _kecamatan == null) {
                  return 'Desa wajib diisi.';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Desa',
              ),
              onChanged: (value) {
                setState(() {
                  _desa = value;
                });
              },
            ),
            const SizedBox(height: 10),
            const Divider(),
            Text(
              'Informasi Kepala Keluarga',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: _hubungan,
              decoration: const InputDecoration(
                labelText: 'Hubungan Keluarga',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Hubungan keluarga harus diisi.';
                }

                return null;
              },
              items: listHubunganKeluarga
                  .map((hubungan) => DropdownMenuItem(
                        value: hubungan,
                        child: Text(hubungan),
                      ))
                  .toList(),
              onChanged: null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ktpController,
              decoration: const InputDecoration(
                labelText: 'KTP',
                helperText: 'Opsional',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama harus diisi.';
                }

                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Jenis Kelamin',
              ),
              value: _jenisKelamin,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Jenis kelamin harus diisi.';
                }

                return null;
              },
              items: const [
                DropdownMenuItem(
                  value: 'Laki-Laki',
                  child: Text('Laki-Laki'),
                ),
                DropdownMenuItem(
                  value: 'Perempuan',
                  child: Text('Perempuan'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _jenisKelamin = value;
                });
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _tanggalLahirController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Tanggal Lahir',
              ),
              onTap: () async {
                final dateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (dateTime != null) {
                  setState(() {
                    _tanggalLahir = dateTime;
                  });
                  _tanggalLahirController.text =
                      DateFormat('y-MM-dd').format(dateTime);
                }
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String?>(
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Kelompok',
              ),
              value: _kelompok,
              validator: (value) {
                if (value == null) {
                  return 'Kelompok harus diisi.';
                }

                return null;
              },
              items: listKelompok.maybeWhen(
                  orElse: () => [],
                  data: (data) => data
                      .map((kelompok) => DropdownMenuItem(
                            value: kelompok.iDKelompok,
                            child: Text("${kelompok.namaKelompok}"),
                          ))
                      .toList()),
              onChanged: (value) {
                setState(() {
                  _kelompok = value;
                });
              },
            ),
            const SizedBox(),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      try {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          final penduduk = await ref
                              .read(listPendududukProvider((
                                desa: _desa?.iDDesa,
                                idKelompok: _kelompok
                              )).notifier)
                              .save(Penduduk(
                                alamat: _alamatController.text,
                                iDDesa: _desa?.iDDesa,
                                iDKecamatan: _kecamatan?.iDKecamatan,
                                jenisKelamin: _jenisKelamin,
                                kTP: _ktpController.text,
                                iDKelompok: _kelompok,
                                nama: _namaController.text,
                                tanggalLahir: _tanggalLahir,
                              ));
                          final idKeluarga = const Uuid().v4();
                          final keluarga = Keluarga(
                            iDKeluarga: idKeluarga,
                            iDDesa: _desa?.iDDesa,
                            iDKecamatan: _kecamatan?.iDKecamatan,
                            alamat: _alamatController.text,
                            nomorKK: _nomorKkController.text,
                          );

                          await ref
                              .read(listKeluargaProvider((
                                idDesa: _desa!.iDDesa,
                                idKecamatan: _kecamatan!.iDKecamatan,
                              )).notifier)
                              .save(keluarga);

                          final anggota = AnggotaKeluarga(
                            hubungan: _hubungan,
                            iDKeluarga: keluarga.iDKeluarga,
                            iDPenduduk: penduduk.iDPenduduk,
                          );
                          await ref
                              .read(keluargaProvider(idKeluarga).notifier)
                              .save(anggota: anggota);
                          if (context.mounted) {
                            Navigator.of(context).pushReplacementNamed(
                              AppRouter.detailKeluargaRoute,
                              arguments: idKeluarga,
                            );
                          }
                        }
                      } catch (e) {
                        print(e);
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
              child: _isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
