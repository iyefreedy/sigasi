import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
  final _tanggalDistribusiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _idPosko;
  String? _idBarang;
  DateTime? _tanggalDistribusi;

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
                    .where((kebutuhan) =>
                        (kebutuhan.jumlahDiterima ?? 0) <
                        (kebutuhan.jumlahKebutuhan ?? 0))
                    .map(
                      (kebutuhan) => DropdownMenuItem(
                        value: kebutuhan.iDBarang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(kebutuhan.barang?.namaBarang ?? '-'),
                            Text((kebutuhan.barang?.stok?.jumlah ?? 0)
                                .toString())
                          ],
                        ),
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
            TextFormField(
              controller: _tanggalDistribusiController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Tanggal Distribusi',
              ),
              onTap: () async {
                final dateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1930),
                  lastDate: DateTime(2050),
                );

                if (dateTime != null) {
                  setState(() {
                    _tanggalDistribusi = dateTime;
                  });
                  _tanggalDistribusiController.text =
                      DateFormat('y-MM-dd').format(dateTime);
                }
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

                        try {
                          final distribusi = Distribusi(
                            iDBarang: _idBarang,
                            iDPosko: _idPosko,
                            jumlah: int.parse(_jumlahDistribusiController.text),
                            tanggalDistribusi: _tanggalDistribusi,
                          );

                          await ref
                              .read(listDistribusiProvider.notifier)
                              .save(distribusi);

                          if (context.mounted) {
                            Navigator.of(context).popUntil((route) =>
                                route.settings.name ==
                                AppRouter.listDistribusiRoute);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            await showErrorDialog(context, '$e');
                          }
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
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
