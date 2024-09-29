import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/district/notifiers/district_list_notifier.dart';

import '../../../../shared/domain/models/district/district.dart';

@RoutePage()
class DistrictFormScreen extends ConsumerWidget {
  const DistrictFormScreen({super.key, this.district});

  final District? district;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Form Kecamatan'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HookBuilder(
                builder: (context) {
                  final districtState = useState(
                    district ??
                        District(
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
                          initialValue: districtState.value.name,
                          decoration: const InputDecoration(
                            labelText: 'Nama Kecamatan',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama kecamatan tidak boleh kosong.';
                            }

                            return null;
                          },
                          onChanged: (value) => districtState.value =
                              districtState.value.copyWith(name: value),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final navState = AutoRouter.of(context);
                            if (formKey.currentState!.validate()) {
                              await ref
                                  .read(districtListNotifierProvider.notifier)
                                  .add(districtState.value);

                              navState.maybePopTop();
                            }
                          },
                          child: const Text('Simpan'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
