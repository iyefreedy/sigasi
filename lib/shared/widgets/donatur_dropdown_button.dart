import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sigasi/shared/providers/list_donatur_provider.dart';

class DonaturDropdownButton extends ConsumerWidget {
  const DonaturDropdownButton({
    super.key,
    this.onChanged,
    this.value,
    this.validator,
  });

  final int? value;
  final void Function(int?)? onChanged;
  final String? Function(int?)? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDonatur = ref.watch(listDonaturProvider);

    return DropdownButtonFormField<int?>(
      onChanged: onChanged,
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Donatur'),
      validator: validator,
      items: listDonatur.maybeWhen(
        orElse: () => [],
        data: (data) => data
            .map(
              (donatur) => DropdownMenuItem<int?>(
                value: donatur.idDonatur,
                child: Text('${donatur.namaPerusahaan}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
