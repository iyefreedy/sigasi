import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/population_group/notifiers/population_group_notifier.dart';
import 'package:sigasi/features/resident/notifiers/resident_list_notifier.dart';
import 'package:sigasi/features/village/notifiers/village_list_notifier.dart';
import 'package:sigasi/shared/globals.dart';

import '../../../../shared/domain/models/resident/resident.dart';

@RoutePage()
class ResidentFormScreen extends ConsumerStatefulWidget {
  const ResidentFormScreen({super.key, this.resident});

  final Resident? resident;

  @override
  ConsumerState<ResidentFormScreen> createState() => _ResidentFormScreenState();
}

class _ResidentFormScreenState extends ConsumerState<ResidentFormScreen> {
  final TextEditingController _birthDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final villageList = ref.watch(villageListNotifierProvider);
    final populationGroupList = ref.watch(populationGroupNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Penduduk'),
      ),
      body: HookBuilder(
        builder: (context) {
          final state = useState(
            widget.resident ??
                Resident(
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
          );

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: state.value.identityNumber,
                    onChanged: (value) {
                      state.value = state.value.copyWith(identityNumber: value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'NIK'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'NIK tidak boleh kosong';
                      }

                      if (value.length != 16) {
                        return 'NIK harus berisikan 16 digit angka';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: state.value.name,
                    onChanged: (value) {
                      state.value = state.value.copyWith(name: value);
                    },
                    decoration: const InputDecoration(labelText: 'Nama'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                  DropdownButtonFormField<Gender>(
                    value: state.value.gender,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Kelamin',
                    ),
                    items: Gender.values
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender.label),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      state.value = state.value.copyWith(gender: value);
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
                    controller: _birthDateController,
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
                            state.value.copyWith(birthDate: selectedDate);

                        _birthDateController.text =
                            selectedDate.format('d MMM y');
                      }
                    },
                    validator: (_) {
                      if (state.value.birthDate == null) {
                        return 'Tanggal Lahir harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: state.value.address,
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
                      state.value = state.value.copyWith(address: value);
                    },
                  ),
                  DropdownButtonFormField<int>(
                    value: state.value.villageId,
                    decoration: const InputDecoration(
                      labelText: 'Desa',
                    ),
                    items: villageList.maybeWhen(
                      orElse: () => [],
                      data: (data) => data
                          .map(
                            (village) => DropdownMenuItem(
                              value: village.id,
                              child: Text(village.name),
                            ),
                          )
                          .toList(),
                    ),
                    onChanged: (value) {
                      state.value = state.value.copyWith(villageId: value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Kelompok harus dipilih.';
                      }

                      return null;
                    },
                  ),
                  DropdownButtonFormField<int>(
                    value: state.value.populationGroupId,
                    decoration: const InputDecoration(
                      labelText: 'Kelompok',
                    ),
                    items: populationGroupList.maybeWhen(
                      orElse: () => [],
                      data: (data) => data
                          .map(
                            (populationGroup) => DropdownMenuItem(
                              value: populationGroup.id,
                              child: Text(populationGroup.name),
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
                      state.value =
                          state.value.copyWith(populationGroupId: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref
                            .read(residentListNotifierProvider.notifier)
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
