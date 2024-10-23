import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/shared/providers/list_desa_provider.dart';

class DesaDropdownButton extends ConsumerWidget {
  const DesaDropdownButton({
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
    final listDesa = ref.watch(listDesaProvider);

    return DropdownButtonFormField<int?>(
      onChanged: onChanged,
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Desa'),
      validator: validator,
      items: listDesa.maybeWhen(
        orElse: () => [],
        data: (data) => data
            .map(
              (desa) => DropdownMenuItem<int?>(
                value: desa.idKelurahan,
                child: Text('${desa.nama}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
