import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

@RoutePage()
class ListDistribusiScreen extends ConsumerWidget {
  const ListDistribusiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Distribusi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const FormDistribusiRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
