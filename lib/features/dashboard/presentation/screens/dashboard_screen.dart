import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sigasi/routes/app_route.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(const MenuListRoute());
                },
                icon: const Icon(Icons.dataset),
              ),
              PopupMenuButton(
                onSelected: (value) {},
                itemBuilder: (context) {
                  return const [PopupMenuItem(child: Text('Logout'))];
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
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context)
                              .push(const ResidentListRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.green.shade100,
                          foregroundColor: Colors.green.shade700,
                        ),
                        child: const Icon(
                          Icons.group,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Data Penduduk',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.amber.shade100,
                          foregroundColor: Colors.amber.shade700,
                        ),
                        child: const Icon(
                          Icons.person_search,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Data Pengungsi',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.red.shade100,
                          foregroundColor: Colors.red.shade700,
                        ),
                        child: const Icon(
                          Icons.inventory,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Data Kebutuhan',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.tealAccent.shade100,
                          foregroundColor: Colors.tealAccent.shade700,
                        ),
                        child: const Icon(
                          Icons.volunteer_activism,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Data Donatur',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.blue.shade100,
                          foregroundColor: Colors.blue.shade700,
                        ),
                        child: const Icon(
                          Icons.inventory,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Data Bantuan',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.cyan.shade100,
                          foregroundColor: Colors.cyan.shade700,
                        ),
                        child: const Icon(
                          Icons.local_shipping,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Distribusi Bantuan',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.purple.shade100,
                          foregroundColor: Colors.purple.shade700,
                        ),
                        child: const Icon(
                          Icons.request_quote,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Anggaran Mitigasi',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
