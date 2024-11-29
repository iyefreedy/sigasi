import 'package:flutter/material.dart';
import 'package:sigasi/utils/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String message) {
  return showGenericDialog<void>(
    context,
    title: 'Terjadi Kesalahan',
    content: message,
    optionBuilder: () => {
      'Tutup': false,
    },
  );
}
