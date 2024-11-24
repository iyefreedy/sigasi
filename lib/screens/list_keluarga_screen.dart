import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_keluarga_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class ListKeluargaScreen extends ConsumerWidget {
  const ListKeluargaScreen({
    super.key,
    required this.idDesa,
    required this.idKecamatan,
  });

  final int idDesa;
  final int idKecamatan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKeluarga = ref.watch(listKeluargaProvider((
      idDesa: idDesa,
      idKecamatan: idKecamatan,
    )));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Keluarga'),
      ),
      body: listKeluarga.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final keluarga = data[index];
              return ListTile(
                title: Text(keluarga.nomorKK ?? '-'),
                subtitle: Text(keluarga.alamat ?? '-'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.detailKeluargaRoute,
                      arguments: keluarga.iDKeluarga);
                },
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
