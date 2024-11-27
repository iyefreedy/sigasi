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
  late final TextEditingController _namaKontakController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _namaPerusahaanController =
        TextEditingController(text: widget.donatur?.namaPerusahaan);
    _namaKontakController =
        TextEditingController(text: widget.donatur?.namaKontak);
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama perusahaan tidak boleh kosong';
                }

                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _namaKontakController,
              decoration: const InputDecoration(
                labelText: 'Nama Kontak',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama kontak tidak boleh kosong';
                }

                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nomorKontakController,
              decoration: const InputDecoration(
                labelText: 'Nomor Kontak',
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nomor kontak tidak boleh kosong';
                }

                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama perusahaan tidak boleh kosong';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        final donatur = Donatur(
                          alamat: _alamatController.text,
                          namaKontak: _namaKontakController.text,
                          iDDonatur: widget.donatur?.iDDonatur,
                          namaPerusahaan: _namaPerusahaanController.text,
                          nomorKontak: _nomorKontakController.text,
                        );
                        await ref
                            .read(listDonaturProvider.notifier)
                            .save(donatur);

                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
