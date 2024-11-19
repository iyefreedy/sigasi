import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:sigasi/utils/dialogs/delete_dialog.dart';

class ListPoskoScreen extends ConsumerWidget {
  const ListPoskoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPosko = ref.watch(listPoskoProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Posko'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.formPoskoRoute);
          },
          child: const Icon(Icons.location_pin),
        ),
        body: listPosko.when(
          data: (data) {
            if (data.isEmpty) {
              return const Center(
                child: Text('Tidak ada data'),
              );
            }

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final posko = data[index];

                return ListTile(
                  title: Text(posko.lokasi ?? '-'),
                  subtitle: Text(posko.masalah ?? '-'),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Ubah'),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRouter.formPoskoRoute,
                            arguments: posko,
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: const Text('Hapus'),
                        onTap: () async {
                          final shouldDelete = await showDeleteDialog(context);
                          if (shouldDelete) {
                            await ref
                                .read(listPoskoProvider.notifier)
                                .remove(posko);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
            child: Text('$error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
