import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/domain/models/kelompok/kelompok.dart';
import '../notifiers/kelompok_list_notifier.dart';

@RoutePage()
class KelompokFormScreen extends ConsumerWidget {
  const KelompokFormScreen({super.key, this.kelompok});

  final Kelompok? kelompok;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form Kelompok Penduduk'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: HookBuilder(builder: (context) {
                final kelompokState = useState(
                  kelompok ?? const Kelompok(),
                );
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: kelompokState.value.namaKelompok,
                        decoration: const InputDecoration(
                          labelText: 'Nama',
                        ),
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Nama tidak boleh kosong';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          kelompokState.value =
                              kelompokState.value.copyWith(namaKelompok: value);
                        },
                      ),
                      TextFormField(
                        initialValue: kelompokState.value.keterangan,
                        decoration: const InputDecoration(
                          labelText: 'Keterangan',
                          helperText: 'Opsional',
                        ),
                        minLines: 3,
                        maxLines: 5,
                        onChanged: (value) {
                          kelompokState.value =
                              kelompokState.value.copyWith(keterangan: value);
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final navState = AutoRouter.of(context);
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(kelompokListNotifierProvider.notifier)
                                .save(kelompokState.value);

                            navState.maybePop();
                          }
                        },
                        child: const Text('Simpan'),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
