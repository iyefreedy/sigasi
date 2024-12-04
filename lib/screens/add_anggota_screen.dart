import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/keluarga.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/providers/list_kelompok_provider.dart';
import 'package:sigasi/providers/list_keluarga_provider.dart';

import '../models/anggota_keluarga.dart';
import '../providers/keluarga_provider.dart';
import '../providers/list_penduduk_provider.dart';

const listHubunganKeluarga = ['Istri', 'Anak', 'Orang Tua', 'Lainnya'];

class AddAnggotaScreen extends ConsumerStatefulWidget {
  const AddAnggotaScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAnggotaScreenState();
}

class _AddAnggotaScreenState extends ConsumerState<AddAnggotaScreen> {
  late final TextEditingController _ktpController;
  late final TextEditingController _namaController;
  late final TextEditingController _tanggalLahirController;

  final _formKey = GlobalKey<FormState>();

  String? _hubungan;
  String? _jenisKelamin;
  String? _kelompok;
  String? _idKeluarga;
  Keluarga? _keluarga;
  DateTime? _tanggalLahir;

  bool _isLoading = false;

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final penduduk = await ref
          .read(listPendududukProvider(
              (desa: _keluarga?.iDDesa, idKelompok: _kelompok)).notifier)
          .save(Penduduk(
            kTP: _ktpController.text,
            nama: _namaController.text,
            jenisKelamin: _jenisKelamin,
            tanggalLahir: _tanggalLahir,
            alamat: _keluarga?.alamat,
            iDDesa: _keluarga?.iDDesa,
            iDKecamatan: _keluarga?.iDKecamatan,
            iDKelompok: _kelompok,
          ));
      final anggota = AnggotaKeluarga(
        hubungan: _hubungan,
        iDKeluarga: _idKeluarga,
        iDPenduduk: penduduk.iDPenduduk,
      );
      await ref
          .read(keluargaProvider(_idKeluarga!).notifier)
          .save(anggota: anggota);

      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _ktpController = TextEditingController();
    _namaController = TextEditingController();
    _tanggalLahirController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _ktpController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listKelompok = ref.watch(listKelompokProvider);
    final listKeluarga = ref.watch(listKeluargaProvider((
      idDesa: null,
      idKecamatan: null,
    )));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Anggota Keluarga'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownSearch<Keluarga>(
              decoratorProps: const DropDownDecoratorProps(
                decoration: InputDecoration(labelText: 'Nama Kepala Keluarga'),
              ),
              filterFn: (item, filter) {
                final result = item.anggota?.any((anggota) => (anggota
                            .penduduk?.nama
                            ?.toLowerCase()
                            .contains(filter) ??
                        false)) ??
                    false;

                return result;
              },
              items: (filter, loadProps) {
                return listKeluarga.maybeWhen(
                  orElse: () => [],
                  data: (data) => data,
                );
              },
              onChanged: (value) {
                setState(() {
                  _idKeluarga = value?.iDKeluarga;
                  _keluarga = value;
                });
              },
              compareFn: (i, s) => i == s,
              popupProps: PopupPropsMultiSelection.dialog(
                itemBuilder: (context, item, isDisabled, isSelected) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${item.anggota!.where((anggota) => anggota.hubungan == 'Kepala Keluarga').isNotEmpty ? item.anggota?.where((anggota) => anggota.hubungan == 'Kepala Keluarga').first.penduduk?.nama : '-'}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          item.desa?.nama ?? '-',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                },
                showSearchBox: true,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: _hubungan,
              decoration: const InputDecoration(
                labelText: 'Hubungan Keluarga',
              ),
              validator: (value) {
                if (value == null || _hubungan == null) {
                  return 'Hubungan keluarga harus diisi.';
                }

                return null;
              },
              items: listHubunganKeluarga
                  .map((hubungan) => DropdownMenuItem(
                        value: hubungan,
                        child: Text(hubungan),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _hubungan = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ktpController,
              decoration: const InputDecoration(
                labelText: 'KTP',
                helperText: 'Opsional',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama harus diisi.';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: DropdownButtonFormField(
                    value: _jenisKelamin,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Kelamin',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis kelamin harus diisi.';
                      }

                      return null;
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Laki-Laki',
                        child: Text('Laki-Laki'),
                      ),
                      DropdownMenuItem(
                        value: 'Perempuan',
                        child: Text('Perempuan'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _jenisKelamin = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    controller: _tanggalLahirController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir',
                    ),
                    onTap: () async {
                      final dateTime = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (dateTime != null) {
                        setState(() {
                          _tanggalLahir = dateTime;
                        });
                        _tanggalLahirController.text =
                            DateFormat('y-MM-dd').format(dateTime);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String?>(
              value: _kelompok,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Kelompok',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Desa harus diisi.';
                }

                return null;
              },
              items: listKelompok.maybeWhen(
                data: (data) => data
                    .map(
                      (kelompok) => DropdownMenuItem(
                        value: kelompok.iDKelompok,
                        child: Text("${kelompok.namaKelompok}"),
                      ),
                    )
                    .toList(),
                orElse: () => [],
              ),
              onChanged: (value) {
                setState(() {
                  _kelompok = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : handleSubmit,
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
