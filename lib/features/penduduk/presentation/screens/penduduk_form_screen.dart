import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/shared/globals.dart';

import '../../../../shared/domain/models/penduduk/penduduk.dart';
import '../../../kelompok/notifiers/kelompok_list_notifier.dart';
import '../../notifiers/penduduk_list_notifier.dart';

@RoutePage()
class PendudukFormScreen extends ConsumerStatefulWidget {
  const PendudukFormScreen({super.key, this.penduduk});

  final Penduduk? penduduk;

  @override
  ConsumerState<PendudukFormScreen> createState() => _PendudukFormScreenState();
}

class _PendudukFormScreenState extends ConsumerState<PendudukFormScreen> {
  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.penduduk != null && widget.penduduk!.tanggalLahir != null) {
      _tanggalLahirController.text =
          widget.penduduk!.tanggalLahir!.format('d MMM y');
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final populationGroupList = ref.watch(kelompokListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Penduduk'),
      ),
      body: HookBuilder(
        builder: (context) {
          final state = useState(
            widget.penduduk ?? Penduduk.withLastUpdated(),
          );

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: state.value.ktp,
                    onChanged: (value) {
                      state.value = state.value.copyWith(ktp: value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'NIK',
                      helperText: 'Opsional',
                    ),
                  ),
                  TextFormField(
                    initialValue: state.value.nama,
                    onChanged: (value) {
                      state.value = state.value.copyWith(nama: value);
                    },
                    decoration: const InputDecoration(labelText: 'Nama'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                  DropdownButtonFormField<JenisKelamin>(
                    value: state.value.jenisKelamin,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Kelamin',
                    ),
                    items: JenisKelamin.values
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender.label),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      state.value = state.value.copyWith(jenisKelamin: value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Jenis kelamin harus dipilih';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: _tanggalLahirController,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir',
                    ),
                    keyboardType: TextInputType.datetime,
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1930),
                        lastDate: DateTime(2045),
                      );
                      if (selectedDate != null) {
                        state.value =
                            state.value.copyWith(tanggalLahir: selectedDate);

                        _tanggalLahirController.text =
                            selectedDate.format('d MMM y');
                      }
                    },
                    validator: (_) {
                      if (state.value.tanggalLahir == null) {
                        return 'Tanggal Lahir harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: state.value.alamat,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat harus diisi.';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                    ),
                    minLines: 1,
                    maxLines: 3,
                    onChanged: (value) {
                      state.value = state.value.copyWith(alamat: value);
                    },
                  ),
                  TextFormField(
                    initialValue: state.value.desa,
                    onChanged: (value) {
                      state.value = state.value.copyWith(nama: value);
                    },
                    decoration: const InputDecoration(labelText: 'Desa'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                  DropdownButtonFormField<int>(
                    isExpanded: true,
                    value: state.value.idKelompok,
                    decoration: const InputDecoration(
                      labelText: 'Kelompok',
                    ),
                    style:
                        Theme.of(context).dropdownMenuTheme.textStyle?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                    items: populationGroupList.maybeWhen(
                      orElse: () => [],
                      data: (data) => data
                          .map(
                            (populationGroup) => DropdownMenuItem(
                              value: populationGroup.idKelompok,
                              child: Text(
                                populationGroup.namaKelompok ?? "-",
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Kelompok harus dipilih.';
                      }

                      return null;
                    },
                    onChanged: (value) {
                      state.value = state.value.copyWith(idKelompok: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref
                            .read(pendudukListNotifierProvider.notifier)
                            .save(state.value);

                        if (context.mounted) AutoRouter.of(context).maybePop();
                      }
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
