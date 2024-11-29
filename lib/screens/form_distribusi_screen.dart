import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/distribusi.dart';
import 'package:sigasi/providers/kebutuhan_posko_provider.dart';
import 'package:sigasi/providers/list_distribusi_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:sigasi/utils/dialogs/error_dialog.dart';

class FormDistribusiScreen extends ConsumerStatefulWidget {
  const FormDistribusiScreen({super.key});

  @override
  ConsumerState<FormDistribusiScreen> createState() =>
      _FormDistribusiScreenState();
}

class _FormDistribusiScreenState extends ConsumerState<FormDistribusiScreen> {
  final _jumlahDistribusiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _idPosko;
  String? _idBarang;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final listPosko = ref.watch(listPoskoProvider);
    final listKebutuhan = ref.watch(kebutuhanPoskoProvider(_idPosko));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Distrbusi'),
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
                    .map(
                      (posko) => DropdownMenuItem(
                        value: posko.iDPosko,
                        child: Text(posko.lokasi ?? '-'),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idPosko = value;
                  _idBarang = null;
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
              items: listKebutuhan.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (kebutuhan) => DropdownMenuItem(
                        value: kebutuhan.iDBarang,
                        child: Text(kebutuhan.barang?.namaBarang ?? '-'),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idBarang = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _jumlahDistribusiController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Distribusi',
              ),
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

                        try {
                          final distribusi = Distribusi(
                            iDBarang: _idBarang,
                            iDPosko: _idPosko,
                            jumlah: int.parse(_jumlahDistribusiController.text),
                          );

                          await ref
                              .read(listDistribusiProvider.notifier)
                              .save(distribusi);
                          setState(() {
                            _isLoading = false;
                          });

                          if (context.mounted) {
                            Navigator.of(context).popUntil((route) =>
                                route.settings.name ==
                                AppRouter.listDistribusiRoute);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            await showErrorDialog(context, '$e');
                          }
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
