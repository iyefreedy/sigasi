import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/donatur/notifiers/list_donatur_notifier.dart';
import 'package:sigasi/routes/app_route.dart';
import 'package:sigasi/shared/dialogs/delete_dialog.dart';
import 'package:sigasi/shared/globals.dart';

@RoutePage()
class ListDonaturScreen extends ConsumerWidget {
  const ListDonaturScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDonatur = ref.watch(listDonaturNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Donatur'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(FormDonaturRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: listDonatur.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final donatur = data[index];
              return ListTile(
                title: Text("${donatur.namaPerusahaan}"),
                subtitle: Text("${donatur.namaKontak}"),
                trailing: PopupMenuButton(
                  onSelected: (value) async {
                    switch (value) {
                      case PopupMenuAction.edit:
                        AutoRouter.of(context)
                            .push(FormDonaturRoute(donatur: donatur));
                        break;
                      case PopupMenuAction.delete:
                        final shouldDelete =
                            await showDeleteDialog(context) ?? false;
                        if (shouldDelete) {
                          ref
                              .read(listDonaturNotifierProvider.notifier)
                              .remove(donatur);
                        }
                        break;
                    }
                  },
                  itemBuilder: (context) => PopupMenuAction.values
                      .map(
                        (action) => PopupMenuItem(
                          value: action,
                          child: Text(action.label),
                        ),
                      )
                      .toList(),
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
    );
  }
}
