import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sigasi/services/penduduk_service.dart';

import '../models/penduduk.dart';

class PendudukProvider extends ChangeNotifier {
  List<Penduduk>? _listPenduduk;

  final PendudukService pendudukService;

  UnmodifiableListView<Penduduk> get items =>
      UnmodifiableListView(_listPenduduk ?? []);

  PendudukProvider(this.pendudukService) {
    fetchPenduduk();
  }

  Future<void> fetchPenduduk() async {
    final listPenduduk = await pendudukService.fetchPenduduk();

    _listPenduduk = listPenduduk;
  }
}
