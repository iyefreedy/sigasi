import 'package:flutter/material.dart';
import 'package:sigasi/models/donatur.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/models/posko.dart';
import 'package:sigasi/screens/create_penduduk_screen.dart';
import 'package:sigasi/screens/edit_penduduk_screen.dart';
import 'package:sigasi/screens/filter_pengungsi_screen.dart';
import 'package:sigasi/screens/form_donatur_screen.dart';
import 'package:sigasi/screens/form_posko_screen.dart';
import 'package:sigasi/screens/home_screen.dart';
import 'package:sigasi/screens/list_donatur_screen.dart';
import 'package:sigasi/screens/list_penduduk_screen.dart';
import 'package:sigasi/screens/list_posko_screen.dart';
import 'package:sigasi/screens/login_screen.dart';

import '../screens/filter_penduduk_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static const homeRoute = '/';
  static const splashRoute = '/splash';
  static const loginRoute = '/login';
  static const filterPendudukRoute = '/filter-penduduk';
  static const formPendudukRoute = '/form-penduduk';
  static const listPendudukRoute = '/list-penduduk';
  static const filterPengungsiRoute = '/filter-pengungsi';
  static const formPengungsiRoute = '/form-pengungsi';
  static const listPengungsiRoute = '/list-pengungsi';
  static const listPoskoroute = '/list-posko';
  static const formPoskoRoute = '/form-posko';
  static const listDonaturRoute = '/list-donatur';
  static const formDonaturRoute = '/form-donatur';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    switch (routeName) {
      case homeRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const HomeScreen(),
        );
      case loginRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const LoginScreen(),
        );
      case splashRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const SplashScreen(),
        );
      case filterPendudukRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FilterPendudukScreen(),
        );

      case filterPengungsiRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FilterPengungsiScreen(),
        );
      case formPendudukRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final penduduk = settings.arguments as Penduduk?;
            if (penduduk != null) {
              return EditPendudukScreen(penduduk: penduduk);
            }

            return const CreatePendudukScreen();
          },
        );
      case listPendudukRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final params = settings.arguments as List;
            return ListPendudukScreen(
              idKelompok: params[0] as int,
              desa: params[1] as String,
            );
          },
        );
      case listPoskoroute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const ListPoskoScreen(),
        );
      case formPoskoRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final posko = settings.arguments as Posko?;
            return FormPoskoScreen(posko: posko);
          },
        );

      case listDonaturRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const ListDonaturScreen(),
        );

      case formDonaturRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final donatur = settings.arguments as Donatur;
            return FormDonaturScreen(donatur: donatur);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Not found'),
            ),
          ),
        );
    }
  }
}