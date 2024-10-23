import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/features/kelompok/notifiers/kelompok_list_notifier.dart';

class KelompokDropdownButton extends ConsumerWidget {
  const KelompokDropdownButton({
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
    final listKelompok = ref.watch(kelompokListNotifierProvider);

    return DropdownButtonFormField<int?>(
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Kelompok'),
      items: listKelompok.maybeWhen(
        orElse: () => [],
        data: (data) => data
            .map(
              (kelompok) => DropdownMenuItem(
                value: kelompok.idKelompok,
                child: Text('${kelompok.namaKelompok}'),
              ),
            )
            .toList(),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
