import 'package:flutter/material.dart';

Future showAnggotaKeluarga(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Form Anggota Keluarga'),
        content: Form(
          key: formKey,
          child: ListView(
            children: [
              DropdownButtonFormField(
                items: [],
                onChanged: (value) {},
              ),
              TextFormField(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      );
    },
  );
}
