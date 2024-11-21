import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_donatur_provider.dart';

import '../models/donatur.dart';

class FormDonaturScreen extends ConsumerStatefulWidget {
  const FormDonaturScreen({super.key, this.donatur});

  final Donatur? donatur;

  @override
  ConsumerState<FormDonaturScreen> createState() => _FormDonaturScreenState();
}

class _FormDonaturScreenState extends ConsumerState<FormDonaturScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _namaPerusahaanController;
  late final TextEditingController _nomorKontakController;
  late final TextEditingController _alamatController;

  @override
  void initState() {
    super.initState();

    _namaPerusahaanController =
        TextEditingController(text: widget.donatur?.namaPerusahaan);
    _nomorKontakController =
        TextEditingController(text: widget.donatur?.nomorKontak);
    _alamatController = TextEditingController(text: widget.donatur?.alamat);
  }

  @override
  void dispose() {
    super.dispose();
    _namaPerusahaanController.dispose();
    _nomorKontakController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Donatur'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: _namaPerusahaanController,
              decoration: const InputDecoration(
                labelText: 'Nama Perusahaan',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nomorKontakController,
              decoration: const InputDecoration(
                labelText: 'Nomor Kontak',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final donatur = Donatur(
                  alamat: _alamatController.text,
                  iDDonatur: widget.donatur?.iDDonatur,
                  namaPerusahaan: _namaPerusahaanController.text,
                  nomorKontak: _nomorKontakController.text,
                );
                await ref.read(listDonaturProvider.notifier).save(donatur);

                if (context.mounted) {
                  Navigator.of(context).pop();
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
