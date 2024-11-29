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
  late final TextEditingController _kondisiKhususController;
  String? _idPenduduk;
  String? _idPosko;
  final _formKey = GlobalKey<FormState>();

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
              value: _idPenduduk,
              isExpanded: true,
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
            const SizedBox(height: 12),
            TextFormField(
              controller: _kondisiKhususController,
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
                    lastUpdateDate: DateTime.now(),
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
