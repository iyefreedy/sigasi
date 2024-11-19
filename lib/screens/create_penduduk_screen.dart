import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/providers/list_penduduk_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class CreatePendudukScreen extends ConsumerStatefulWidget {
  const CreatePendudukScreen({super.key});

  @override
  ConsumerState<CreatePendudukScreen> createState() =>
      _CreatePendudukScreenState();
}

class _CreatePendudukScreenState extends ConsumerState<CreatePendudukScreen> {
  late final TextEditingController _ktpController;
  late final TextEditingController _namaController;
  late final TextEditingController _desaController;
  late final TextEditingController _tanggalLahirController;
  late final TextEditingController _alamatController;

  late final GlobalKey<FormState> _formKey;

  DateTime? _tanggalLahir;
  String? _jenisKelamin;
  String? _kelompok;

  @override
  void initState() {
    super.initState();

    _ktpController = TextEditingController();
    _namaController = TextEditingController();
    _desaController = TextEditingController();
    _alamatController = TextEditingController();
    _tanggalLahirController =
        TextEditingController(text: _tanggalLahir?.toIso8601String());
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
            DropdownButtonFormField(
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
                  child: Text('Peremuan'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _jenisKelamin = value;
                });
              },
            ),
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
                  setState(() {
                    _tanggalLahir = dateTime;
                  });
                  _tanggalLahirController.text =
                      DateFormat('y-MM-dd').format(dateTime);
                }
              },
            ),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            TextFormField(
              controller: _desaController,
              decoration: const InputDecoration(
                labelText: 'Desa',
              ),
            ),
            DropdownButtonFormField<String?>(
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Kelompok',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Kelompok harus diisi.';
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
            ElevatedButton(
              onPressed: () async {
                final penduduk = Penduduk(
                  alamat: _alamatController.text,
                  desa: _desaController.text,
                  jenisKelamin: _jenisKelamin,
                  kTP: _ktpController.text,
                  iDKelompok: _kelompok,
                  nama: _namaController.text,
                  tanggalLahir: _tanggalLahirController.text,
                  lastUpdateBy: 'dc119c38-6aaf-4355-94f2-e171f0a1311d',
                  lastUpdateDate: DateTime.now().toIso8601String(),
                );

                if (_formKey.currentState!.validate()) {
                  await ref
                      .read(listPendududukProvider((desa: '', idKelompok: null))
                          .notifier)
                      .save(penduduk);

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
