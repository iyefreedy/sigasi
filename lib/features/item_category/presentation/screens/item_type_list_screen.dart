import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../notifiers/item_category_list_notifier.dart';

@RoutePage()
class ItemTypeListScreen extends ConsumerWidget {
  const ItemTypeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemTypeList = ref.watch(itemCategoryListNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(ItemTypeFormRoute());
        },
        child: const Icon(Icons.cases),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Data Jenis Barang'),
          ),
          SliverFillRemaining(
            child: itemTypeList.when(
              data: (data) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final itemType = data[index];
                    return ListTile(
                      title: Text(itemType.name),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4),
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
          )
        ],
      ),
    );
  }
}
