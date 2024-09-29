import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_file.dart';

import 'main/observers.dart';
import 'routes/app_route.dart';
import 'shared/globals.dart';
import 'shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', '');

  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Open Sans");

    AppTheme theme = AppTheme(textTheme);
    return MaterialApp.router(
      title: 'SIGASI',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
