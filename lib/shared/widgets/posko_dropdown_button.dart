import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/list_posko_provider.dart';

class PoskoDropdownButton extends ConsumerWidget {
  const PoskoDropdownButton({
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
    final listPosko = ref.watch(listPoskoProvider);

    return DropdownButtonFormField<int?>(
      onChanged: onChanged,
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Posko'),
      validator: validator,
      items: listPosko.maybeWhen(
        orElse: () => [],
        data: (data) => data
            .map(
              (posko) => DropdownMenuItem<int?>(
                value: posko.idPosko,
                child: Text('${posko.lokasi}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
