import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigasi/routes/app_route.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController =
      TextEditingController(text: 'kminchelle');
  final TextEditingController passwordController =
      TextEditingController(text: '0lelplR');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                Row(
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
                          'Masukkan kredensial anda untuk masuk',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Flexible(
                      child: Image.asset('assets/logo-cianjur.png'),
                    )
                  ],
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    prefixIcon: const Icon(Icons.email),
                    prefixIconColor: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    prefixIcon: const Icon(Icons.password),
                    prefixIconColor: Theme.of(context).primaryColor,
                    suffixIcon: const Icon(Icons.visibility),
                    suffixIconColor: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 14.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const DashboardRoute());
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
