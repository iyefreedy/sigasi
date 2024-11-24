import 'package:flutter/material.dart';
import 'package:sigasi/models/donatur.dart';
import 'package:sigasi/models/penduduk.dart';
import 'package:sigasi/models/posko.dart';
import 'package:sigasi/screens/create_penduduk_screen.dart';
import 'package:sigasi/screens/detail_keluarga_screen.dart';
import 'package:sigasi/screens/edit_penduduk_screen.dart';
import 'package:sigasi/screens/filter_keluarga_screen.dart';
import 'package:sigasi/screens/filter_pengungsi_screen.dart';
import 'package:sigasi/screens/form_anggota_keluarga_screen.dart';
import 'package:sigasi/screens/form_bantuan_screen.dart';
import 'package:sigasi/screens/form_distribusi_screen.dart';
import 'package:sigasi/screens/form_donatur_screen.dart';
import 'package:sigasi/screens/form_kebutuhan_screen.dart';
import 'package:sigasi/screens/form_keluarga_screen.dart';
import 'package:sigasi/screens/form_pengungsi_screen.dart';
import 'package:sigasi/screens/form_posko_screen.dart';
import 'package:sigasi/screens/home_screen.dart';
import 'package:sigasi/screens/list_bantuan_screen.dart';
import 'package:sigasi/screens/list_distribusi_screen.dart';
import 'package:sigasi/screens/list_donatur_screen.dart';
import 'package:sigasi/screens/list_kebutuhan_screen.dart';
import 'package:sigasi/screens/list_keluarga_screen.dart';
import 'package:sigasi/screens/list_penduduk_screen.dart';
import 'package:sigasi/screens/list_pengungsi_screen.dart';
import 'package:sigasi/screens/list_posko_screen.dart';
import 'package:sigasi/screens/login_screen.dart';

import '../screens/filter_penduduk_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static const homeRoute = '/';
  static const splashRoute = '/splash';
  static const loginRoute = '/login';

  static const filterKeluargaRoute = '/filter-keluarga';
  static const listKeluargaRoute = '/list-keluarga';
  static const formKeluargaRoute = '/form-keluarga';
  static const detailKeluargaRoute = '/detail-keluarga';

  static const formAnggotaKeluargaRoute =
      '/detail-keluarga/form-anggota-keluarga';

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
  static const listBantuanRoute = '/list-bantuan';
  static const formBantuanRoute = '/form-bantuan';
  static const listKebutuhanRoute = '/list-kebutuhan';
  static const formKebutuhanRoute = '/form-kebutuhan';
  static const listDistribusiRoute = '/list-distribusi';
  static const formDistribusiRoute = '/form-distribusi';

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

      case filterKeluargaRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FilterKeluargaScreen(),
        );
      case formKeluargaRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FormKeluargaScreen(),
        );
      case listKeluargaRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final args = settings.arguments as List<int>;
            final idKecamatan = args[0];
            final idDesa = args[1];
            return ListKeluargaScreen(
              idDesa: idDesa,
              idKecamatan: idKecamatan,
            );
          },
        );
      case detailKeluargaRoute:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as String;
          return DetailKeluargaScreen(id: args);
        });

      case formAnggotaKeluargaRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final idKeluarga = settings.arguments as String;
            return FormAnggotaKeluargaScreen(idKeluarga: idKeluarga);
          },
        );

      case filterPendudukRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FilterPendudukScreen(),
        );
      case listPendudukRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final params = settings.arguments as List;
            return ListPendudukScreen(
              idKelompok: params[0] as String,
              desa: params[1] as int,
            );
          },
        );

      case filterPengungsiRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FilterPengungsiScreen(),
        );

      case formPengungsiRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FormPengungsiScreen(),
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
            final donatur = settings.arguments as Donatur?;
            return FormDonaturScreen(donatur: donatur);
          },
        );

      case listBantuanRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            return const ListBantuanScreen();
          },
        );

      case formBantuanRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const FormBantuanScreen();
          },
        );

      case listPengungsiRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) {
            final args =
                settings.arguments as ({String? idKelompok, String? idPosko});
            return ListPengungsiScreen(
                idKelompok: args.idKelompok, idPosko: args.idPosko);
          },
        );

      case listKebutuhanRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const ListKebutuhanScreen(),
        );

      case formKebutuhanRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FormKebutuhanScreen(),
        );

      case listDistribusiRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const ListDistribusiScreen(),
        );

      case formDistribusiRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const FormDistribusiScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Not found'),
            ),
          ),
        );
    }
  }
}
