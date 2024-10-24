import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../../../shared/dialogs/delete_dialog.dart';
import '../../../../shared/globals.dart';
import '../../notifiers/item_list_notifier.dart';

@RoutePage()
class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(itemListNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(ItemFormRoute());
        },
        child: const Icon(Icons.inventory),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Data Barang'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverFillRemaining(
              child: itemList.when(
                data: (data) => ListView.separated(
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: PopupMenuButton<PopupMenuAction>(
                        onSelected: (value) async {
                          switch (value) {
                            case PopupMenuAction.edit:
                              AutoRouter.of(context)
                                  .push(ItemFormRoute(item: item));
                              break;
                            case PopupMenuAction.delete:
                              final shouldDelete =
                                  await showDeleteDialog(context) ?? false;
                              if (shouldDelete) {
                                await ref
                                    .read(itemListNotifierProvider.notifier)
                                    .remove(item);
                              }
                              break;
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            ...PopupMenuAction.values.map(
                              (act) => PopupMenuItem(
                                value: act,
                                child: Text(act.label),
                              ),
                            )
                          ];
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4),
                  itemCount: data.length,
                ),
                error: (error, stackTrace) => Center(
                  child: Text('$error'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
