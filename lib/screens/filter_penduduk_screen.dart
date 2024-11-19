import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class FilterPendudukScreen extends ConsumerStatefulWidget {
  const FilterPendudukScreen({super.key});

  @override
  ConsumerState<FilterPendudukScreen> createState() =>
      _FilterPendudukScreenState();
}

class _FilterPendudukScreenState extends ConsumerState<FilterPendudukScreen> {
  late final _desaController = TextEditingController();
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
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
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
              value: _kelompok,
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRouter.listPendudukRoute,
                  arguments: [_kelompok, _desaController.text],
                );
              },
              child: const Text('Cari penduduk...'),
            )
          ],
        ),
      ),
    );
  }
}
