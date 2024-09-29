import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../notifiers/district_list_notifier.dart';
import '../widgets/district_item.dart';

@RoutePage()
class DistrictListScreen extends ConsumerWidget {
  const DistrictListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final districtList = ref.watch(districtListNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(DistrictFormRoute());
        },
        tooltip: 'Tambah Data',
        child: const Icon(Icons.location_city),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Data Kecamatan'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: districtList.when(
              data: (data) => SliverList.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => DistrictItem(
                  district: data[index],
                ),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(child: Text('$error')),
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
