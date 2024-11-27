import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/keluarga.dart';
import 'package:sigasi/providers/list_keluarga_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:uuid/uuid.dart';

import '../models/desa.dart';
import '../models/kecamatan.dart';
import '../providers/list_desa_provider.dart';
import '../providers/list_kecamatan_provider.dart';

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

  Kecamatan? _kecamatan;
  Desa? _desa;

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nomorKkController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_kecamatan?.iDKecamatan));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Keluarga'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: _nomorKkController,
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
            ElevatedButton(
              onPressed: () async {
                try {
                  setState(() {
                    _isLoading = true;
                  });
                  if (_formKey.currentState!.validate()) {
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
                  _isLoading = false;
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
