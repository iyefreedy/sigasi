import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_donatur_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:sigasi/utils/dialogs/delete_dialog.dart';

class ListDonaturScreen extends ConsumerWidget {
  const ListDonaturScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDonatur = ref.watch(listDonaturProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Donatur'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formDonaturRoute);
        },
      ),
      body: listDonatur.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final donatur = data[index];
              return ListTile(
                title: Text(donatur.namaPerusahaan ?? '-'),
                subtitle: Text(donatur.nomorKontak ?? '-'),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Ubah'),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRouter.formDonaturRoute,
                          arguments: donatur,
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: const Text('Hapus'),
                      onTap: () async {
                        final shouldDelete = await showDeleteDialog(context);

                        if (shouldDelete) {
                          await ref
                              .read(listDonaturProvider.notifier)
                              .remove(donatur);
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
      ),
    );
  }
}
