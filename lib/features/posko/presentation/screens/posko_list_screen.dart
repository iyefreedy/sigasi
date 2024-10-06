import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';
import '../../notifiers/posko_list_notifier.dart';

@RoutePage()
class PoskoListScreen extends ConsumerWidget {
  const PoskoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poskoList = ref.watch(poskoListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Posko'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(PoskoFormRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: poskoList.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data,'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final posko = data[index];
              return ListTile(
                title: Text('Posko ${posko.lokasi}'),
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
