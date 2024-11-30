import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sigasi/models/pengungsi.dart';
import 'package:sigasi/providers/list_desa_provider.dart';
import 'package:sigasi/providers/list_kecamatan_provider.dart';
import 'package:sigasi/providers/list_pengungsi_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/providers/penduduk_provider.dart';

class AddPengungsiScreen extends ConsumerStatefulWidget {
  const AddPengungsiScreen({super.key});

  @override
  ConsumerState<AddPengungsiScreen> createState() => _AddPengungsiScreenState();
}

class _AddPengungsiScreenState extends ConsumerState<AddPengungsiScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _idPosko;
  int? _idKecamatan;
  int? _idDesa;

  bool _isLoading = false;
  List<Pengungsi> _listPengungsi = [];

  @override
  Widget build(BuildContext context) {
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_idKecamatan));
    final listPenduduk = ref.watch(pendudukProvider(_idDesa));
    final listPosko = ref.watch(listPoskoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pengungsi'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<String?>(
              value: _idPosko,
              decoration: const InputDecoration(
                labelText: 'Posko',
              ),
              items: listPosko.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (posko) => DropdownMenuItem(
                        value: posko.iDPosko,
                        child: Text('${posko.lokasi}'),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idPosko = value;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<int?>(
              value: _idKecamatan,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
              ),
              items: listKecamatan.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (kecamatan) => DropdownMenuItem(
                        value: kecamatan.iDKecamatan,
                        child: Text(kecamatan.nama),
                      ),
                    )
                    .toList(),
              ),
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
              items: listDesa.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (desa) => DropdownMenuItem(
                        value: desa.iDDesa,
                        child: Text(desa.nama),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idDesa = value;
                });
              },
            ),
            const SizedBox(height: 10),
            if (listPenduduk.value == null || listPenduduk.value!.isEmpty)
              const Text(
                'Tidak ada data penduduk',
                textAlign: TextAlign.center,
              ),
            ...listPenduduk.maybeWhen(
              orElse: () => [],
              data: (data) {
                return data.map((penduduk) {
                  return CheckboxListTile(
                    value: _listPengungsi
                        .map((pengungsi) => pengungsi.iDPenduduk)
                        .contains(penduduk.iDPenduduk),
                    title: Text(penduduk.nama ?? '-'),
                    subtitle: Text(penduduk.kelompok?.namaKelompok ?? '-'),
                    onChanged: (value) {
                      print(value);
                      var updatedList = List<Pengungsi>.from(_listPengungsi);
                      if (value == true) {
                        updatedList.add(Pengungsi(
                          iDPenduduk: penduduk.iDPenduduk,
                          iDPosko: _idPosko,
                        ));
                      } else {
                        updatedList = updatedList
                            .where((pengungsi) =>
                                pengungsi.iDPenduduk != penduduk.iDPenduduk)
                            .toList();
                      }

                      setState(() {
                        _listPengungsi = updatedList;
                      });
                    },
                  );
                });
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isLoading || _listPengungsi.isEmpty
                  ? null
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });

                        final futures = _listPengungsi.map((pengungsi) => ref
                            .read(listPengungsiProvider(
                              (idKelompok: null, idPosko: _idPosko),
                            ).notifier)
                            .save(pengungsi));

                        await Future.wait(futures);

                        setState(() {
                          _isLoading = false;
                        });

                        if (context.mounted) {
                          await showDialog(
                              context: context,
                              builder: (builder) {
                                return AlertDialog(
                                  title: const Text('Berhasil'),
                                  content: const Text('Data berhasil disimpan'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              });
                        }

                        setState(() {
                          _idKecamatan = null;
                          _idDesa = null;
                          _listPengungsi = [];
                        });
                      }
                    },
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
