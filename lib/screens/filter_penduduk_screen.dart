import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/utils/app_router.dart';

const listDesa = [
  'Cibodas',
  'Ciherang',
  'Cipendawa',
  'Ciputri',
  'Gadog',
  'Sukatani',
  'Sukanagih'
];

class FilterPendudukScreen extends ConsumerStatefulWidget {
  const FilterPendudukScreen({super.key});

  @override
  ConsumerState<FilterPendudukScreen> createState() =>
      _FilterPendudukScreenState();
}

class _FilterPendudukScreenState extends ConsumerState<FilterPendudukScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _desa;
  String? _kelompok;

  @override
  Widget build(BuildContext context) {
    final listKelompok = ref.watch(listKelompokProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Penduduk'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formPendudukRoute);
        },
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField(
              value: _desa,
              decoration: const InputDecoration(
                labelText: 'Desa',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pilih desa';
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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushNamed(
                    AppRouter.listPendudukRoute,
                    arguments: [_kelompok, _desa],
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
