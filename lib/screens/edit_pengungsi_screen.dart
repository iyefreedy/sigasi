import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/models/pengungsi.dart';
import 'package:sigasi/providers/list_pengungsi_provider.dart';
import 'package:sigasi/providers/list_posko_provider.dart';
import 'package:sigasi/utils/app_router.dart';

class EditPengungsiScreen extends ConsumerStatefulWidget {
  const EditPengungsiScreen({super.key, required this.pengungsi});

  final Pengungsi pengungsi;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPengungsiScreenState();
}

class _EditPengungsiScreenState extends ConsumerState<EditPengungsiScreen> {
  late final TextEditingController _kondisiKhususController;

  String? _idPosko;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _kondisiKhususController =
        TextEditingController(text: widget.pengungsi.kondisiKhusus);
    _idPosko = widget.pengungsi.iDPosko;
  }

  @override
  void dispose() {
    super.dispose();
    _kondisiKhususController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listPosko = ref.watch(listPoskoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pengungsi'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            ListTile(
              title: Text(widget.pengungsi.penduduk?.nama ?? '-'),
              subtitle: Text(widget.pengungsi.penduduk?.kTP ?? '-'),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String?>(
              value: _idPosko,
              decoration: const InputDecoration(
                labelText: 'Posko',
              ),
              items: listPosko.maybeWhen(
                orElse: () => [],
                data: (data) => data
                    .map(
                      (posko) => DropdownMenuItem(
                        value: posko.iDPosko,
                        child: Text(posko.lokasi ?? '-'),
                      ),
                    )
                    .toList(),
              ),
              onChanged: (value) {
                setState(() {
                  _idPosko = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _kondisiKhususController,
              decoration: const InputDecoration(
                labelText: 'Kondisi Khusus',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });

                      final pengungsi = widget.pengungsi.copyWith(
                        iDPosko: _idPosko,
                        kondisiKhusus: _kondisiKhususController.text,
                      );

                      await ref
                          .read(listPengungsiProvider((
                            idKelompok: widget.pengungsi.penduduk?.iDKelompok,
                            idPosko: widget.pengungsi.iDPosko
                          )).notifier)
                          .save(pengungsi);

                      setState(() {
                        _isLoading = false;
                      });

                      if (context.mounted) {
                        Navigator.of(context).popUntil((route) =>
                            route.settings.name ==
                            AppRouter.filterPengungsiRoute);
                      }
                    },
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
