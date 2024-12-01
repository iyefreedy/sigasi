import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/providers/auth_provider.dart';
import 'package:sigasi/utils/app_router.dart';
import 'package:sigasi/utils/dialogs/error_dialog.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    await ref.read(authProvider.notifier).login(username, password);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next.error != null) {
          if (context.mounted && previous?.error != next.error) {
            showErrorDialog(context, next.error.toString());
          }
        }

        if (next.user != null) {
          Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
        }
      },
    );
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang!',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Masukkan kredensial Anda untuk masuk',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Image.asset('assets/logo-cianjur.png', height: 60),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Isi username';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Isi password';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: authState.isLoading ? null : handleLogin,
              child: authState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
