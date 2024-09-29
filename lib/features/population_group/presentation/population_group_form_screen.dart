import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/domain/models/population_group/population_group.dart';
import '../notifiers/population_group_notifier.dart';

@RoutePage()
class PopulationGroupFormScreen extends ConsumerWidget {
  const PopulationGroupFormScreen({super.key, this.populationGroup});

  final PopulationGroup? populationGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form Kelompok Penduduk'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: HookBuilder(builder: (context) {
                final populationGroupState = useState(
                  populationGroup ??
                      PopulationGroup(
                        name: '',
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      ),
                );
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: populationGroupState.value.name,
                        decoration: const InputDecoration(
                          labelText: 'Nama',
                        ),
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Nama tidak boleh kosong';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          populationGroupState.value =
                              populationGroupState.value.copyWith(name: value);
                        },
                      ),
                      TextFormField(
                        initialValue: populationGroupState.value.description,
                        decoration: const InputDecoration(
                          labelText: 'Keterangan',
                          helperText: 'Opsional',
                        ),
                        onChanged: (value) {
                          populationGroupState.value = populationGroupState
                              .value
                              .copyWith(description: value);
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final navState = AutoRouter.of(context);
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(populationGroupNotifierProvider.notifier)
                                .save(populationGroupState.value);

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
