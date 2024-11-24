import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/keluarga_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class DetailKeluargaScreen extends ConsumerWidget {
  const DetailKeluargaScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keluargaAsync = ref.watch(keluargaProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Keluarga'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: keluargaAsync.hasValue
            ? () async {
                Navigator.of(context).pushNamed(
                  AppRouter.formAnggotaKeluargaRoute,
                  arguments: keluargaAsync.hasValue
                      ? keluargaAsync.value?.iDKeluarga
                      : null,
                );
              }
            : null,
        child: const Icon(Icons.person_add),
      ),
      body: keluargaAsync.when(
        data: (keluarga) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keluarga.nomorKK ?? '-',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(keluarga.alamat ?? '-'),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(keluarga.kecamatan?.nama ?? '-'),
                        Text(keluarga.desa?.nama ?? '-'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                for (final anggota in keluarga.anggota!)
                  ListTileTheme(
                    data: ListTileThemeData(
                      tileColor: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(anggota.penduduk?.nama ?? '-'),
                      subtitle: Text(anggota.hubungan ?? '-'),
                    ),
                  ),
              ],
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
    );
  }
}
