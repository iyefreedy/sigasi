// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penduduk_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pendudukListNotifierHash() =>
    r'6b55c02f52b581e1433771d139eca861ac82b9de';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PendudukListNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Penduduk>> {
  late final int? idKelompok;
  late final int? idKelurahan;

  FutureOr<List<Penduduk>> build({
    int? idKelompok,
    int? idKelurahan,
  });
}

/// See also [PendudukListNotifier].
@ProviderFor(PendudukListNotifier)
const pendudukListNotifierProvider = PendudukListNotifierFamily();

/// See also [PendudukListNotifier].
class PendudukListNotifierFamily extends Family<AsyncValue<List<Penduduk>>> {
  /// See also [PendudukListNotifier].
  const PendudukListNotifierFamily();

  /// See also [PendudukListNotifier].
  PendudukListNotifierProvider call({
    int? idKelompok,
    int? idKelurahan,
  }) {
    return PendudukListNotifierProvider(
      idKelompok: idKelompok,
      idKelurahan: idKelurahan,
    );
  }

  @override
  PendudukListNotifierProvider getProviderOverride(
    covariant PendudukListNotifierProvider provider,
  ) {
    return call(
      idKelompok: provider.idKelompok,
      idKelurahan: provider.idKelurahan,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pendudukListNotifierProvider';
}

/// See also [PendudukListNotifier].
class PendudukListNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PendudukListNotifier, List<Penduduk>> {
  /// See also [PendudukListNotifier].
  PendudukListNotifierProvider({
    int? idKelompok,
    int? idKelurahan,
  }) : this._internal(
          () => PendudukListNotifier()
            ..idKelompok = idKelompok
            ..idKelurahan = idKelurahan,
          from: pendudukListNotifierProvider,
          name: r'pendudukListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pendudukListNotifierHash,
          dependencies: PendudukListNotifierFamily._dependencies,
          allTransitiveDependencies:
              PendudukListNotifierFamily._allTransitiveDependencies,
          idKelompok: idKelompok,
          idKelurahan: idKelurahan,
        );

  PendudukListNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idKelompok,
    required this.idKelurahan,
  }) : super.internal();

  final int? idKelompok;
  final int? idKelurahan;

  @override
  FutureOr<List<Penduduk>> runNotifierBuild(
    covariant PendudukListNotifier notifier,
  ) {
    return notifier.build(
      idKelompok: idKelompok,
      idKelurahan: idKelurahan,
    );
  }

  @override
  Override overrideWith(PendudukListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PendudukListNotifierProvider._internal(
        () => create()
          ..idKelompok = idKelompok
          ..idKelurahan = idKelurahan,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idKelompok: idKelompok,
        idKelurahan: idKelurahan,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PendudukListNotifier, List<Penduduk>>
      createElement() {
    return _PendudukListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PendudukListNotifierProvider &&
        other.idKelompok == idKelompok &&
        other.idKelurahan == idKelurahan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idKelompok.hashCode);
    hash = _SystemHash.combine(hash, idKelurahan.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PendudukListNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Penduduk>> {
  /// The parameter `idKelompok` of this provider.
  int? get idKelompok;

  /// The parameter `idKelurahan` of this provider.
  int? get idKelurahan;
}

class _PendudukListNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PendudukListNotifier,
        List<Penduduk>> with PendudukListNotifierRef {
  _PendudukListNotifierProviderElement(super.provider);

  @override
  int? get idKelompok => (origin as PendudukListNotifierProvider).idKelompok;
  @override
  int? get idKelurahan => (origin as PendudukListNotifierProvider).idKelurahan;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
