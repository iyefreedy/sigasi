import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/list_kebutuhan_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';

class FormDistribusiScreen extends ConsumerStatefulWidget {
  const FormDistribusiScreen({super.key});

  @override
  ConsumerState<FormDistribusiScreen> createState() =>
      _FormDistribusiScreenState();
}

class _FormDistribusiScreenState extends ConsumerState<FormDistribusiScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final listPosko = ref.watch(listPoskoProvider);
    final listKebutuhan = ref.watch(listKebutuhanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Distrbusi'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButtonFormField(
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Posko',
              ),
              items: listKebutuhan.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (kebutuhan) => DropdownMenuItem(
                        value: kebutuhan.iDPosko,
                        child: Text(kebutuhan.posko?.lokasi ?? '-'),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
