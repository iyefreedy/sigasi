import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/models/jenis_barang/jenis_barang.dart';
import '../../notifiers/jenis_barang_list_notifier.dart';

@RoutePage()
class JenisBarangFormScreen extends ConsumerWidget {
  const JenisBarangFormScreen({super.key, this.jenisBarang});

  final JenisBarang? jenisBarang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form Jenis Barang'),
          ),
          SliverFillRemaining(
            child: HookBuilder(builder: (context) {
              final jenisBarangState = useState(
                jenisBarang ?? const JenisBarang(),
              );
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: jenisBarangState.value.jenisBarang,
                      decoration: const InputDecoration(
                        labelText: 'Nama Jenis Barang',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama jenis barang tidak boleh kosong';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        jenisBarangState.value =
                            jenisBarangState.value.copyWith(jenisBarang: value);
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final navState = AutoRouter.of(context);

                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(jenisBarangListNotifierProvider.notifier)
                              .save(jenisBarangState.value);

                          navState.maybePop();
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
