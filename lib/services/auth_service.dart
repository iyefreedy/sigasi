import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/models/auth_response.dart';
import 'package:sigasi/models/user.dart';

class AuthService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  Future<Map<String, String>> _getHeaders() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<User?> authenticate() async {
    final url = Uri.parse('$_baseUrl/dashboard');
    try {
      final headers = await _getHeaders();
      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw Exception('Sesi Anda telah berakhir. Silakan login kembali.');
      }

      return _parseUser(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/authenticate');
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'email_or_username': username,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        print(response.body);
        throw Exception('Username atau kata sandi salah.');
      }

      print(response.body);

      final authResponse = _parseAuthResponse(response.body);
      await _saveToken(authResponse.token);

      return authResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
  }

  User _parseUser(String responseBody) {
    final jsonBody = jsonDecode(responseBody) as Map<String, dynamic>;
    return User.fromJson(jsonBody);
  }

  AuthResponse _parseAuthResponse(String responseBody) {
    final jsonBody = jsonDecode(responseBody) as Map<String, dynamic>;
    return AuthResponse.fromJson(jsonBody);
  }
}
