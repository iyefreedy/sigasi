import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/kebutuhan/notifiers/list_kebutuhan_notifier.dart';

@RoutePage()
class ListKebutuhanScreen extends ConsumerWidget {
  const ListKebutuhanScreen({super.key, this.idPosko});

  final int? idPosko;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKebutuhan =
        ref.watch(listKebutuhanNotifierProvider(idPosko: idPosko));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kebutuhan'),
      ),
      body: listKebutuhan.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => const SizedBox(height: 4),
            separatorBuilder: (context, index) {
              final kebutuhan = data[index];
              return ExpansionTile(
                title: Text("${kebutuhan.barang?.nama}"),
                subtitle: Text('${kebutuhan.posko?.lokasi}'),
                children: [
                  ListTile(
                    title: Text(
                        'Jumlah Diterima: ${kebutuhan.jumlahDiterima?.toString()}'),
                  ),
                  ListTile(
                    title: Text(
                        'Jumlah Dibutuhkan: ${kebutuhan.jumlahKebutuhan?.toString()}'),
                  ),
                ],
              );
            },
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
