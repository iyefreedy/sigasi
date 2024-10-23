import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/donatur/notifiers/list_donatur_notifier.dart';

import '../../../../shared/domain/models/donatur/donatur.dart';

@RoutePage()
class FormDonaturScreen extends StatelessWidget {
  const FormDonaturScreen({super.key, this.donatur});

  final Donatur? donatur;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Donatur'),
      ),
      body: HookBuilder(builder: (context) {
        final donaturState = useState(donatur ?? const Donatur());
        return Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Perusahaan',
                ),
                initialValue: donaturState.value.namaPerusahaan,
                onChanged: (value) {
                  donaturState.value =
                      donaturState.value.copyWith(namaPerusahaan: value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi nama perusahaan';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Kontak',
                ),
                initialValue: donaturState.value.namaKontak,
                onChanged: (value) {
                  donaturState.value =
                      donaturState.value.copyWith(namaKontak: value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi nama kontak';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nomor Kontak',
                ),
                initialValue: donaturState.value.nomorKontak,
                onChanged: (value) {
                  donaturState.value =
                      donaturState.value.copyWith(nomorKontak: value);
                },
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi nomor kontak';
                  }

                  return null;
                },
              ),
              TextFormField(
                minLines: 1,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                ),
                initialValue: donaturState.value.alamat,
                onChanged: (value) {
                  donaturState.value =
                      donaturState.value.copyWith(alamat: value);
                },
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi Alamat';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      final router = AutoRouter.of(context);

                      if (formKey.currentState!.validate()) {
                        await ref
                            .read(listDonaturNotifierProvider.notifier)
                            .save(donaturState.value);
                        router.maybePop();
                      }
                    },
                    child: const Text('Simpan'),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
