import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/admin/presentation/screens/menu_list_screen.dart';
import '../features/anggaran/presentation/screens/form_anggaran_screen.dart';
import '../features/anggaran/presentation/screens/list_anggaran_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/bantuan/presentation/screens/form_bantuan_screen.dart';
import '../features/bantuan/presentation/screens/list_bantuan_screen.dart';
import '../features/barang/presentation/screens/barang_form_screen.dart';
import '../features/barang/presentation/screens/barang_list_screen.dart';
import '../features/distribusi/presentation/screens/form_distribusi_screen.dart';
import '../features/distribusi/presentation/screens/list_distribusi_screen.dart';
import '../features/donatur/presentation/screens/form_donatur_screen.dart';
import '../features/donatur/presentation/screens/list_donatur_screen.dart';
import '../features/jenis_barang/presentation/screens/jenis_barang_form_screen.dart';
import '../features/jenis_barang/presentation/screens/jenis_barang_list_screen.dart';
import '../features/kebutuhan/presentation/screens/filter_kebutuhan_screen.dart';
import '../features/kebutuhan/presentation/screens/form_kebutuhan_screen.dart';
import '../features/kebutuhan/presentation/screens/list_kebutuhan_screen.dart';
import '../features/kelompok/presentation/kelompok_form_screen.dart';
import '../features/kelompok/presentation/kelompok_list_screen.dart';
import '../features/penduduk/presentation/screens/penduduk_filter_screen.dart';
import '../features/pengungsi/presentation/screens/filter_pengungsi_screen.dart';
import '../features/pengungsi/presentation/screens/form_pengungsi_screen.dart';
import '../features/pengungsi/presentation/screens/list_pengungsi_screen.dart';
import '../features/posko/presentation/screens/posko_form_screen.dart';
import '../features/posko/presentation/screens/posko_list_screen.dart';
import '../features/penduduk/presentation/screens/penduduk_form_screen.dart';
import '../features/penduduk/presentation/screens/penduduk_list_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../shared/domain/models/bantuan/bantuan.dart';
import '../shared/domain/models/barang/barang.dart';
import '../shared/domain/models/donatur/donatur.dart';
import '../shared/domain/models/jenis_barang/jenis_barang.dart';
import '../shared/domain/models/kebutuhan/kebutuhan.dart';
import '../shared/domain/models/kelompok/kelompok.dart';
import '../shared/domain/models/penduduk/penduduk.dart';
import '../shared/domain/models/pengungsi/pengungsi.dart';
import '../shared/domain/models/posko/posko.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: MenuListRoute.page),
        AutoRoute(page: KelompokListRoute.page),
        AutoRoute(page: KelompokFormRoute.page),
        AutoRoute(page: JenisBarangListRoute.page),
        AutoRoute(page: JenisBarangFormRoute.page),
        AutoRoute(page: BarangListRoute.page),
        AutoRoute(page: BarangFormRoute.page),
        AutoRoute(page: PendudukFilterRoute.page),
        AutoRoute(page: PendudukListRoute.page),
        AutoRoute(page: PendudukFormRoute.page),
        AutoRoute(page: PoskoListRoute.page),
        AutoRoute(page: PoskoFormRoute.page),
        AutoRoute(page: FilterPengungsiRoute.page),
        AutoRoute(page: ListPengungsiRoute.page),
        AutoRoute(page: FormPengungsiRoute.page),
        AutoRoute(page: FilterKebutuhanRoute.page),
        AutoRoute(page: FormKebutuhanRoute.page),
        AutoRoute(page: ListKebutuhanRoute.page),
        AutoRoute(page: ListDonaturRoute.page),
        AutoRoute(page: FormDonaturRoute.page),
        AutoRoute(page: ListBantuanRoute.page),
        AutoRoute(page: FormBantuanRoute.page),
        AutoRoute(page: ListBantuanRoute.page),
        AutoRoute(page: FormBantuanRoute.page),
        AutoRoute(page: ListAnggaranRoute.page),
        AutoRoute(page: FormAnggaranRoute.page),
        AutoRoute(page: ListDistribusiRoute.page),
        AutoRoute(page: FormDistribusiRoute.page),
      ];
}
