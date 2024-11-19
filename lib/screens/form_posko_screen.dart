import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/posko.dart';
import 'package:sigasi/providers/list_pengguna_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';

class FormPoskoScreen extends ConsumerStatefulWidget {
  const FormPoskoScreen({super.key, this.posko});

  final Posko? posko;

  @override
  ConsumerState<FormPoskoScreen> createState() => _FormPoskoScreenState();
}

class _FormPoskoScreenState extends ConsumerState<FormPoskoScreen> {
  late TextEditingController _lokasiController;
  late TextEditingController _masalahController;
  late TextEditingController _solusiMasalahController;

  String? _idPengguna;

  @override
  void initState() {
    super.initState();
    _lokasiController = TextEditingController(text: widget.posko?.lokasi);
    _masalahController = TextEditingController(text: widget.posko?.masalah);
    _solusiMasalahController =
        TextEditingController(text: widget.posko?.solusiMasalah);
    _idPengguna = widget.posko?.iDKetua;
  }

  @override
  Widget build(BuildContext context) {
    final listPengguna = ref.watch(listPenggunaProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Posko'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<String?>(
              value: _idPengguna,
              items: listPengguna.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map((pengguna) => DropdownMenuItem(
                          value: pengguna.iDPengguna,
                          child: Text(pengguna.nama ?? '-'),
                        ))
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idPengguna = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Ketua',
              ),
            ),
            TextFormField(
              controller: _lokasiController,
              decoration: const InputDecoration(
                labelText: 'Lokasi',
              ),
            ),
            TextFormField(
              controller: _masalahController,
              decoration: const InputDecoration(
                labelText: 'Masalah',
              ),
            ),
            TextFormField(
              controller: _solusiMasalahController,
              decoration: const InputDecoration(
                labelText: 'Solusi Masalah',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final posko = Posko(
                  iDPosko: widget.posko?.iDPosko,
                  iDKetua: _idPengguna,
                  lokasi: _lokasiController.text,
                  masalah: _masalahController.text,
                  solusiMasalah: _solusiMasalahController.text,
                );

                await ref.read(listPoskoProvider.notifier).save(posko);

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
