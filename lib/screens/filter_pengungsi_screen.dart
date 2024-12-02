import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/posko.dart';
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
  late final GlobalKey<FormState> _formKey;
  Posko? _posko;
  String? _idKelompok;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

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
          Navigator.of(context).pushNamed(AppRouter.addPengungsiRoute);
        },
        child: const Icon(Icons.person_add),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<Posko>(
              value: _posko,
              decoration: const InputDecoration(
                labelText: 'Posko',
              ),
              validator: (value) => value == null ? 'Pilih posko' : null,
              items: listPosko.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map((posko) => DropdownMenuItem(
                          value: posko,
                          child: Text(posko.lokasi ?? '-'),
                        ))
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _posko = value;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              isExpanded: true,
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
                    .toList()
                  ..add(const DropdownMenuItem(
                    value: null,
                    child: Text('Semua Kelompok'),
                  )),
              ),
              onChanged: (value) {
                setState(() {
                  _idKelompok = value;
                });
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context)
                      .pushNamed(AppRouter.listPengungsiRoute, arguments: (
                    posko: _posko,
                    idKelompok: _idKelompok,
                  ));
                }
              },
              child: const Text('Cari...'),
            )
          ],
        ),
      ),
    );
  }
}
