import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_desa_provider.dart';
import 'package:sigasi/providers/list_kecamatan_provider.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class FilterPendudukScreen extends ConsumerStatefulWidget {
  const FilterPendudukScreen({super.key});

  @override
  ConsumerState<FilterPendudukScreen> createState() =>
      _FilterPendudukScreenState();
}

class _FilterPendudukScreenState extends ConsumerState<FilterPendudukScreen> {
  final _formKey = GlobalKey<FormState>();

  int? _idDesa;
  int? _idKecamatan;
  String? _kelompok;

  @override
  Widget build(BuildContext context) {
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_idKecamatan));
    final listKelompok = ref.watch(listKelompokProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Penduduk'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<int?>(
              value: _idKecamatan,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Pilih kecamatan';
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
                      .toList()),
              onChanged: (value) {
                setState(() {
                  _idKecamatan = value;
                  _idDesa = null;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<int?>(
              value: _idDesa,
              decoration: const InputDecoration(
                labelText: 'Desa',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Pilih desa';
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
                      .toList()),
              onChanged: (value) {
                setState(() {
                  _idDesa = value;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String?>(
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Kelompok',
              ),
              value: _kelompok,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pilih kelompok';
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
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _kelompok = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushNamed(
                    AppRouter.listPendudukRoute,
                    arguments: [_kelompok, _idDesa],
                  );
                }
              },
              label: const Text('Cari penduduk...'),
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
    );
  }
}
