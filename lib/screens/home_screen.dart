import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/exceptions/general_exception.dart';
import 'package:sigasi/providers/auth_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:sigasi/utils/dialogs/logout_dialog.dart';

import '../utils/dialogs/error_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final roles = auth.user?.roles;
    ref.listen(
      authProvider,
      (previous, next) {
        final error = next.error;
        if (error != null && error is GeneralException) {
          showErrorDialog(context, error.message);
        }

        if (next.user == null) {
          Navigator.of(context).popAndPushNamed(AppRouter.loginRoute);
        }
      },
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset('assets/logo-kampus-merdeka.png'),
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Logout'), Icon(Icons.logout)],
                      ),
                      onTap: () async {
                        try {
                          final shouldLogout = await showLogoutDialog(context);
                          if (shouldLogout) {
                            await ref.read(authProvider.notifier).logout();
                          }
                        } catch (e) {}
                      },
                    )
                  ];
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Image.asset('assets/volunteers-2-removebg-preview.png'),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Menu',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                if (roles != null && roles.first.name == 'kecamatan')
                  MenuItem(
                    to: AppRouter.filterKeluargaRoute,
                    title: 'Data Keluarga',
                    backgroundColor: Colors.pink.shade100,
                    foregroundColor: Colors.pink.shade700,
                    icon: Icons.family_restroom,
                  ),
                if (roles != null && roles.first.name == 'kecamatan')
                  MenuItem(
                    to: AppRouter.filterPendudukRoute,
                    title: 'Lihat data Penduduk',
                    backgroundColor: Colors.green.shade100,
                    foregroundColor: Colors.green.shade700,
                    icon: Icons.group,
                  ),
                if (roles != null &&
                    (roles.first.name == 'posko' ||
                        roles.first.name == 'posko utama'))
                  MenuItem(
                    to: AppRouter.filterPengungsiRoute,
                    title: 'Data Pengungsi',
                    backgroundColor: Colors.amber.shade100,
                    foregroundColor: Colors.amber.shade700,
                    icon: Icons.person_pin,
                  ),
                if (roles != null && roles.first.name == 'posko utama')
                  MenuItem(
                    to: AppRouter.listKebutuhanRoute,
                    title: 'Data Kebutuhan',
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red.shade700,
                    icon: Icons.request_page,
                  ),
                if (roles != null && roles.first.name == 'bansos')
                  MenuItem(
                    to: AppRouter.listDonaturRoute,
                    title: 'Data Donatur',
                    backgroundColor: Colors.tealAccent.shade100,
                    foregroundColor: Colors.tealAccent.shade700,
                    icon: Icons.volunteer_activism,
                  ),
                if (roles != null && roles.first.name == 'bansos')
                  MenuItem(
                    to: AppRouter.listBantuanRoute,
                    title: 'Data Bantuan',
                    backgroundColor: Colors.blue.shade100,
                    foregroundColor: Colors.blue.shade700,
                    icon: Icons.inventory,
                  ),
                if (roles != null && roles.first.name == 'bansos')
                  MenuItem(
                    to: AppRouter.listDistribusiRoute,
                    title: 'Data Distribusi',
                    backgroundColor: Colors.cyan.shade100,
                    foregroundColor: Colors.cyan.shade700,
                    icon: Icons.local_shipping,
                  ),
                if (roles != null && roles.first.name == 'posko utama')
                  MenuItem(
                    to: AppRouter.listPoskoroute,
                    title: 'Data Posko',
                    backgroundColor: Colors.indigo.shade100,
                    foregroundColor: Colors.indigo.shade700,
                    icon: Icons.location_on,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.to,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });

  final String to;
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(to);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
            ),
            child: Icon(
              icon,
              size: 30.0,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
