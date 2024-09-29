import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../../shared/dialogs/delete_dialog.dart';
import '../../../shared/globals.dart';
import '../notifiers/population_group_notifier.dart';

@RoutePage()
class PopulationGroupListScreen extends ConsumerWidget {
  const PopulationGroupListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final populationGroupList = ref.watch(populationGroupNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(PopulationGroupFormRoute());
        },
        child: const Icon(Icons.group_add),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Data Kelompok Penduduk'),
          ),
          SliverFillRemaining(
            child: populationGroupList.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final populationGroup = data[index];

                      return ListTile(
                        title: Text(populationGroup.name),
                        subtitle: populationGroup.description != null
                            ? Text(populationGroup.description!)
                            : null,
                        trailing: PopupMenuButton<PopupMenuAction>(
                          onSelected: (value) async {
                            switch (value) {
                              case PopupMenuAction.edit:
                                AutoRouter.of(context).push(
                                    PopulationGroupFormRoute(
                                        populationGroup: populationGroup));
                                break;
                              case PopupMenuAction.delete:
                                final shouldDelete =
                                    await showDeleteDialog(context) ?? false;
                                if (shouldDelete) {
                                  await ref
                                      .read(populationGroupNotifierProvider
                                          .notifier)
                                      .remove(populationGroup);
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
        ],
      ),
    );
  }
}
