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
/// [FilterKebutuhanScreen]
class FilterKebutuhanRoute extends PageRouteInfo<void> {
  const FilterKebutuhanRoute({List<PageRouteInfo>? children})
      : super(
          FilterKebutuhanRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterKebutuhanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FilterKebutuhanScreen();
    },
  );
}

/// generated route for
/// [FilterPengungsiScreen]
class FilterPengungsiRoute extends PageRouteInfo<void> {
  const FilterPengungsiRoute({List<PageRouteInfo>? children})
      : super(
          FilterPengungsiRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterPengungsiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FilterPengungsiScreen();
    },
  );
}

/// generated route for
/// [FormAnggaranScreen]
class FormAnggaranRoute extends PageRouteInfo<void> {
  const FormAnggaranRoute({List<PageRouteInfo>? children})
      : super(
          FormAnggaranRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormAnggaranRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FormAnggaranScreen();
    },
  );
}

/// generated route for
/// [FormBantuanScreen]
class FormBantuanRoute extends PageRouteInfo<FormBantuanRouteArgs> {
  FormBantuanRoute({
    Key? key,
    Bantuan? bantuan,
    List<PageRouteInfo>? children,
  }) : super(
          FormBantuanRoute.name,
          args: FormBantuanRouteArgs(
            key: key,
            bantuan: bantuan,
          ),
          initialChildren: children,
        );

  static const String name = 'FormBantuanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FormBantuanRouteArgs>(
          orElse: () => const FormBantuanRouteArgs());
      return FormBantuanScreen(
        key: args.key,
        bantuan: args.bantuan,
      );
    },
  );
}

class FormBantuanRouteArgs {
  const FormBantuanRouteArgs({
    this.key,
    this.bantuan,
  });

  final Key? key;

  final Bantuan? bantuan;

  @override
  String toString() {
    return 'FormBantuanRouteArgs{key: $key, bantuan: $bantuan}';
  }
}

/// generated route for
/// [FormDistribusiScreen]
class FormDistribusiRoute extends PageRouteInfo<void> {
  const FormDistribusiRoute({List<PageRouteInfo>? children})
      : super(
          FormDistribusiRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormDistribusiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FormDistribusiScreen();
    },
  );
}

/// generated route for
/// [FormDonaturScreen]
class FormDonaturRoute extends PageRouteInfo<FormDonaturRouteArgs> {
  FormDonaturRoute({
    Key? key,
    Donatur? donatur,
    List<PageRouteInfo>? children,
  }) : super(
          FormDonaturRoute.name,
          args: FormDonaturRouteArgs(
            key: key,
            donatur: donatur,
          ),
          initialChildren: children,
        );

  static const String name = 'FormDonaturRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FormDonaturRouteArgs>(
          orElse: () => const FormDonaturRouteArgs());
      return FormDonaturScreen(
        key: args.key,
        donatur: args.donatur,
      );
    },
  );
}

class FormDonaturRouteArgs {
  const FormDonaturRouteArgs({
    this.key,
    this.donatur,
  });

  final Key? key;

  final Donatur? donatur;

  @override
  String toString() {
    return 'FormDonaturRouteArgs{key: $key, donatur: $donatur}';
  }
}

/// generated route for
/// [FormKebutuhanScreen]
class FormKebutuhanRoute extends PageRouteInfo<FormKebutuhanRouteArgs> {
  FormKebutuhanRoute({
    Key? key,
    Kebutuhan? kebutuhan,
    List<PageRouteInfo>? children,
  }) : super(
          FormKebutuhanRoute.name,
          args: FormKebutuhanRouteArgs(
            key: key,
            kebutuhan: kebutuhan,
          ),
          initialChildren: children,
        );

  static const String name = 'FormKebutuhanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FormKebutuhanRouteArgs>(
          orElse: () => const FormKebutuhanRouteArgs());
      return FormKebutuhanScreen(
        key: args.key,
        kebutuhan: args.kebutuhan,
      );
    },
  );
}

class FormKebutuhanRouteArgs {
  const FormKebutuhanRouteArgs({
    this.key,
    this.kebutuhan,
  });

  final Key? key;

  final Kebutuhan? kebutuhan;

  @override
  String toString() {
    return 'FormKebutuhanRouteArgs{key: $key, kebutuhan: $kebutuhan}';
  }
}

/// generated route for
/// [FormPengungsiScreen]
class FormPengungsiRoute extends PageRouteInfo<FormPengungsiRouteArgs> {
  FormPengungsiRoute({
    Key? key,
    Pengungsi? pengungsi,
    List<PageRouteInfo>? children,
  }) : super(
          FormPengungsiRoute.name,
          args: FormPengungsiRouteArgs(
            key: key,
            pengungsi: pengungsi,
          ),
          initialChildren: children,
        );

  static const String name = 'FormPengungsiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FormPengungsiRouteArgs>(
          orElse: () => const FormPengungsiRouteArgs());
      return FormPengungsiScreen(
        key: args.key,
        pengungsi: args.pengungsi,
      );
    },
  );
}

class FormPengungsiRouteArgs {
  const FormPengungsiRouteArgs({
    this.key,
    this.pengungsi,
  });

  final Key? key;

  final Pengungsi? pengungsi;

  @override
  String toString() {
    return 'FormPengungsiRouteArgs{key: $key, pengungsi: $pengungsi}';
  }
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
/// [ListAnggaranScreen]
class ListAnggaranRoute extends PageRouteInfo<void> {
  const ListAnggaranRoute({List<PageRouteInfo>? children})
      : super(
          ListAnggaranRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListAnggaranRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListAnggaranScreen();
    },
  );
}

/// generated route for
/// [ListBantuanScreen]
class ListBantuanRoute extends PageRouteInfo<void> {
  const ListBantuanRoute({List<PageRouteInfo>? children})
      : super(
          ListBantuanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListBantuanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListBantuanScreen();
    },
  );
}

/// generated route for
/// [ListDistribusiScreen]
class ListDistribusiRoute extends PageRouteInfo<void> {
  const ListDistribusiRoute({List<PageRouteInfo>? children})
      : super(
          ListDistribusiRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListDistribusiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListDistribusiScreen();
    },
  );
}

/// generated route for
/// [ListDonaturScreen]
class ListDonaturRoute extends PageRouteInfo<void> {
  const ListDonaturRoute({List<PageRouteInfo>? children})
      : super(
          ListDonaturRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListDonaturRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListDonaturScreen();
    },
  );
}

/// generated route for
/// [ListKebutuhanScreen]
class ListKebutuhanRoute extends PageRouteInfo<ListKebutuhanRouteArgs> {
  ListKebutuhanRoute({
    Key? key,
    int? idPosko,
    List<PageRouteInfo>? children,
  }) : super(
          ListKebutuhanRoute.name,
          args: ListKebutuhanRouteArgs(
            key: key,
            idPosko: idPosko,
          ),
          initialChildren: children,
        );

  static const String name = 'ListKebutuhanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListKebutuhanRouteArgs>(
          orElse: () => const ListKebutuhanRouteArgs());
      return ListKebutuhanScreen(
        key: args.key,
        idPosko: args.idPosko,
      );
    },
  );
}

class ListKebutuhanRouteArgs {
  const ListKebutuhanRouteArgs({
    this.key,
    this.idPosko,
  });

  final Key? key;

  final int? idPosko;

  @override
  String toString() {
    return 'ListKebutuhanRouteArgs{key: $key, idPosko: $idPosko}';
  }
}

/// generated route for
/// [ListPengungsiScreen]
class ListPengungsiRoute extends PageRouteInfo<ListPengungsiRouteArgs> {
  ListPengungsiRoute({
    Key? key,
    int? idPosko,
    int? idKelompok,
    List<PageRouteInfo>? children,
  }) : super(
          ListPengungsiRoute.name,
          args: ListPengungsiRouteArgs(
            key: key,
            idPosko: idPosko,
            idKelompok: idKelompok,
          ),
          initialChildren: children,
        );

  static const String name = 'ListPengungsiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListPengungsiRouteArgs>(
          orElse: () => const ListPengungsiRouteArgs());
      return ListPengungsiScreen(
        key: args.key,
        idPosko: args.idPosko,
        idKelompok: args.idKelompok,
      );
    },
  );
}

class ListPengungsiRouteArgs {
  const ListPengungsiRouteArgs({
    this.key,
    this.idPosko,
    this.idKelompok,
  });

  final Key? key;

  final int? idPosko;

  final int? idKelompok;

  @override
  String toString() {
    return 'ListPengungsiRouteArgs{key: $key, idPosko: $idPosko, idKelompok: $idKelompok}';
  }
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
/// [PendudukFilterScreen]
class PendudukFilterRoute extends PageRouteInfo<void> {
  const PendudukFilterRoute({List<PageRouteInfo>? children})
      : super(
          PendudukFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendudukFilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PendudukFilterScreen();
    },
  );
}

/// generated route for
/// [PendudukFormScreen]
class PendudukFormRoute extends PageRouteInfo<PendudukFormRouteArgs> {
  PendudukFormRoute({
    Key? key,
    Penduduk? penduduk,
    int? idKelompok,
    int? idKelurahan,
    List<PageRouteInfo>? children,
  }) : super(
          PendudukFormRoute.name,
          args: PendudukFormRouteArgs(
            key: key,
            penduduk: penduduk,
            idKelompok: idKelompok,
            idKelurahan: idKelurahan,
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
        idKelompok: args.idKelompok,
        idKelurahan: args.idKelurahan,
      );
    },
  );
}

class PendudukFormRouteArgs {
  const PendudukFormRouteArgs({
    this.key,
    this.penduduk,
    this.idKelompok,
    this.idKelurahan,
  });

  final Key? key;

  final Penduduk? penduduk;

  final int? idKelompok;

  final int? idKelurahan;

  @override
  String toString() {
    return 'PendudukFormRouteArgs{key: $key, penduduk: $penduduk, idKelompok: $idKelompok, idKelurahan: $idKelurahan}';
  }
}

/// generated route for
/// [PendudukListScreen]
class PendudukListRoute extends PageRouteInfo<PendudukListRouteArgs> {
  PendudukListRoute({
    Key? key,
    required int? idKelompok,
    required int? idKelurahan,
    List<PageRouteInfo>? children,
  }) : super(
          PendudukListRoute.name,
          args: PendudukListRouteArgs(
            key: key,
            idKelompok: idKelompok,
            idKelurahan: idKelurahan,
          ),
          initialChildren: children,
        );

  static const String name = 'PendudukListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PendudukListRouteArgs>();
      return PendudukListScreen(
        key: args.key,
        idKelompok: args.idKelompok,
        idKelurahan: args.idKelurahan,
      );
    },
  );
}

class PendudukListRouteArgs {
  const PendudukListRouteArgs({
    this.key,
    required this.idKelompok,
    required this.idKelurahan,
  });

  final Key? key;

  final int? idKelompok;

  final int? idKelurahan;

  @override
  String toString() {
    return 'PendudukListRouteArgs{key: $key, idKelompok: $idKelompok, idKelurahan: $idKelurahan}';
  }
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
