import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/auth_provider.dart';
import 'package:sigasi/screens/home_screen.dart';
import 'package:sigasi/screens/login_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    log('$authState');

    ref.listen(
      authProvider,
      (previous, next) async {
        if (next.error != null) {
          if (context.mounted && previous?.error != next.error) {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text(
                      'Sesi anda telah berakhir. Silahkan login kembali'), // Menampilkan pesan error
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        }
      },
    );

    if (authState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return authState.user != null ? const HomeScreen() : const LoginScreen();
  }
}
