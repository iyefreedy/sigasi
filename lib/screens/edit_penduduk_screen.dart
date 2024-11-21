import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';

import '../services/penduduk_service.dart';
import '../utils/app_router.dart';

const listDesa = [
  'Cibodas',
  'Ciherang',
  'Cipendawa',
  'Ciputri',
  'Gadog',
  'Sukatani',
  'Sukanagih'
];

class EditPendudukScreen extends ConsumerStatefulWidget {
  const EditPendudukScreen({super.key, required this.penduduk});

  final Penduduk penduduk;

  @override
  ConsumerState<EditPendudukScreen> createState() =>
      _CreatePendudukScreenState();
}

class _CreatePendudukScreenState extends ConsumerState<EditPendudukScreen> {
  late final TextEditingController _ktpController;
  late final TextEditingController _namaController;
  late final TextEditingController _tanggalLahirController;
  late final TextEditingController _alamatController;

  late final GlobalKey<FormState> _formKey;

  String? _jenisKelamin;
  String? _kelompok;
  String? _desa;

  @override
  void initState() {
    super.initState();

    _ktpController = TextEditingController(text: widget.penduduk.kTP);
    _namaController = TextEditingController(text: widget.penduduk.nama);
    _alamatController = TextEditingController(text: widget.penduduk.alamat);
    _tanggalLahirController =
        TextEditingController(text: widget.penduduk.tanggalLahir);
    _jenisKelamin = widget.penduduk.jenisKelamin;
    _kelompok = widget.penduduk.iDKelompok;
    _desa = widget.penduduk.desa;

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final listKelompok = ref.watch(listKelompokProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Penduduk'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
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
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2050),
                );

                if (dateTime != null) {
                  _tanggalLahirController.text =
                      DateFormat('y-MM-dd').format(dateTime);
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String?>(
              value: _desa,
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
              items: listDesa
                  .map(
                    (desa) => DropdownMenuItem(
                      value: desa,
                      child: Text(desa),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _desa = value;
                });
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
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final penduduk = widget.penduduk.copyWith(
                  alamat: _alamatController.text,
                  desa: _desa,
                  jenisKelamin: _jenisKelamin,
                  kTP: _ktpController.text,
                  kelompok: _kelompok,
                  nama: _namaController.text,
                  tanggalLahir: _tanggalLahirController.text,
                  lastUpdateBy: 'String',
                  lastUpdateDate: DateTime.now().toIso8601String(),
                );

                if (_formKey.currentState!.validate()) {
                  await (PendudukService()).updatePenduduk(penduduk);

                  if (context.mounted) {
                    Navigator.of(context).popUntil(
                      ModalRoute.withName(AppRouter.filterPendudukRoute),
                    );
                  }
                }
              },
              child: const Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
