import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../../../shared/dialogs/delete_dialog.dart';
import '../../../../shared/globals.dart';
import '../../notifiers/resident_list_notifier.dart';

@RoutePage()
class ResidentListScreen extends ConsumerWidget {
  const ResidentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentList = ref.watch(residentListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penduduk'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(ResidentFormRoute());
        },
        child: const Icon(Icons.person_add),
      ),
      body: SafeArea(
        child: residentList.when(
          data: (data) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final resident = data[index];

                return ListTile(
                  title: Text('${resident.name}'),
                  subtitle: Text('${resident.identityNumber}'),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      ...PopupMenuAction.values.map(
                        (action) => PopupMenuItem(
                          value: action,
                          child: Text(action.label),
                        ),
                      )
                    ],
                    onSelected: (value) async {
                      switch (value) {
                        case PopupMenuAction.edit:
                          break;
                        case PopupMenuAction.delete:
                          final shouldDelete =
                              await showDeleteDialog(context) ?? false;

                          if (shouldDelete) {
                            await ref
                                .read(residentListNotifierProvider.notifier)
                                .remove(resident);
                          }
                          break;
                      }
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemCount: data.length,
            );
          },
          error: (error, stackTrace) => Center(
            child: Text('$error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
