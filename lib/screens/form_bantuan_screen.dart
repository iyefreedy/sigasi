import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/detail_bantuan.dart';
import 'package:sigasi/providers/list_bantuan_provider.dart';
import 'package:sigasi/providers/list_barang_provider.dart';
import 'package:sigasi/providers/list_donatur_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:uuid/uuid.dart';

import '../models/bantuan.dart';

class FormBantuanScreen extends ConsumerStatefulWidget {
  const FormBantuanScreen({super.key, this.bantuan});

  final Bantuan? bantuan;

  @override
  ConsumerState<FormBantuanScreen> createState() => _FormBantuanScreenState();
}

class _FormBantuanScreenState extends ConsumerState<FormBantuanScreen> {
  final _tanggalBantuanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _idDonatur;
  DateTime? _tanggalBantuan;

  List<DetailBantuan> _listDetailBantuan = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listBarang = ref.watch(listBarangProvider);
    final listDonatur = ref.watch(listDonaturProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Bantuan'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _idDonatur,
                onChanged: (value) {
                  setState(() {
                    _idDonatur = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Donatur',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Pilih donatur';
                  }

                  return null;
                },
                items: listDonatur.maybeWhen(
                  orElse: () => [],
                  data: (data) => data
                      .map((donatur) => DropdownMenuItem(
                            value: donatur.iDDonatur,
                            child: Text(donatur.namaPerusahaan ?? '-'),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                readOnly: true,
                controller: _tanggalBantuanController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Bantuan',
                ),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2045),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _tanggalBantuan = selectedDate;
                      _tanggalBantuanController.text =
                          DateFormat('y-MM-dd').format(selectedDate);
                    });
                  }
                },
                validator: (_) {
                  if (_tanggalBantuan == null) {
                    return 'Tanggal bantuan harus diisi';
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
                      setState(() {
                        _listDetailBantuan = [
                          ..._listDetailBantuan,
                          DetailBantuan(iDBantuanDTL: const Uuid().v4()),
                        ];
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              // Menampilkan detail barang dinamis
              ..._listDetailBantuan.map(
                (detail) {
                  final index = _listDetailBantuan.indexOf(detail);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: DropdownButtonFormField<String?>(
                            isExpanded: true,
                            value: detail.iDBarang,
                            decoration: const InputDecoration(
                              labelText: 'Barang',
                            ),
                            items: listBarang.maybeWhen(
                              orElse: () => [],
                              data: (data) => data
                                  .map(
                                    (barang) => DropdownMenuItem(
                                      value: barang.iDBarang,
                                      child: Text(barang.namaBarang ?? '-'),
                                    ),
                                  )
                                  .toList(),
                            ),
                            onChanged: (value) {
                              // Update idBarang di dalam DetailBantuan yang sesuai
                              final updatedDetail =
                                  detail.copyWith(iDBarang: value);

                              // Buat list baru dengan detail yang diperbarui
                              final updatedList = List<DetailBantuan>.from(
                                _listDetailBantuan,
                              );
                              updatedList[index] = updatedDetail;

                              // Perbarui state dengan list baru
                              setState(() {
                                _listDetailBantuan = updatedList;
                              });
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
                                jumlah: int.tryParse(value) ?? 0,
                              );

                              // Buat list baru dengan detail yang diperbarui
                              final updatedList = List<DetailBantuan>.from(
                                _listDetailBantuan,
                              );
                              updatedList[index] = updatedDetail;

                              // Perbarui state dengan list baru
                              setState(() {
                                _listDetailBantuan = updatedList;
                              });
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
                            final t = _listDetailBantuan
                                .where((item) => item != detail)
                                .toList();

                            setState(() {
                              _listDetailBantuan = t;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: !_isLoading && _listDetailBantuan.isNotEmpty
                        ? () async {
                            setState(() {
                              _isLoading = true;
                            });
                            final bantuan =
                                (widget.bantuan ?? Bantuan()).copyWith(
                              iDDonatur: _idDonatur,
                              tanggalBantuan: _tanggalBantuan,
                              detailBantuan: _listDetailBantuan,
                            );

                            if (_formKey.currentState!.validate()) {
                              await ref
                                  .read(listBantuanProvider.notifier)
                                  .save(bantuan);

                              setState(() {
                                _isLoading = false;
                              });

                              if (context.mounted) {
                                Navigator.of(context).popUntil((route) =>
                                    route.settings.name ==
                                    AppRouter.listBantuanRoute);
                              }
                            }
                          }
                        : null,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Simpan'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
