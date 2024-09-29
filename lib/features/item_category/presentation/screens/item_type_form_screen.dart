import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/models/item_category/item_category.dart';
import '../../notifiers/item_category_list_notifier.dart';

@RoutePage()
class ItemTypeFormScreen extends ConsumerWidget {
  const ItemTypeFormScreen({super.key, this.itemType});

  final ItemCategory? itemType;

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
              final state = useState(
                itemType ??
                    ItemCategory(
                      name: '',
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                    ),
              );
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: state.value.name,
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
                        state.value = state.value.copyWith(name: value);
                      },
                    ),
                    TextFormField(
                      initialValue: state.value.description,
                      decoration: const InputDecoration(
                        labelText: 'Keterangan',
                        helperText: 'Opsional',
                      ),
                      onChanged: (value) {
                        state.value = state.value.copyWith(description: value);
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final navState = AutoRouter.of(context);

                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(itemCategoryListNotifierProvider.notifier)
                              .save(state.value);

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
