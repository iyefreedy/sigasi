import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/services/auth_service.dart';
import '../models/user.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(AuthService()),
);

class AuthState {
  final User? user;
  final Exception? error;
  final bool isLoading;

  const AuthState({
    this.user,
    this.error,
    this.isLoading = false,
  });

  AuthState copyWith({
    User? user,
    Exception? error,
    bool? isLoading,
  }) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService authService;

  AuthNotifier(this.authService) : super(const AuthState());

  User? get currentUser => state.user;

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await authService.login(username, password);
      state = state.copyWith(user: user);
    } on Exception catch (e) {
      state = state.copyWith(error: e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> authenticate() async {
    state = state.copyWith(isLoading: true); // Set loading state
    try {
      final user = await authService.authenticate();
      state = state.copyWith(user: user);
    } on Exception catch (e) {
      print('Authentication error: $e');
      state = state.copyWith(error: e);
    }
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(user: null);
    } on Exception catch (e) {
      print('Logout error: $e');
      state = state.copyWith(error: e);
    }
  }
}
