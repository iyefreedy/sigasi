import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigasi/exceptions/general_exception.dart';
import 'package:sigasi/models/auth_response.dart';
import 'package:sigasi/models/user.dart';
import 'package:sigasi/utils/app_constant.dart';

class AuthService {
  Future<Map<String, String>> _getHeaders() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    if (token == null) {
      throw UnathenticatedException('Sesi anda telah berakhir');
    }
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<User?> authenticate() async {
    final url = Uri.parse('${AppConstant.apiUrl}/api/user');
    try {
      final headers = await _getHeaders();
      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw UnathenticatedException(
          'Sesi Anda telah berakhir. Silakan login kembali.',
        );
      }

      return _parseUser(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> login(String username, String password) async {
    final url = Uri.parse('${AppConstant.apiUrl}/api/authenticate');
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
        throw UnathenticatedException('Username atau kata sandi salah.');
      }

      final authResponse = _parseAuthResponse(response.body);
      await _saveToken(authResponse.token);

      return authResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    final url = Uri.parse('${AppConstant.apiUrl}/api/logout');
    try {
      final headers = await _getHeaders();
      final response = await http.post(url, headers: headers);

      if (response.statusCode != 200) {
        throw UnathenticatedException(
          'Sesi Anda telah berakhir. Silakan login kembali.',
        );
      }

      await _removeToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
  }

  Future<void> _removeToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
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
