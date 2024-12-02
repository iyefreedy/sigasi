import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/kebutuhan.dart';
import 'package:sigasi/models/posko.dart';
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

          final Map<Posko?, List<Kebutuhan>> groupedByPosko = {};

          for (var kebutuhan in data) {
            final poskoKey = kebutuhan.posko;
            print(poskoKey);

            if (!groupedByPosko.containsKey(poskoKey)) {
              groupedByPosko[poskoKey] = [];
            }

            groupedByPosko[poskoKey]?.add(kebutuhan);
          }

          final poskoList = groupedByPosko.entries.map((entry) {
            return entry.key?.copyWith(
              kebutuhan: entry.value,
            );
          }).toList();

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            padding: const EdgeInsets.all(10),
            itemCount: poskoList.length,
            itemBuilder: (context, index) {
              final posko = poskoList[index];
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
                child:
                    ExpansionTile(title: Text(posko?.lokasi ?? '-'), children: [
                  ListTile(
                    subtitle: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Text(
                                    'Nama Barang',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    'Jumlah Kebutuhan',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    'Jumlah Diterima',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                )
                              ],
                            ),
                            for (var kebutuhan
                                in (posko?.kebutuhan ?? <Kebutuhan>[])) ...[
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Text(
                                        kebutuhan.barang?.namaBarang ?? '-'),
                                  ),
                                  TableCell(
                                    child: Text(
                                        kebutuhan.jumlahKebutuhan?.toString() ??
                                            '-'),
                                  ),
                                  TableCell(
                                    child: Text(
                                      kebutuhan.jumlahDiterima?.toString() ??
                                          '-',
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
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
