import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<bool?> showDeleteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    content: 'Apakah anda yakin ingin menghapus data ini?',
    title: 'Konfirmasi',
    optionBuilder: () => {
      'Batal': false,
      'Ya': true,
    },
  );
}
