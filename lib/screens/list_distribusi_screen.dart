import 'package:flutter/material.dart';
import 'package:sigasi/utils/app_router.dart';

class ListDistribusiScreen extends StatelessWidget {
  const ListDistribusiScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(),
    );
  }
}
