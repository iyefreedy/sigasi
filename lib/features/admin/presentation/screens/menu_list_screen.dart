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
                  title: const Text('Data Kelompok Penduduk'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const KelompokListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Jenis Barang'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const JenisBarangListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Barang'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const BarangListRoute()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  title: const Text('Data Posko'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () =>
                      AutoRouter.of(context).push(const PoskoListRoute()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
