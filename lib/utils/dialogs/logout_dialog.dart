import 'package:flutter/material.dart';
import 'package:sigasi/utils/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context,
    title: 'Keluar',
    content: 'Apakah anda yakin ingin mengakhiri sesi anda?',
    optionBuilder: () => {
      'Yes': true,
      'No': false,
    },
  ).then((value) => value ?? false);
}
