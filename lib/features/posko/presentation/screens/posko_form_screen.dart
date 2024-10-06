import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/posko/notifiers/posko_list_notifier.dart';

import '../../../../shared/domain/models/posko/posko.dart';

@RoutePage()
class PoskoFormScreen extends ConsumerWidget {
  const PoskoFormScreen({super.key, this.posko});

  final Posko? posko;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Posko'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: HookBuilder(builder: (context) {
              final poskoState = useState(posko ?? const Posko());

              return ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ketua',
                    ),
                    initialValue: poskoState.value.ketua,
                    onChanged: (value) {
                      poskoState.value =
                          poskoState.value.copyWith(ketua: value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ketua Posko harus diisi.";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lokasi',
                    ),
                    initialValue: poskoState.value.lokasi,
                    onChanged: (value) {
                      poskoState.value =
                          poskoState.value.copyWith(lokasi: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Masalah',
                    ),
                    initialValue: poskoState.value.masalah,
                    onChanged: (value) {
                      poskoState.value =
                          poskoState.value.copyWith(masalah: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Solusi',
                    ),
                    initialValue: poskoState.value.solusiMasalah,
                    onChanged: (value) {
                      poskoState.value =
                          poskoState.value.copyWith(solusiMasalah: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        await ref
                            .read(poskoListNotifierProvider.notifier)
                            .save(poskoState.value);

                        if (context.mounted) {
                          AutoRouter.of(context).maybePop();
                        }
                      }
                    },
                    child: const Text('Simpan'),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
