import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_penduduk_provider.dart';
import 'package:sigasi/utils/dialogs/detail_penduduk_dialog.dart';

class ListPendudukScreen extends ConsumerStatefulWidget {
  const ListPendudukScreen({
    super.key,
    required this.desa,
    required this.kecamatan,
    this.idKelompok,
  });

  final int desa;
  final int kecamatan;
  final String? idKelompok;

  @override
  ConsumerState<ListPendudukScreen> createState() => _ListPendudukScreenState();
}

class _ListPendudukScreenState extends ConsumerState<ListPendudukScreen> {
  @override
  Widget build(BuildContext context) {
    final listPenduduk = ref.watch(listPendududukProvider(
        (idKelompok: widget.idKelompok, desa: widget.desa)));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penduduk'),
      ),
      body: listPenduduk.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data.'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final penduduk = data[index];

              return ListTileTheme(
                data: ListTileThemeData(
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: ListTile(
                  title: Text(penduduk.nama ?? '-'),
                  subtitle: Text(penduduk.kTP ?? '-'),
                  trailing: const Icon(Icons.touch_app),
                  onTap: () => showDetailPendudukDialog(context, penduduk),
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
