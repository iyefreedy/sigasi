import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../../../shared/dialogs/delete_dialog.dart';
import '../../notifiers/village_list_notifier.dart';

enum Action {
  edit('Ubah'),
  delete('Hapus');

  const Action(this.label);

  final String label;
}

@RoutePage()
class VillageListScreen extends ConsumerWidget {
  const VillageListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final villageList = ref.watch(villageListNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(VillageFormRoute());
        },
        tooltip: 'Tambah Data',
        child: const Icon(Icons.location_city),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Data Desa/Kelurahan'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: villageList.when(
              data: (data) => SliverList.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(data[index].name),
                  trailing: PopupMenuButton<Action>(
                    onSelected: (value) async {
                      switch (value) {
                        case Action.edit:
                          AutoRouter.of(context)
                              .push(VillageFormRoute(village: data[index]));
                          break;
                        case Action.delete:
                          final shouldDelete =
                              await showDeleteDialog(context) ?? false;
                          if (shouldDelete) {
                            await ref
                                .read(villageListNotifierProvider.notifier)
                                .remove(data[index]);
                          }
                          break;
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        ...Action.values.map(
                          (act) => PopupMenuItem(
                            value: act,
                            child: Text(act.label),
                          ),
                        )
                      ];
                    },
                  ),
                ),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(child: Text('$error')),
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
