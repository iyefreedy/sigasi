import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/models/pengungsi.dart';
import 'package:sigasi/providers/list_desa_provider.dart';
import 'package:sigasi/providers/list_kecamatan_provider.dart';
import 'package:sigasi/providers/list_penduduk_provider.dart';
import 'package:sigasi/providers/list_pengungsi_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class FormPengungsiScreen extends ConsumerStatefulWidget {
  const FormPengungsiScreen({super.key, this.pengungsi});

  final Pengungsi? pengungsi;

  @override
  ConsumerState<FormPengungsiScreen> createState() =>
      _FormPengungsiScreenState();
}

class _FormPengungsiScreenState extends ConsumerState<FormPengungsiScreen> {
  late final TextEditingController _kondisiKhususController;
  final _formKey = GlobalKey<FormState>();

  String? _idPenduduk;
  String? _idPosko;
  int? _idKecamatan;
  int? _idDesa;

  bool _isLoading = false;
  List<Penduduk> _listPenduduk = [];

  @override
  void initState() {
    super.initState();
    _kondisiKhususController =
        TextEditingController(text: widget.pengungsi?.kondisiKhusus);
    _idPenduduk = widget.pengungsi?.iDPenduduk;
    _idPosko = widget.pengungsi?.iDPosko;
  }

  @override
  void dispose() {
    super.dispose();
    _kondisiKhususController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listKecamatan = ref.watch(listKecamatanProvider);
    final listDesa = ref.watch(listDesaProvider(_idKecamatan));
    final listPenduduk =
        ref.watch(listPendududukProvider((desa: _idDesa, idKelompok: null)));
    final listPosko = ref.watch(listPoskoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengungsi'),
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
            ...listPenduduk.maybeWhen(
              orElse: () => [],
              data: (data) {
                return data.map((penduduk) {
                  return CheckboxListTile(
                    value: _listPenduduk.contains(penduduk),
                    title: Text(penduduk.nama ?? '-'),
                    subtitle: Text(penduduk.kelompok?.namaKelompok ?? '-'),
                    onChanged: (value) {
                      final updatedList = List<Penduduk>.from(_listPenduduk)
                        ..add(penduduk);

                      setState(() {
                        _listPenduduk = updatedList;
                      });
                    },
                  );
                });
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        final pengungsi = Pengungsi(
                          iDPengungsi: widget.pengungsi?.iDPengungsi,
                          iDPenduduk: _idPenduduk,
                          iDPosko: _idPosko,
                          kondisiKhusus: _kondisiKhususController.text,
                          lastUpdateDate: DateTime.now(),
                        );

                        await ref
                            .read(listPengungsiProvider(
                                (idKelompok: null, idPosko: null)).notifier)
                            .save(pengungsi);

                        setState(() {
                          _isLoading = false;
                        });

                        if (context.mounted) {
                          Navigator.of(context).popUntil(
                            (route) =>
                                route.settings.name ==
                                AppRouter.filterPengungsiRoute,
                          );
                        }
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
