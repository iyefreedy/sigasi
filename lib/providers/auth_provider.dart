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

  @override
  String toString() {
    return '''
    AuthState(
      user: $user,
      error: $error,
      isLoading: $isLoading,
    )
    ''';
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService authService;

  AuthNotifier(this.authService) : super(const AuthState()) {
    authenticate();
  }

  Future<void> login(String username, String password) async {
    state = const AuthState(
      user: null,
      error: null,
      isLoading: true,
    );
    try {
      final user = await authService.login(username, password);
      state = AuthState(user: user, isLoading: false, error: null);
    } on Exception catch (e) {
      state = AuthState(error: e, user: null, isLoading: false);
    }
  }

  Future<void> authenticate() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await authService.authenticate();
      state = AuthState(user: user, isLoading: false, error: null);
    } on Exception catch (e) {
      state = AuthState(error: e, user: null, isLoading: false);
    }
  }

  Future<void> logout() async {
    state = const AuthState(isLoading: true);
    try {
      await authService.logout();
      state = const AuthState(
        user: null,
        error: null,
        isLoading: false,
      );
    } on Exception catch (e) {
      state = AuthState(error: e, isLoading: false);
    }
  }
}
