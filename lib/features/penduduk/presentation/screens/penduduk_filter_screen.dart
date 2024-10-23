import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:sigasi/shared/widgets/desa_dropdown_button.dart';
import 'package:sigasi/shared/widgets/kelompok_dropdown_button.dart';
import 'package:sigasi/routes/app_route.dart';

@RoutePage()
class PendudukFilterScreen extends HookWidget {
  const PendudukFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final idKelompok = useState<int?>(null);
    final idKelurahan = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Penduduk'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(PendudukFormRoute(
            idKelompok: idKelompok.value,
            idKelurahan: idKelurahan.value,
          ));
        },
        child: const Icon(Icons.person_add),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              DesaDropdownButton(
                value: idKelurahan.value,
                onChanged: (value) {
                  idKelurahan.value = value;
                },
                validator: (value) {
                  if (value == null || idKelurahan.value == null) {
                    return 'Silahkan pilih desa';
                  }

                  return null;
                },
              ),
              KelompokDropdownButton(
                value: idKelompok.value,
                onChanged: (value) {
                  idKelompok.value = value;
                },
                validator: (value) {
                  if (value == null || idKelompok.value == null) {
                    return 'Silahkan pilih kelompok';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AutoRouter.of(context).push(PendudukListRoute(
                      idKelompok: idKelompok.value,
                      idKelurahan: idKelurahan.value,
                    ));
                  }
                },
                label: const Text('Cari'),
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
      ),
    );
  }
}
