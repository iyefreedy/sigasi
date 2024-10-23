import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

@RoutePage()
class ListBantuanScreen extends ConsumerWidget {
  const ListBantuanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(FormBantuanRoute());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Data Bantuan'),
      ),
      body: const Center(
        child: Text('Tidak ada data.'),
      ),
    );
  }
}
