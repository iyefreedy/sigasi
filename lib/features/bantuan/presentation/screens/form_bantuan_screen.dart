import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:sigasi/shared/globals.dart';
import 'package:sigasi/shared/widgets/barang_dropdown_button.dart';

import '../../../../shared/domain/models/bantuan/bantuan.dart';
import '../../../../shared/domain/models/detail_bantuan/detail_bantuan.dart';
import '../../../../shared/widgets/donatur_dropdown_button.dart';

@RoutePage()
class FormBantuanScreen extends StatefulHookWidget {
  const FormBantuanScreen({super.key, this.bantuan});

  final Bantuan? bantuan;

  @override
  State<FormBantuanScreen> createState() => _FormBantuanScreenState();
}

class _FormBantuanScreenState extends State<FormBantuanScreen> {
  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.bantuan != null && widget.bantuan!.tanggalBantuan != null) {
      _tanggalLahirController.text =
          widget.bantuan!.tanggalBantuan!.format('d MMM y');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bantuanState = useState(widget.bantuan ?? const Bantuan());
    final listDetailBantuanState = useState<List<DetailBantuan>>([]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Bantuan'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              DonaturDropdownButton(
                value: bantuanState.value.idDonatur,
                onChanged: (value) {
                  bantuanState.value =
                      bantuanState.value.copyWith(idDonatur: value);
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih donatur';
                  }

                  return null;
                },
              ),
              TextFormField(
                readOnly: true,
                controller: _tanggalLahirController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Bantuan',
                ),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2045),
                  );
                  if (selectedDate != null) {
                    bantuanState.value = bantuanState.value
                        .copyWith(tanggalBantuan: selectedDate);

                    _tanggalLahirController.text =
                        selectedDate.format('d MMM y');
                  }
                },
                validator: (_) {
                  if (bantuanState.value.tanggalBantuan == null) {
                    return 'Tanggal Lahir harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Barang',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    onPressed: () {
                      // Update dengan list baru untuk memicu rebuild
                      listDetailBantuanState.value = [
                        ...listDetailBantuanState.value,
                        const DetailBantuan(),
                      ];
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              // Menampilkan detail barang dinamis
              ...listDetailBantuanState.value.map(
                (detail) {
                  final index = listDetailBantuanState.value.indexOf(detail);
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: BarangDropdownButton(
                          value: detail.idBarang,
                          onChanged: (value) {
                            // Update idBarang di dalam DetailBantuan yang sesuai
                            final updatedDetail =
                                detail.copyWith(idBarang: value);

                            // Buat list baru dengan detail yang diperbarui
                            final updatedList = List<DetailBantuan>.from(
                                listDetailBantuanState.value);
                            updatedList[index] = updatedDetail;

                            // Perbarui state dengan list baru
                            listDetailBantuanState.value = updatedList;
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Pilih barang';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          initialValue: detail.jumlah?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah',
                          ),
                          onChanged: (value) {
                            // Update jumlah di dalam DetailBantuan yang sesuai
                            final updatedDetail = detail.copyWith(
                                jumlah: int.tryParse(value) ?? 0);

                            // Buat list baru dengan detail yang diperbarui
                            final updatedList = List<DetailBantuan>.from(
                                listDetailBantuanState.value);
                            updatedList[index] = updatedDetail;

                            // Perbarui state dengan list baru
                            listDetailBantuanState.value = updatedList;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan jumlah';
                            }
                            return null;
                          },
                        ),
                      ),
                      // Misalkan tambahkan field lain seperti TextField untuk barang
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Menghapus detail barang
                          listDetailBantuanState.value = [
                            ...listDetailBantuanState.value
                                .where((item) => item != detail)
                          ];
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
