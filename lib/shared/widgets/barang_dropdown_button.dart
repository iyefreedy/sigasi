import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/shared/providers/list_barang_provider.dart';

class BarangDropdownButton extends ConsumerWidget {
  const BarangDropdownButton({
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
    final listDesa = ref.watch(listBarangProvider);

    return DropdownButtonFormField<int?>(
      onChanged: onChanged,
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Barang'),
      validator: validator,
      items: listDesa.maybeWhen(
        orElse: () => [],
        data: (data) => data
            .map(
              (barang) => DropdownMenuItem<int?>(
                value: barang.idBarang,
                child: Text('${barang.nama}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
