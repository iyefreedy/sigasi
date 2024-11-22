import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_bantuan_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class ListBantuanScreen extends ConsumerWidget {
  const ListBantuanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listBantuan = ref.watch(listBantuanProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Bantuan'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formBantuanRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: listBantuan.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data.'),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 6),
            itemCount: data.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final bantuan = data[index];
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
                  title: Text(bantuan.donatur?.namaPerusahaan ?? '-'),
                  subtitle:
                      Text(bantuan.tanggalBantuan?.toIso8601String() ?? '-'),
                  children: [
                    for (final detail in bantuan.detailBantuan)
                      ListTile(
                        title: Text((detail.jumlah ?? 0).toString()),
                        subtitle: Text(detail.barang?.namaBarang ?? '-'),
                      )
                  ],
                ),
              );
            },
          );
        },
        error: (error, _) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
