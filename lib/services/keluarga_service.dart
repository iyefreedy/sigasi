import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/anggota_keluarga.dart';
import 'package:sigasi/models/keluarga.dart';
import 'package:http/http.dart' as http;

import '../utils/app_constant.dart';

class KeluargaService {
  Future<List<Keluarga>> fetchKeluarga({
    int? idKecamatan,
    int? idDesa,
  }) async {
    final token = (await SharedPreferences.getInstance()).getString('token');

    String uri = '${AppConstant.apiUrl}/api/keluarga';
    if (idKecamatan != null && idDesa != null) {
      uri += '?kecamatan=$idKecamatan&desa=$idDesa';
    }

    final url = Uri.parse(uri);
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final listKeluarga = (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map(Keluarga.fromJson)
        .toList();

    return listKeluarga;
  }

  Future<Keluarga> fetchKeluargaById(String id) async {
    final token = (await SharedPreferences.getInstance()).getString('token');

    final url = Uri.parse('${AppConstant.apiUrl}/api/keluarga/$id');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return Keluarga.fromJson(jsonBody['data'] as Map<String, dynamic>);
  }

  Future<Keluarga> insertKeluarga(Keluarga keluarga) async {
    final token = (await SharedPreferences.getInstance()).getString('token');

    final url = Uri.parse('${AppConstant.apiUrl}/api/keluarga');
    final response =
        await http.post(url, body: jsonEncode(keluarga.toJson()), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return Keluarga.fromJson(jsonBody['data'] as Map<String, dynamic>);
  }

  Future<Keluarga> insertAnggota({
    required String idKeluarga,
    required AnggotaKeluarga anggota,
  }) async {
    final token = (await SharedPreferences.getInstance()).getString('token');

    final url =
        Uri.parse('${AppConstant.apiUrl}/api/keluarga/$idKeluarga/anggota');
    final response = await http.post(url,
        body: jsonEncode({
          ...anggota.toJson(),
        }),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        });
    print(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return Keluarga.fromJson(jsonBody['data'] as Map<String, dynamic>);
  }
}
