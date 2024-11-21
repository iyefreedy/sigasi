import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class FilterPengungsiScreen extends ConsumerStatefulWidget {
  const FilterPengungsiScreen({super.key});

  @override
  ConsumerState<FilterPengungsiScreen> createState() =>
      _FilterPengungsiScreenState();
}

class _FilterPengungsiScreenState extends ConsumerState<FilterPengungsiScreen> {
  String? _idPosko;
  String? _idKelompok;

  @override
  Widget build(BuildContext context) {
    final listPosko = ref.watch(listPoskoProvider);
    final listKelompok = ref.watch(listKelompokProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Pengungsi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formPengungsiRoute);
        },
        child: const Icon(Icons.person_add),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<String>(
              value: _idPosko,
              decoration: const InputDecoration(
                labelText: 'Posko',
              ),
              items: listPosko.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map((posko) => DropdownMenuItem(
                          value: posko.iDPosko,
                          child: Text(posko.lokasi ?? '-'),
                        ))
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idPosko = value;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _idKelompok,
              decoration: const InputDecoration(
                labelText: 'Kelompok penduduk',
              ),
              items: listKelompok.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map((kelompok) => DropdownMenuItem(
                          value: kelompok.iDKelompok,
                          child: Text(kelompok.namaKelompok ?? '-'),
                        ))
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idKelompok = value;
                });
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Cari...'),
            )
          ],
        ),
      ),
    );
  }
}
