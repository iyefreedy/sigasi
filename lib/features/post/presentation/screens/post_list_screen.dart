import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

@RoutePage()
class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Posko'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(PostFormRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(),
    );
  }
}
