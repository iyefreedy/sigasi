import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';
import '../../../../shared/domain/models/district/district.dart';
import '../../notifiers/district_list_notifier.dart';

enum DistrictListAction {
  edit,
  delete,
}

class DistrictItem extends ConsumerWidget {
  const DistrictItem({super.key, required this.district});

  final District district;

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
                    district.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            PopupMenuButton<DistrictListAction>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: DistrictListAction.edit,
                  child: Text('Ubah'),
                ),
                const PopupMenuItem(
                  value: DistrictListAction.delete,
                  child: Text('Hapus'),
                ),
              ],
              onSelected: (value) async {
                switch (value) {
                  case DistrictListAction.delete:
                    final shouldDelete =
                        await showConfirmDialog(context) ?? false;
                    if (shouldDelete) {
                      await ref
                          .read(districtListNotifierProvider.notifier)
                          .remove(district);
                    }
                    break;
                  case DistrictListAction.edit:
                    AutoRouter.of(context)
                        .push(DistrictFormRoute(district: district));
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
