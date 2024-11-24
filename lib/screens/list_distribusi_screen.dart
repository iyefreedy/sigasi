import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_distribusi_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class ListDistribusiScreen extends ConsumerWidget {
  const ListDistribusiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDistribusi = ref.watch(listDistribusiProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Distribusi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formDistribusiRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: listDistribusi.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Tidak ada data.'),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final distribusi = data[index];
              return ListTile(
                title: Text((distribusi.jumlah ?? 0).toString()),
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
    );
  }
}
