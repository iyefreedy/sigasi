import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_penduduk_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class ListPendudukScreen extends ConsumerStatefulWidget {
  const ListPendudukScreen({
    super.key,
    required this.desa,
    required this.idKelompok,
  });

  final String desa;
  final int idKelompok;

  @override
  ConsumerState<ListPendudukScreen> createState() => _ListPendudukScreenState();
}

class _ListPendudukScreenState extends ConsumerState<ListPendudukScreen> {
  @override
  Widget build(BuildContext context) {
    final listPenduduk = ref.watch(listPendududukProvider(
        (desa: widget.desa, idKelompok: widget.idKelompok)));
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

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final penduduk = data[index];

              return ListTile(
                title: Text(penduduk.nama ?? '-'),
                subtitle: Text(penduduk.kTP ?? '-'),
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: const Text('Ubah'),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRouter.formPendudukRoute,
                            arguments: penduduk,
                          );
                        },
                      )
                    ];
                  },
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
