import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/pengungsi.dart';
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
  final _kondisiKhususController = TextEditingController();
  String? _idPenduduk;
  String? _idPosko;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _kondisiKhususController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listPenduduk =
        ref.watch(listPendududukProvider((desa: null, idKelompok: null)));
    final listPosko = ref.watch(listPoskoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengungsi'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            DropdownButtonFormField<String?>(
              decoration: const InputDecoration(
                labelText: 'Identitas Pengungsi',
              ),
              items: listPenduduk.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (penduduk) => DropdownMenuItem(
                        value: penduduk.iDPenduduk,
                        child: Text('${penduduk.nama}'),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idPenduduk = value;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String?>(
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
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Kondisi Khusus',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final pengungsi = Pengungsi(
                    iDPengungsi: widget.pengungsi?.iDPengungsi,
                    iDPenduduk: _idPenduduk,
                    iDPosko: _idPosko,
                    kondisiKhusus: _kondisiKhususController.text,
                    lastUpdateDate: DateTime.now().toIso8601String(),
                  );

                  await ref
                      .read(listPengungsiProvider(
                          (idKelompok: null, idPosko: null)).notifier)
                      .save(pengungsi);

                  if (context.mounted) {
                    Navigator.of(context).popUntil(
                      (route) =>
                          route.settings.name == AppRouter.filterPengungsiRoute,
                    );
                  }
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
