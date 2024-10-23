import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/pengungsi/notifiers/list_pengungsi_notifier.dart';
import 'package:sigasi/routes/app_route.dart';
import 'package:sigasi/shared/globals.dart';

@RoutePage()
class ListPengungsiScreen extends ConsumerWidget {
  const ListPengungsiScreen({super.key, this.idPosko, this.idKelompok});

  final int? idPosko;
  final int? idKelompok;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPengungsi = ref.watch(listPengungsiNotifierProvider(
      idKelompok: idKelompok,
      idPosko: idPosko,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengungsi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listPengungsi.when(
          data: (data) {
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final pengungsi = data[index];
                return ListTile(
                  title: Text("${pengungsi.penduduk?.nama}"),
                  subtitle: Text("${pengungsi.kondisiKhusus}"),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case PopupMenuAction.edit:
                          AutoRouter.of(context)
                              .push(FormPengungsiRoute(pengungsi: pengungsi));
                          break;
                        case PopupMenuAction.delete:
                          break;
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        ...PopupMenuAction.values.map((action) => PopupMenuItem(
                              value: action,
                              child: Text(action.label),
                            ))
                      ];
                    },
                  ),
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrance) => Center(
            child: Text('$error'),
          ),
        ),
      ),
    );
  }
}
