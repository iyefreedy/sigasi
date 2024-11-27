import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_kebutuhan_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class ListKebutuhanScreen extends ConsumerWidget {
  const ListKebutuhanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKebutuhan = ref.watch(listKebutuhanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kebutuhan'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formKebutuhanRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: listKebutuhan.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data.'),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final kebutuhan = data[index];
              return ExpansionTileTheme(
                data: ExpansionTileThemeData(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: ExpansionTile(
                  title: Text(kebutuhan.posko?.lokasi ?? '-'),
                  subtitle: Text(kebutuhan.barang?.namaBarang ?? '-'),
                  children: [
                    ListTile(
                      title: const Text('Jumlah Kebutuhan'),
                      subtitle: Text(kebutuhan.jumlahKebutuhan.toString()),
                    ),
                    ListTile(
                      title: const Text('Jumlah Diterima'),
                      subtitle: Text(kebutuhan.jumlahDiterima.toString()),
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
