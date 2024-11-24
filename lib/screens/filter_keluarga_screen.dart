import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/desa.dart';
import 'package:sigasi/models/kecamatan.dart';
import 'package:sigasi/providers/list_desa_provider.dart';
import 'package:sigasi/providers/list_kecamatan_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class FilterKeluargaScreen extends ConsumerStatefulWidget {
  const FilterKeluargaScreen({super.key});

  @override
  ConsumerState<FilterKeluargaScreen> createState() => _FilterKeluargaScreen();
}

class _FilterKeluargaScreen extends ConsumerState<FilterKeluargaScreen> {
  final _formKey = GlobalKey<FormState>();

  Kecamatan? _kecamatan;
  Desa? _desa;

  @override
  Widget build(BuildContext context) {
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_kecamatan?.iDKecamatan));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter data Keluarga'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formKeluargaRoute);
        },
        child: const Icon(Icons.add_circle),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<Kecamatan>(
              value: _kecamatan,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
              ),
              validator: (value) {
                if (value == null || _kecamatan == null) {
                  return 'Pilih kecamatan';
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
              validator: (value) {
                if (value == null || _desa == null) {
                  return 'Pilih desa';
                }

                return null;
              },
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
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context)
                      .pushNamed(AppRouter.listKeluargaRoute, arguments: [
                    _kecamatan!.iDKecamatan,
                    _desa!.iDDesa,
                  ]);
                }
              },
              label: const Text('Cari keluarga'),
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
    );
  }
}
