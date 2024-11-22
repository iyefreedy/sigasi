import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_pengungsi_provider.dart';

class ListPengungsiScreen extends ConsumerWidget {
  const ListPengungsiScreen({
    super.key,
    this.idKelompok,
    this.idPosko,
  });

  final String? idKelompok;
  final String? idPosko;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPengungsi = ref.watch(listPengungsiProvider(
      (idKelompok: idKelompok, idPosko: idPosko),
    ));

    print(idKelompok);
    print(idPosko);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengungsi'),
      ),
      body: listPengungsi.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data.'),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final pengungsi = data[index];
              return ListTile(
                title: Text(pengungsi.iDPosko ?? '-'),
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
