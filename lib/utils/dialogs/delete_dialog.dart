import 'package:flutter/material.dart';
import 'package:sigasi/utils/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context,
    title: 'Konfirmasi',
    content: 'Apakah anda yakin ingin menghapus data ini?',
    optionBuilder: () => {
      'Yes': true,
      'No': false,
    },
  ).then((value) => value ?? false);
}
