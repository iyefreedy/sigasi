// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

/// generated route for
/// [BarangFormScreen]
class BarangFormRoute extends PageRouteInfo<BarangFormRouteArgs> {
  BarangFormRoute({
    Key? key,
    Barang? barang,
    List<PageRouteInfo>? children,
  }) : super(
          BarangFormRoute.name,
          args: BarangFormRouteArgs(
            key: key,
            barang: barang,
          ),
          initialChildren: children,
        );

  static const String name = 'BarangFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BarangFormRouteArgs>(
          orElse: () => const BarangFormRouteArgs());
      return BarangFormScreen(
        key: args.key,
        barang: args.barang,
      );
    },
  );
}

class BarangFormRouteArgs {
  const BarangFormRouteArgs({
    this.key,
    this.barang,
  });

  final Key? key;

  final Barang? barang;

  @override
  String toString() {
    return 'BarangFormRouteArgs{key: $key, barang: $barang}';
  }
}

/// generated route for
/// [BarangListScreen]
class BarangListRoute extends PageRouteInfo<void> {
  const BarangListRoute({List<PageRouteInfo>? children})
      : super(
          BarangListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarangListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BarangListScreen();
    },
  );
}

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
/// [JenisBarangFormScreen]
class JenisBarangFormRoute extends PageRouteInfo<JenisBarangFormRouteArgs> {
  JenisBarangFormRoute({
    Key? key,
    JenisBarang? jenisBarang,
    List<PageRouteInfo>? children,
  }) : super(
          JenisBarangFormRoute.name,
          args: JenisBarangFormRouteArgs(
            key: key,
            jenisBarang: jenisBarang,
          ),
          initialChildren: children,
        );

  static const String name = 'JenisBarangFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JenisBarangFormRouteArgs>(
          orElse: () => const JenisBarangFormRouteArgs());
      return JenisBarangFormScreen(
        key: args.key,
        jenisBarang: args.jenisBarang,
      );
    },
  );
}

class JenisBarangFormRouteArgs {
  const JenisBarangFormRouteArgs({
    this.key,
    this.jenisBarang,
  });

  final Key? key;

  final JenisBarang? jenisBarang;

  @override
  String toString() {
    return 'JenisBarangFormRouteArgs{key: $key, jenisBarang: $jenisBarang}';
  }
}

/// generated route for
/// [JenisBarangListScreen]
class JenisBarangListRoute extends PageRouteInfo<void> {
  const JenisBarangListRoute({List<PageRouteInfo>? children})
      : super(
          JenisBarangListRoute.name,
          initialChildren: children,
        );

  static const String name = 'JenisBarangListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const JenisBarangListScreen();
    },
  );
}

/// generated route for
/// [KelompokFormScreen]
class KelompokFormRoute extends PageRouteInfo<KelompokFormRouteArgs> {
  KelompokFormRoute({
    Key? key,
    Kelompok? kelompok,
    List<PageRouteInfo>? children,
  }) : super(
          KelompokFormRoute.name,
          args: KelompokFormRouteArgs(
            key: key,
            kelompok: kelompok,
          ),
          initialChildren: children,
        );

  static const String name = 'KelompokFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<KelompokFormRouteArgs>(
          orElse: () => const KelompokFormRouteArgs());
      return KelompokFormScreen(
        key: args.key,
        kelompok: args.kelompok,
      );
    },
  );
}

class KelompokFormRouteArgs {
  const KelompokFormRouteArgs({
    this.key,
    this.kelompok,
  });

  final Key? key;

  final Kelompok? kelompok;

  @override
  String toString() {
    return 'KelompokFormRouteArgs{key: $key, kelompok: $kelompok}';
  }
}

/// generated route for
/// [KelompokListScreen]
class KelompokListRoute extends PageRouteInfo<void> {
  const KelompokListRoute({List<PageRouteInfo>? children})
      : super(
          KelompokListRoute.name,
          initialChildren: children,
        );

  static const String name = 'KelompokListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const KelompokListScreen();
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
/// [PendudukFormScreen]
class PendudukFormRoute extends PageRouteInfo<PendudukFormRouteArgs> {
  PendudukFormRoute({
    Key? key,
    Penduduk? penduduk,
    List<PageRouteInfo>? children,
  }) : super(
          PendudukFormRoute.name,
          args: PendudukFormRouteArgs(
            key: key,
            penduduk: penduduk,
          ),
          initialChildren: children,
        );

  static const String name = 'PendudukFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PendudukFormRouteArgs>(
          orElse: () => const PendudukFormRouteArgs());
      return PendudukFormScreen(
        key: args.key,
        penduduk: args.penduduk,
      );
    },
  );
}

class PendudukFormRouteArgs {
  const PendudukFormRouteArgs({
    this.key,
    this.penduduk,
  });

  final Key? key;

  final Penduduk? penduduk;

  @override
  String toString() {
    return 'PendudukFormRouteArgs{key: $key, penduduk: $penduduk}';
  }
}

/// generated route for
/// [PendudukListScreen]
class PendudukListRoute extends PageRouteInfo<void> {
  const PendudukListRoute({List<PageRouteInfo>? children})
      : super(
          PendudukListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendudukListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PendudukListScreen();
    },
  );
}

/// generated route for
/// [PoskoFormScreen]
class PoskoFormRoute extends PageRouteInfo<PoskoFormRouteArgs> {
  PoskoFormRoute({
    Key? key,
    Posko? posko,
    List<PageRouteInfo>? children,
  }) : super(
          PoskoFormRoute.name,
          args: PoskoFormRouteArgs(
            key: key,
            posko: posko,
          ),
          initialChildren: children,
        );

  static const String name = 'PoskoFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PoskoFormRouteArgs>(
          orElse: () => const PoskoFormRouteArgs());
      return PoskoFormScreen(
        key: args.key,
        posko: args.posko,
      );
    },
  );
}

class PoskoFormRouteArgs {
  const PoskoFormRouteArgs({
    this.key,
    this.posko,
  });

  final Key? key;

  final Posko? posko;

  @override
  String toString() {
    return 'PoskoFormRouteArgs{key: $key, posko: $posko}';
  }
}

/// generated route for
/// [PoskoListScreen]
class PoskoListRoute extends PageRouteInfo<void> {
  const PoskoListRoute({List<PageRouteInfo>? children})
      : super(
          PoskoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PoskoListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PoskoListScreen();
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
