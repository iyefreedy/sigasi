import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/auth_provider.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authState = ref.watch(authProvider);
        ref.listen(
          authProvider,
          (previous, next) async {
            if (next.error != null) {
              final error = next.error;
              if (context.mounted && previous?.error != next.error) {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content:
                          Text(error.toString()), // Menampilkan pesan error
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
          ));
        }

        return authState.user != null
            ? const HomeScreen()
            : const LoginScreen();
      },
    );
  }
}
