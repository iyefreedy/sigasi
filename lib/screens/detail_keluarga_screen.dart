import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        offset: const Offset(0, 2),
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Flex(
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
                ),
                const SizedBox(height: 20),
                if (keluarga.anggota?.isEmpty ?? false)
                  const Text('Belum ada data anggota keluarga')
                else
                  for (final anggota in keluarga.anggota!)
                    ListTileTheme(
                      data: ListTileThemeData(
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: ListTile(
                        trailing: Icon(
                          Icons.touch_app_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (builder) {
                              return AlertDialog(
                                title: const Text('Detail Anggota Keluarga'),
                                content: SizedBox(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Text('Nomor KTP'),
                                          ),
                                          Text(
                                              ': ${anggota.penduduk?.kTP ?? '-'}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Text('Nama'),
                                          ),
                                          Text(
                                              ': ${anggota.penduduk?.nama ?? '-'}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Text('Jenis Kelamin'),
                                          ),
                                          Text(
                                              ': ${anggota.penduduk?.jenisKelamin ?? '-'}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Text('Tanggal Lahir'),
                                          ),
                                          Text(
                                              ': ${anggota.penduduk?.tanggalLahir != null ? DateFormat.yMMMd('id_ID').format(anggota.penduduk!.tanggalLahir!) : '-'}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Text('Kelompok'),
                                          ),
                                          Flexible(
                                            child: Text(
                                              ': ${anggota.penduduk?.kelompok?.namaKelompok ?? '-'}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Tutup'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
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
