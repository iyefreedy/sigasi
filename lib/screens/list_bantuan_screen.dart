import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/utils/app_router.dart';

class ListBantuanScreen extends ConsumerWidget {
  const ListBantuanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Bantuan'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.formBantuanRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(),
    );
  }
}
