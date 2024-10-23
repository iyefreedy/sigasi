import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/pengungsi/notifiers/list_pengungsi_notifier.dart';

import 'package:sigasi/shared/domain/models/pengungsi/pengungsi.dart';

import 'package:sigasi/shared/widgets/penduduk_dropdown_button.dart';
import 'package:sigasi/shared/widgets/posko_dropdown_button.dart';

@RoutePage()
class FormPengungsiScreen extends ConsumerWidget {
  const FormPengungsiScreen({super.key, this.pengungsi});

  final Pengungsi? pengungsi;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengungsi'),
      ),
      body: HookBuilder(builder: (context) {
        final pengungsiState = useState(pengungsi ?? const Pengungsi());
        return Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              PoskoDropdownButton(
                value: pengungsiState.value.idPosko,
                onChanged: (value) {
                  pengungsiState.value =
                      pengungsiState.value.copyWith(idPosko: value);
                },
              ),
              PendudukDropdownButton(
                value: pengungsiState.value.idPenduduk,
                onChanged: (value) {
                  pengungsiState.value =
                      pengungsiState.value.copyWith(idPenduduk: value);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kondisi Khusus'),
                maxLines: 5,
                minLines: 1,
                initialValue: pengungsiState.value.kondisiKhusus,
                onChanged: (value) {
                  pengungsiState.value =
                      pengungsiState.value.copyWith(kondisiKhusus: value);
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    final router = AutoRouter.of(context);
                    if (formKey.currentState!.validate()) {
                      await ref
                          .read(listPengungsiNotifierProvider().notifier)
                          .save(pengungsiState.value);
                      router.back();
                    }
                  },
                  child: const Text('Simpan'))
            ],
          ),
        );
      }),
    );
  }
}
