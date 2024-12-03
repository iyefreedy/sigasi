import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/screens/home_screen.dart';
import 'package:sigasi/screens/login_screen.dart';

import '../providers/auth_provider.dart';
import '../utils/loading/loading_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.isLoading) {
        LoadingScreen().show(context: context, text: 'Mohon tunggu...');
      } else {
        LoadingScreen().hide();
      }
    });

    if (authState.user != null) {
      return const HomeScreen();
    } else if ((authState.user == null)) {
      return const LoginScreen();
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
