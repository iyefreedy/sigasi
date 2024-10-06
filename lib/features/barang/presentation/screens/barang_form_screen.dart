import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/models/barang/barang.dart';
import '../../../jenis_barang/notifiers/jenis_barang_list_notifier.dart';
import '../../notifiers/barang_list_notifier.dart';

@RoutePage()
class BarangFormScreen extends ConsumerWidget {
  const BarangFormScreen({super.key, this.barang});

  final Barang? barang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final jenisBarangList = ref.watch(jenisBarangListNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form Barang'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList.list(
              children: [
                HookBuilder(
                  builder: (context) {
                    final barangState = useState(
                      barang ?? const Barang(),
                    );
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          DropdownButtonFormField<int>(
                            value: barangState.value.idJenisBarang,
                            decoration: const InputDecoration(
                              labelText: 'Jenis Barang',
                            ),
                            items: jenisBarangList.maybeWhen(
                              data: (data) => data
                                  .map(
                                    (jenisBarang) => DropdownMenuItem(
                                      value: jenisBarang.idJenisBarang,
                                      child:
                                          Text(jenisBarang.jenisBarang ?? "-"),
                                    ),
                                  )
                                  .toList(),
                              orElse: () => [],
                            ),
                            onChanged: (value) {
                              barangState.value = barangState.value
                                  .copyWith(idJenisBarang: value);
                            },
                          ),
                          TextFormField(
                            initialValue: barangState.value.nama,
                            decoration: const InputDecoration(
                              labelText: 'Nama Barang',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama jenis barang tidak boleh kosong';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              barangState.value =
                                  barangState.value.copyWith(nama: value);
                            },
                          ),
                          TextFormField(
                            initialValue:
                                barangState.value.hargaSatuan?.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Harga Satuan',
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: true,
                              decimal: true,
                            ),
                            onChanged: (value) {
                              barangState.value = barangState.value
                                  .copyWith(hargaSatuan: double.parse(value));
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harga satuan tidak boleh kosong';
                              }

                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final navState = AutoRouter.of(context);

                              if (formKey.currentState!.validate()) {
                                await ref
                                    .read(barangListNotifierProvider.notifier)
                                    .save(barangState.value);

                                navState.maybePop();
                              }
                            },
                            child: const Text('Simpan'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
