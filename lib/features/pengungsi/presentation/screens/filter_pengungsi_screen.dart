import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sigasi/routes/app_route.dart';

import '../../../../shared/widgets/kelompok_dropdown_button.dart';
import '../../../../shared/widgets/posko_dropdown_button.dart';

@RoutePage()
class FilterPengungsiScreen extends HookWidget {
  const FilterPengungsiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final poskoState = useState<int?>(null);
    final kelompokState = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Pengungsi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(FormPengungsiRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PoskoDropdownButton(
                value: poskoState.value,
                onChanged: (value) {
                  poskoState.value = value;
                },
                validator: (value) {
                  if (value == null || poskoState.value == null) {
                    return 'Pilih posko';
                  }

                  return null;
                },
              ),
              KelompokDropdownButton(
                value: kelompokState.value,
                onChanged: (value) {
                  kelompokState.value = value;
                },
                validator: (value) {
                  if (value == null || kelompokState.value == null) {
                    return 'Pilih posko';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AutoRouter.of(context).push(ListPengungsiRoute(
                        idPosko: poskoState.value,
                        idKelompok: kelompokState.value));
                  }
                },
                label: const Text('Cari'),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
