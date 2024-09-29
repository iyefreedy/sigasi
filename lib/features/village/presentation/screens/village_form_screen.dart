import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sigasi/features/district/notifiers/district_list_notifier.dart';
import 'package:sigasi/features/village/notifiers/village_list_notifier.dart';

import '../../../../shared/domain/models/village/village.dart';

@RoutePage()
class VillageFormScreen extends ConsumerWidget {
  const VillageFormScreen({super.key, this.village});

  final Village? village;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final districtList = ref.watch(districtListNotifierProvider);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form Desa'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HookBuilder(builder: (context) {
                final villageState = useState(
                  village ??
                      Village(
                        name: '',
                        districtId: 0,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      ),
                );
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField<int>(
                        value: villageState.value.id != null
                            ? villageState.value.districtId
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Kecamatan',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Kecamatan harus dipilih.';
                          }

                          return null;
                        },
                        items: districtList.when(
                          data: (data) => [
                            ...data.map(
                              (district) => DropdownMenuItem<int>(
                                value: district.id,
                                child: Text(district.name),
                              ),
                            )
                          ],
                          error: (error, stackTrace) => [],
                          loading: () => [],
                        ),
                        onChanged: (value) {
                          print(value);
                          if (value != null) {
                            villageState.value =
                                villageState.value.copyWith(districtId: value);
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: villageState.value.name,
                        decoration: const InputDecoration(
                          labelText: 'Nama',
                        ),
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Nama tidak boleh kosong';
                          }

                          return null;
                        },
                        onChanged: (value) => villageState.value =
                            villageState.value.copyWith(name: value),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          print(villageState.value);
                          final navState = AutoRouter.of(context);
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(villageListNotifierProvider.notifier)
                                .save(villageState.value);

                            navState.maybePop();
                          }
                        },
                        child: const Text('Simpan'),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
