import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/anggota_keluarga.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/providers/keluarga_provider.dart';
import 'package:sigasi/providers/list_desa_provider.dart';
import 'package:sigasi/providers/list_kecamatan_provider.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/providers/list_keluarga_provider.dart';

const listHubunganKeluarga = [
  'Kepala Keluarga',
  'Istri',
  'Anak',
  'Orang Tua',
  'Lainnya'
];

class AddAnggotaScreen extends ConsumerStatefulWidget {
  const AddAnggotaScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAnggotaScreenState();
}

class _AddAnggotaScreenState extends ConsumerState<AddAnggotaScreen> {
  late final TextEditingController _ktpController;
  late final TextEditingController _namaController;
  late final TextEditingController _tanggalLahirController;
  late final TextEditingController _alamatController;

  final _formKey = GlobalKey<FormState>();

  String? _hubungan;
  String? _jenisKelamin;
  String? _kelompok;
  int? _idDesa;
  int? _idKecamatan;

  @override
  void initState() {
    super.initState();
    _ktpController = TextEditingController();
    _namaController = TextEditingController();
    _tanggalLahirController = TextEditingController();
    _alamatController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _ktpController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_idKecamatan));
    final listKelompok = ref.watch(listKelompokProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Anggota Keluarga'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField(
              value: _hubungan,
              decoration: const InputDecoration(
                labelText: 'Hubungan Keluarga',
              ),
              validator: (value) {
                if (value == null || _hubungan == null) {
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
              onChanged: (value) {
                setState(() {
                  _hubungan = value;
                });
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _ktpController,
              decoration: const InputDecoration(
                labelText: 'KTP',
                helperText: 'Opsional',
              ),
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
            Row(
              children: [
                Flexible(
                  child: DropdownButtonFormField(
                    value: _jenisKelamin,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Kelamin',
                    ),
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
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    controller: _tanggalLahirController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir',
                    ),
                    onTap: () async {
                      final dateTime = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2050),
                      );

                      if (dateTime != null) {
                        _tanggalLahirController.text =
                            DateFormat('y-MM-dd').format(dateTime);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int?>(
              value: _idKecamatan,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Kecamatan harus diisi.';
                }

                return null;
              },
              items: listKecamatan.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (kecamatan) => DropdownMenuItem(
                        value: kecamatan.iDKecamatan,
                        child: Text(kecamatan.nama),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idKecamatan = value;
                  _idDesa = null;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int?>(
              value: _idDesa,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Desa',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Desa harus diisi.';
                }

                return null;
              },
              items: listDesa.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (desa) => DropdownMenuItem(
                        value: desa.iDDesa,
                        child: Text(desa.nama),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idDesa = value;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String?>(
              value: _kelompok,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Kelompok',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Desa harus diisi.';
                }

                return null;
              },
              items: listKelompok.maybeWhen(
                data: (data) => data
                    .map(
                      (kelompok) => DropdownMenuItem(
                        value: kelompok.iDKelompok,
                        child: Text("${kelompok.namaKelompok}"),
                      ),
                    )
                    .toList(),
                orElse: () => [],
              ),
              onChanged: (value) {
                setState(() {
                  _kelompok = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final penduduk = Penduduk(
                    kTP: _ktpController.text,
                    nama: _namaController.text,
                    jenisKelamin: _jenisKelamin,
                    tanggalLahir: _tanggalLahirController.text,
                    alamat: _alamatController.text,
                    iDDesa: _idDesa,
                    iDKecamatan: _idKecamatan,
                    iDKelompok: _kelompok,
                  );
                  // final anggota = AnggotaKeluarga(
                  //   hubungan: _hubungan,
                  //   iDKeluarga: widget.idKeluarga,
                  //   iDPenduduk: penduduk.iDPenduduk,
                  // );
                  // await ref
                  //     .read(keluargaProvider(widget.idKeluarga).notifier)
                  //     .save(anggota: anggota, penduduk: penduduk);

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
