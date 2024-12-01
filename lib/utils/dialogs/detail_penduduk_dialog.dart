import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigasi/models/penduduk.dart';

Future<void> showDetailPendudukDialog(
  BuildContext context,
  Penduduk penduduk,
) {
  return showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
        title: const Text('Detail Penduduk'),
        content: SizedBox(
          height: 300,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Nomor KTP'),
                  ),
                  Flexible(
                    child: Text(
                      ': ${penduduk.kTP ?? '-'}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Nama'),
                  ),
                  Flexible(
                    child: Text(': ${penduduk.nama ?? '-'}'),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Jenis Kelamin'),
                  ),
                  Text(': ${penduduk.jenisKelamin ?? '-'}')
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Tanggal Lahir'),
                  ),
                  Text(
                      ': ${penduduk.tanggalLahir != null ? DateFormat.yMMMd('id_ID').format(penduduk.tanggalLahir!) : '-'}')
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Kelompok'),
                  ),
                  Flexible(
                    child: Text(
                      ': ${penduduk.kelompok?.namaKelompok ?? '-'}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tutup'),
          ),
        ],
      );
    },
  );
}
