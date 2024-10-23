import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sigasi/features/penduduk/notifiers/penduduk_list_notifier.dart';

class PendudukDropdownButton extends ConsumerWidget {
  const PendudukDropdownButton({
    super.key,
    this.value,
    this.onChanged,
    this.validator,
  });

  final int? value;
  final void Function(int?)? onChanged;
  final String? Function(int?)? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKelompok = ref.watch(pendudukListNotifierProvider());

    return DropdownButtonFormField<int?>(
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Penduduk'),
      items: listKelompok.maybeWhen(
        orElse: () => [],
        data: (data) => data
            .map(
              (penduduk) => DropdownMenuItem(
                value: penduduk.idPenduduk,
                child: Text('${penduduk.nama}'),
              ),
            )
            .toList(),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
