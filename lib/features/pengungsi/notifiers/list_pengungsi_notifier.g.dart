// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pengungsi_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listPengungsiNotifierHash() =>
    r'88e9a17467c2724e755790d8c03e9946a2c4c7aa';

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

abstract class _$ListPengungsiNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Pengungsi>> {
  late final int? idPosko;
  late final int? idKelompok;

  FutureOr<List<Pengungsi>> build({
    int? idPosko,
    int? idKelompok,
  });
}

/// See also [ListPengungsiNotifier].
@ProviderFor(ListPengungsiNotifier)
const listPengungsiNotifierProvider = ListPengungsiNotifierFamily();

/// See also [ListPengungsiNotifier].
class ListPengungsiNotifierFamily extends Family<AsyncValue<List<Pengungsi>>> {
  /// See also [ListPengungsiNotifier].
  const ListPengungsiNotifierFamily();

  /// See also [ListPengungsiNotifier].
  ListPengungsiNotifierProvider call({
    int? idPosko,
    int? idKelompok,
  }) {
    return ListPengungsiNotifierProvider(
      idPosko: idPosko,
      idKelompok: idKelompok,
    );
  }

  @override
  ListPengungsiNotifierProvider getProviderOverride(
    covariant ListPengungsiNotifierProvider provider,
  ) {
    return call(
      idPosko: provider.idPosko,
      idKelompok: provider.idKelompok,
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
  String? get name => r'listPengungsiNotifierProvider';
}

/// See also [ListPengungsiNotifier].
class ListPengungsiNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ListPengungsiNotifier,
        List<Pengungsi>> {
  /// See also [ListPengungsiNotifier].
  ListPengungsiNotifierProvider({
    int? idPosko,
    int? idKelompok,
  }) : this._internal(
          () => ListPengungsiNotifier()
            ..idPosko = idPosko
            ..idKelompok = idKelompok,
          from: listPengungsiNotifierProvider,
          name: r'listPengungsiNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listPengungsiNotifierHash,
          dependencies: ListPengungsiNotifierFamily._dependencies,
          allTransitiveDependencies:
              ListPengungsiNotifierFamily._allTransitiveDependencies,
          idPosko: idPosko,
          idKelompok: idKelompok,
        );

  ListPengungsiNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idPosko,
    required this.idKelompok,
  }) : super.internal();

  final int? idPosko;
  final int? idKelompok;

  @override
  FutureOr<List<Pengungsi>> runNotifierBuild(
    covariant ListPengungsiNotifier notifier,
  ) {
    return notifier.build(
      idPosko: idPosko,
      idKelompok: idKelompok,
    );
  }

  @override
  Override overrideWith(ListPengungsiNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListPengungsiNotifierProvider._internal(
        () => create()
          ..idPosko = idPosko
          ..idKelompok = idKelompok,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idPosko: idPosko,
        idKelompok: idKelompok,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ListPengungsiNotifier,
      List<Pengungsi>> createElement() {
    return _ListPengungsiNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListPengungsiNotifierProvider &&
        other.idPosko == idPosko &&
        other.idKelompok == idKelompok;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idPosko.hashCode);
    hash = _SystemHash.combine(hash, idKelompok.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListPengungsiNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Pengungsi>> {
  /// The parameter `idPosko` of this provider.
  int? get idPosko;

  /// The parameter `idKelompok` of this provider.
  int? get idKelompok;
}

class _ListPengungsiNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListPengungsiNotifier,
        List<Pengungsi>> with ListPengungsiNotifierRef {
  _ListPengungsiNotifierProviderElement(super.provider);

  @override
  int? get idPosko => (origin as ListPengungsiNotifierProvider).idPosko;
  @override
  int? get idKelompok => (origin as ListPengungsiNotifierProvider).idKelompok;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
