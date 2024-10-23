import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sigasi/routes/app_route.dart';

import '../../../../shared/dialogs/delete_dialog.dart';
import '../../../../shared/globals.dart';
import '../../notifiers/penduduk_list_notifier.dart';

@RoutePage()
class PendudukListScreen extends ConsumerWidget {
  const PendudukListScreen({
    super.key,
    required this.idKelompok,
    required this.idKelurahan,
  });

  final int? idKelompok;
  final int? idKelurahan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = pendudukListNotifierProvider(
      idKelompok: idKelompok,
      idKelurahan: idKelurahan,
    );
    final pendudukList = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penduduk'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(PendudukFormRoute(
            idKelompok: idKelompok,
            idKelurahan: idKelurahan,
          ));
        },
        child: const Icon(Icons.person_add),
      ),
      body: SafeArea(
        child: pendudukList.when(
          data: (data) {
            log('$data');
            if (data.isEmpty) {
              return const Center(
                child: Text('Tidak ada data.'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final penduduk = data[index];

                return ListTile(
                  title: Text('${penduduk.nama}'),
                  subtitle: Text('${penduduk.ktp}'),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      ...PopupMenuAction.values.map(
                        (action) => PopupMenuItem(
                          value: action,
                          child: Text(action.label),
                        ),
                      )
                    ],
                    onSelected: (value) async {
                      switch (value) {
                        case PopupMenuAction.edit:
                          AutoRouter.of(context)
                              .push(PendudukFormRoute(penduduk: penduduk));
                          break;
                        case PopupMenuAction.delete:
                          final shouldDelete =
                              await showDeleteDialog(context) ?? false;

                          if (shouldDelete) {
                            await ref
                                .read(pendudukListNotifierProvider(
                                  idKelompok: idKelompok,
                                  idKelurahan: idKelurahan,
                                ).notifier)
                                .remove(penduduk);
                          }
                          break;
                      }
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
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
      ),
    );
  }
}
