import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/kebutuhan/notifiers/list_kebutuhan_notifier.dart';
import 'package:sigasi/shared/widgets/barang_dropdown_button.dart';
import 'package:sigasi/shared/widgets/posko_dropdown_button.dart';

import '../../../../shared/domain/models/kebutuhan/kebutuhan.dart';

@RoutePage()
class FormKebutuhanScreen extends StatelessWidget {
  const FormKebutuhanScreen({super.key, this.kebutuhan});

  final Kebutuhan? kebutuhan;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Kebutuhan'),
      ),
      body: HookBuilder(builder: (context) {
        final kebutuhanState =
            useState<Kebutuhan>(kebutuhan ?? const Kebutuhan());
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                PoskoDropdownButton(
                  value: kebutuhanState.value.idPosko,
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih posko';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    kebutuhanState.value =
                        kebutuhanState.value.copyWith(idPosko: value);
                  },
                ),
                BarangDropdownButton(
                  value: kebutuhanState.value.idBarang,
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih barang';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    kebutuhanState.value =
                        kebutuhanState.value.copyWith(idBarang: value);
                  },
                ),
                TextFormField(
                  initialValue:
                      kebutuhanState.value.jumlahKebutuhan?.toString(),
                  onChanged: (value) {
                    kebutuhanState.value = kebutuhanState.value
                        .copyWith(jumlahKebutuhan: int.tryParse(value));
                  },
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Jumlah Kebutuhan'),
                ),
                TextFormField(
                  initialValue: kebutuhanState.value.jumlahDiterima?.toString(),
                  onChanged: (value) {
                    kebutuhanState.value = kebutuhanState.value
                        .copyWith(jumlahDiterima: int.parse(value));
                  },
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Jumlah Diterima'),
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        final navigator = AutoRouter.of(context);
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(listKebutuhanNotifierProvider().notifier)
                              .save(kebutuhanState.value);

                          navigator.maybePop();
                        }
                      },
                      child: const Text('Simpan'),
                    );
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
