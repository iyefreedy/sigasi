// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [DistrictFormScreen]
class DistrictFormRoute extends PageRouteInfo<DistrictFormRouteArgs> {
  DistrictFormRoute({
    Key? key,
    District? district,
    List<PageRouteInfo>? children,
  }) : super(
          DistrictFormRoute.name,
          args: DistrictFormRouteArgs(
            key: key,
            district: district,
          ),
          initialChildren: children,
        );

  static const String name = 'DistrictFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DistrictFormRouteArgs>(
          orElse: () => const DistrictFormRouteArgs());
      return DistrictFormScreen(
        key: args.key,
        district: args.district,
      );
    },
  );
}

class DistrictFormRouteArgs {
  const DistrictFormRouteArgs({
    this.key,
    this.district,
  });

  final Key? key;

  final District? district;

  @override
  String toString() {
    return 'DistrictFormRouteArgs{key: $key, district: $district}';
  }
}

/// generated route for
/// [DistrictListScreen]
class DistrictListRoute extends PageRouteInfo<void> {
  const DistrictListRoute({List<PageRouteInfo>? children})
      : super(
          DistrictListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DistrictListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DistrictListScreen();
    },
  );
}

/// generated route for
/// [ItemFormScreen]
class ItemFormRoute extends PageRouteInfo<ItemFormRouteArgs> {
  ItemFormRoute({
    Key? key,
    Item? item,
    List<PageRouteInfo>? children,
  }) : super(
          ItemFormRoute.name,
          args: ItemFormRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ItemFormRouteArgs>(
          orElse: () => const ItemFormRouteArgs());
      return ItemFormScreen(
        key: args.key,
        item: args.item,
      );
    },
  );
}

class ItemFormRouteArgs {
  const ItemFormRouteArgs({
    this.key,
    this.item,
  });

  final Key? key;

  final Item? item;

  @override
  String toString() {
    return 'ItemFormRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [ItemListScreen]
class ItemListRoute extends PageRouteInfo<void> {
  const ItemListRoute({List<PageRouteInfo>? children})
      : super(
          ItemListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ItemListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ItemListScreen();
    },
  );
}

/// generated route for
/// [ItemTypeFormScreen]
class ItemTypeFormRoute extends PageRouteInfo<ItemTypeFormRouteArgs> {
  ItemTypeFormRoute({
    Key? key,
    ItemCategory? itemType,
    List<PageRouteInfo>? children,
  }) : super(
          ItemTypeFormRoute.name,
          args: ItemTypeFormRouteArgs(
            key: key,
            itemType: itemType,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemTypeFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ItemTypeFormRouteArgs>(
          orElse: () => const ItemTypeFormRouteArgs());
      return ItemTypeFormScreen(
        key: args.key,
        itemType: args.itemType,
      );
    },
  );
}

class ItemTypeFormRouteArgs {
  const ItemTypeFormRouteArgs({
    this.key,
    this.itemType,
  });

  final Key? key;

  final ItemCategory? itemType;

  @override
  String toString() {
    return 'ItemTypeFormRouteArgs{key: $key, itemType: $itemType}';
  }
}

/// generated route for
/// [ItemTypeListScreen]
class ItemTypeListRoute extends PageRouteInfo<void> {
  const ItemTypeListRoute({List<PageRouteInfo>? children})
      : super(
          ItemTypeListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ItemTypeListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ItemTypeListScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MenuListScreen]
class MenuListRoute extends PageRouteInfo<void> {
  const MenuListRoute({List<PageRouteInfo>? children})
      : super(
          MenuListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenuListScreen();
    },
  );
}

/// generated route for
/// [PopulationGroupFormScreen]
class PopulationGroupFormRoute
    extends PageRouteInfo<PopulationGroupFormRouteArgs> {
  PopulationGroupFormRoute({
    Key? key,
    PopulationGroup? populationGroup,
    List<PageRouteInfo>? children,
  }) : super(
          PopulationGroupFormRoute.name,
          args: PopulationGroupFormRouteArgs(
            key: key,
            populationGroup: populationGroup,
          ),
          initialChildren: children,
        );

  static const String name = 'PopulationGroupFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PopulationGroupFormRouteArgs>(
          orElse: () => const PopulationGroupFormRouteArgs());
      return PopulationGroupFormScreen(
        key: args.key,
        populationGroup: args.populationGroup,
      );
    },
  );
}

class PopulationGroupFormRouteArgs {
  const PopulationGroupFormRouteArgs({
    this.key,
    this.populationGroup,
  });

  final Key? key;

  final PopulationGroup? populationGroup;

  @override
  String toString() {
    return 'PopulationGroupFormRouteArgs{key: $key, populationGroup: $populationGroup}';
  }
}

/// generated route for
/// [PopulationGroupListScreen]
class PopulationGroupListRoute extends PageRouteInfo<void> {
  const PopulationGroupListRoute({List<PageRouteInfo>? children})
      : super(
          PopulationGroupListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PopulationGroupListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PopulationGroupListScreen();
    },
  );
}

/// generated route for
/// [PostFormScreen]
class PostFormRoute extends PageRouteInfo<PostFormRouteArgs> {
  PostFormRoute({
    Key? key,
    Post? post,
    List<PageRouteInfo>? children,
  }) : super(
          PostFormRoute.name,
          args: PostFormRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'PostFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostFormRouteArgs>(
          orElse: () => const PostFormRouteArgs());
      return PostFormScreen(
        key: args.key,
        post: args.post,
      );
    },
  );
}

class PostFormRouteArgs {
  const PostFormRouteArgs({
    this.key,
    this.post,
  });

  final Key? key;

  final Post? post;

  @override
  String toString() {
    return 'PostFormRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [PostListScreen]
class PostListRoute extends PageRouteInfo<void> {
  const PostListRoute({List<PageRouteInfo>? children})
      : super(
          PostListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostListScreen();
    },
  );
}

/// generated route for
/// [ResidentFormScreen]
class ResidentFormRoute extends PageRouteInfo<ResidentFormRouteArgs> {
  ResidentFormRoute({
    Key? key,
    Resident? resident,
    List<PageRouteInfo>? children,
  }) : super(
          ResidentFormRoute.name,
          args: ResidentFormRouteArgs(
            key: key,
            resident: resident,
          ),
          initialChildren: children,
        );

  static const String name = 'ResidentFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResidentFormRouteArgs>(
          orElse: () => const ResidentFormRouteArgs());
      return ResidentFormScreen(
        key: args.key,
        resident: args.resident,
      );
    },
  );
}

class ResidentFormRouteArgs {
  const ResidentFormRouteArgs({
    this.key,
    this.resident,
  });

  final Key? key;

  final Resident? resident;

  @override
  String toString() {
    return 'ResidentFormRouteArgs{key: $key, resident: $resident}';
  }
}

/// generated route for
/// [ResidentListScreen]
class ResidentListRoute extends PageRouteInfo<void> {
  const ResidentListRoute({List<PageRouteInfo>? children})
      : super(
          ResidentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResidentListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResidentListScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [VillageFormScreen]
class VillageFormRoute extends PageRouteInfo<VillageFormRouteArgs> {
  VillageFormRoute({
    Key? key,
    Village? village,
    List<PageRouteInfo>? children,
  }) : super(
          VillageFormRoute.name,
          args: VillageFormRouteArgs(
            key: key,
            village: village,
          ),
          initialChildren: children,
        );

  static const String name = 'VillageFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VillageFormRouteArgs>(
          orElse: () => const VillageFormRouteArgs());
      return VillageFormScreen(
        key: args.key,
        village: args.village,
      );
    },
  );
}

class VillageFormRouteArgs {
  const VillageFormRouteArgs({
    this.key,
    this.village,
  });

  final Key? key;

  final Village? village;

  @override
  String toString() {
    return 'VillageFormRouteArgs{key: $key, village: $village}';
  }
}

/// generated route for
/// [VillageListScreen]
class VillageListRoute extends PageRouteInfo<void> {
  const VillageListRoute({List<PageRouteInfo>? children})
      : super(
          VillageListRoute.name,
          initialChildren: children,
        );

  static const String name = 'VillageListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VillageListScreen();
    },
  );
}
