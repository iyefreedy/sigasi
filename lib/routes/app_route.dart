import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/admin/presentation/screens/menu_list_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/district/presentation/screens/district_form_screen.dart';
import '../features/district/presentation/screens/district_list_screen.dart';
import '../features/item/presentation/screens/item_form_screen.dart';
import '../features/item/presentation/screens/item_list_screen.dart';
import '../features/item_category/presentation/screens/item_type_form_screen.dart';
import '../features/item_category/presentation/screens/item_type_list_screen.dart';
import '../features/population_group/presentation/population_group_form_screen.dart';
import '../features/population_group/presentation/population_group_list_screen.dart';
import '../features/post/presentation/screens/post_list_screen.dart';
import '../features/resident/presentation/screens/resident_form_screen.dart';
import '../features/resident/presentation/screens/resident_list_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/village/presentation/screens/village_form_screen.dart';
import '../features/village/presentation/screens/village_list_screen.dart';
import '../shared/domain/models/district/district.dart';
import '../shared/domain/models/item/item.dart';
import '../shared/domain/models/item_category/item_category.dart';
import '../shared/domain/models/population_group/population_group.dart';
import '../shared/domain/models/resident/resident.dart';
import '../shared/domain/models/village/village.dart';

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
        AutoRoute(page: DistrictListRoute.page),
        AutoRoute(page: DistrictFormRoute.page),
        AutoRoute(page: VillageListRoute.page),
        AutoRoute(page: VillageFormRoute.page),
        AutoRoute(page: PopulationGroupListRoute.page),
        AutoRoute(page: PopulationGroupFormRoute.page),
        AutoRoute(page: ItemTypeListRoute.page),
        AutoRoute(page: ItemTypeFormRoute.page),
        AutoRoute(page: ItemListRoute.page),
        AutoRoute(page: ItemFormRoute.page),
        AutoRoute(page: ResidentListRoute.page),
        AutoRoute(page: ResidentFormRoute.page),
        AutoRoute(page: PostListRoute.page),
      ];
}
