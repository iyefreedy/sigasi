import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/models/village/village.dart';
import '../../notifiers/village_list_notifier.dart';

enum VillageListAction {
  edit,
  delete,
}

class VillageItem extends ConsumerWidget {
  const VillageItem({super.key, required this.village});

  final Village village;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    village.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            PopupMenuButton<VillageListAction>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: VillageListAction.edit,
                  child: Text('Ubah'),
                ),
                const PopupMenuItem(
                  value: VillageListAction.delete,
                  child: Text('Hapus'),
                ),
              ],
              onSelected: (value) async {
                switch (value) {
                  case VillageListAction.delete:
                    final shouldDelete =
                        await showConfirmDialog(context) ?? false;
                    if (shouldDelete) {
                      await ref
                          .read(villageListNotifierProvider.notifier)
                          .remove(village);
                    }
                    break;
                  case VillageListAction.edit:
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool?> showConfirmDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Konfirmasi'),
        actions: [
          TextButton(
            onPressed: () {
              AutoRouter.of(context).maybePop(true);
            },
            child: const Text('Ya'),
          ),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).maybePop(false);
            },
            child: const Text('Tidak'),
          ),
        ],
      );
    },
  );
}
