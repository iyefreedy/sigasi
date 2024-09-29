import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/item_category/notifiers/item_category_list_notifier.dart';

import '../../../../shared/domain/models/item/item.dart';
import '../../notifiers/item_list_notifier.dart';

@RoutePage()
class ItemFormScreen extends ConsumerWidget {
  const ItemFormScreen({super.key, this.item});

  final Item? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final itemCategories = ref.watch(itemCategoryListNotifierProvider);
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
                HookBuilder(builder: (context) {
                  final state = useState(
                    item ??
                        Item(
                          name: '',
                          itemCategoryId: 0,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        ),
                  );
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        DropdownButtonFormField<int>(
                          value: state.value.id,
                          decoration: const InputDecoration(
                            labelText: 'Jenis Barang',
                          ),
                          items: itemCategories.maybeWhen(
                            data: (data) => data
                                .map(
                                  (itemCategory) => DropdownMenuItem(
                                    value: itemCategory.id,
                                    child: Text(itemCategory.name),
                                  ),
                                )
                                .toList(),
                            orElse: () => [],
                          ),
                          onChanged: (value) {
                            state.value =
                                state.value.copyWith(itemCategoryId: value!);
                          },
                        ),
                        TextFormField(
                          initialValue: state.value.name,
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
                            state.value =
                                state.value.copyWith(description: value);
                          },
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final navState = AutoRouter.of(context);

                            if (formKey.currentState!.validate()) {
                              await ref
                                  .read(itemListNotifierProvider.notifier)
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
