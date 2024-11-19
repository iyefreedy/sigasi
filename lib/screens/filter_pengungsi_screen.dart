import 'package:flutter/material.dart';
import 'package:sigasi/services/kelompok_service.dart';
import 'package:sigasi/services/posko_service.dart';

import '../models/kelompok.dart';
import '../models/posko.dart';

class FilterPengungsiScreen extends StatefulWidget {
  const FilterPengungsiScreen({super.key});

  @override
  State<FilterPengungsiScreen> createState() => _FilterPengungsiScreenState();
}

class _FilterPengungsiScreenState extends State<FilterPengungsiScreen> {
  List<Kelompok> _listKelompok = [];
  List<Posko> _listPosko = [];

  int? _idPosko;
  int? _idKelompok;

  final _kelompokService = KelompokService();
  final _poskoService = PoskoService();

  @override
  void initState() {
    super.initState();
    fetchKelompokAndPosko();
  }

  void fetchKelompokAndPosko() async {
    _listKelompok = await _kelompokService.fetchKelompok();
    _listPosko = await _poskoService.fetchPosko();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Pengungsi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField(
              value: _idPosko,
              items: _listPosko
                  .map((posko) => DropdownMenuItem(
                        value: posko.iDPosko,
                        child: Text(posko.lokasi ?? '-'),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            DropdownButtonFormField(
              value: _idKelompok,
              items: _listKelompok
                  .map((kelompok) => DropdownMenuItem(
                        value: kelompok.iDKelompok,
                        child: Text(kelompok.namaKelompok ?? '-'),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
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
