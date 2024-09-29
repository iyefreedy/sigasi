import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sigasi/routes/app_route.dart';

@RoutePage()
class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Daftar Menu Data'),
          ),
          SliverList.list(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Kecamatan'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const DistrictListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Desa'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const VillageListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Kelompok Penduduk'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => AutoRouter.of(context)
                      .push(const PopulationGroupListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Jenis Barang'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const ItemTypeListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Barang'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const ItemListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Posko'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const PostListRoute()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
