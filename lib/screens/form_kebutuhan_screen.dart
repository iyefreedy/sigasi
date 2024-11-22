import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/kebutuhan.dart';
import 'package:sigasi/providers/list_barang_provider.dart';
import 'package:sigasi/providers/list_kebutuhan_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class FormKebutuhanScreen extends ConsumerStatefulWidget {
  const FormKebutuhanScreen({
    super.key,
    this.kebutuhan,
  });

  final Kebutuhan? kebutuhan;

  @override
  ConsumerState<FormKebutuhanScreen> createState() =>
      _FormKebutuhanScreenState();
}

class _FormKebutuhanScreenState extends ConsumerState<FormKebutuhanScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _idPosko;
  String? _idBarang;

  final _jumlahKebutuhanController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _idPosko = widget.kebutuhan?.iDPosko;
    _idBarang = widget.kebutuhan?.iDBarang;
    _jumlahKebutuhanController.text =
        widget.kebutuhan?.jumlahDibutuhkan.toString() ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _jumlahKebutuhanController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listPosko = ref.watch(listPoskoProvider);
    final listBarang = ref.watch(listBarangProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Kebutuhan'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField<String?>(
              value: _idPosko,
              isExpanded: true,
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
              validator: (value) {
                if (value == null || _idPosko == null) {
                  return 'Pilih posko';
                }

                return null;
              },
              onChanged: (value) {
                setState(() {
                  _idPosko = value;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String?>(
              value: _idBarang,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Barang',
              ),
              items: listBarang.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map((barang) => DropdownMenuItem(
                          value: barang.iDBarang,
                          child: Text(barang.namaBarang ?? '-'),
                        ))
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idBarang = value;
                });
              },
              validator: (value) {
                if (value == null || _idBarang == null) {
                  return 'Pilih barang';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _jumlahKebutuhanController,
              decoration: const InputDecoration(
                labelText: 'Jumlah kebutuhan',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || _idPosko == null) {
                  return 'Isi jumlah kebutuhan';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final kebutuhan = Kebutuhan(
                    iDKebutuhan: widget.kebutuhan?.iDKebutuhan,
                    iDBarang: _idBarang,
                    iDPosko: _idPosko,
                    jumlahDibutuhkan:
                        int.parse(_jumlahKebutuhanController.text),
                  );

                  await ref
                      .read(listKebutuhanProvider.notifier)
                      .save(kebutuhan);

                  if (context.mounted) {
                    Navigator.of(context).popUntil(
                      (route) =>
                          route.settings.name == AppRouter.listKebutuhanRoute,
                    );
                  }
                }
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
