import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/auth_service.dart';
import '../models/user.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>(
  (ref) => AuthNotifier(AuthService()),
);

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService authService;

  AuthNotifier(this.authService) : super(const AsyncValue.data(null));

  User? get currentUser => state.value;

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading(); // Set loading state
    try {
      final user = await authService.login(username, password);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current); // Set error state
    }
  }

  Future<void> authenticate() async {
    state = const AsyncValue.loading(); // Set loading state
    try {
      final user = await authService.authenticate();
      state = AsyncValue.data(user);
    } catch (e) {
      print('Authentication error: $e');
      state = AsyncValue.error(e, StackTrace.current); // Set error state
    }
  }

  Future<void> logout() async {
    try {
      state = const AsyncValue.data(null);
      // Add additional logout logic if needed, such as clearing the token.
    } catch (e) {
      print('Logout error: $e');
      // Optionally handle logout errors if needed.
    }
  }
}
