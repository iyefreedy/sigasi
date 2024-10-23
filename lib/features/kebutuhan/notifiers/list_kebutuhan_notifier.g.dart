// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_kebutuhan_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listKebutuhanNotifierHash() =>
    r'14de8f3746825db03f87c31a319a68d0512ad193';

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

abstract class _$ListKebutuhanNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Kebutuhan>> {
  late final int? idPosko;

  FutureOr<List<Kebutuhan>> build({
    int? idPosko,
  });
}

/// See also [ListKebutuhanNotifier].
@ProviderFor(ListKebutuhanNotifier)
const listKebutuhanNotifierProvider = ListKebutuhanNotifierFamily();

/// See also [ListKebutuhanNotifier].
class ListKebutuhanNotifierFamily extends Family<AsyncValue<List<Kebutuhan>>> {
  /// See also [ListKebutuhanNotifier].
  const ListKebutuhanNotifierFamily();

  /// See also [ListKebutuhanNotifier].
  ListKebutuhanNotifierProvider call({
    int? idPosko,
  }) {
    return ListKebutuhanNotifierProvider(
      idPosko: idPosko,
    );
  }

  @override
  ListKebutuhanNotifierProvider getProviderOverride(
    covariant ListKebutuhanNotifierProvider provider,
  ) {
    return call(
      idPosko: provider.idPosko,
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
  String? get name => r'listKebutuhanNotifierProvider';
}

/// See also [ListKebutuhanNotifier].
class ListKebutuhanNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ListKebutuhanNotifier,
        List<Kebutuhan>> {
  /// See also [ListKebutuhanNotifier].
  ListKebutuhanNotifierProvider({
    int? idPosko,
  }) : this._internal(
          () => ListKebutuhanNotifier()..idPosko = idPosko,
          from: listKebutuhanNotifierProvider,
          name: r'listKebutuhanNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listKebutuhanNotifierHash,
          dependencies: ListKebutuhanNotifierFamily._dependencies,
          allTransitiveDependencies:
              ListKebutuhanNotifierFamily._allTransitiveDependencies,
          idPosko: idPosko,
        );

  ListKebutuhanNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idPosko,
  }) : super.internal();

  final int? idPosko;

  @override
  FutureOr<List<Kebutuhan>> runNotifierBuild(
    covariant ListKebutuhanNotifier notifier,
  ) {
    return notifier.build(
      idPosko: idPosko,
    );
  }

  @override
  Override overrideWith(ListKebutuhanNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListKebutuhanNotifierProvider._internal(
        () => create()..idPosko = idPosko,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idPosko: idPosko,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ListKebutuhanNotifier,
      List<Kebutuhan>> createElement() {
    return _ListKebutuhanNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListKebutuhanNotifierProvider && other.idPosko == idPosko;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idPosko.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListKebutuhanNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Kebutuhan>> {
  /// The parameter `idPosko` of this provider.
  int? get idPosko;
}

class _ListKebutuhanNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListKebutuhanNotifier,
        List<Kebutuhan>> with ListKebutuhanNotifierRef {
  _ListKebutuhanNotifierProviderElement(super.provider);

  @override
  int? get idPosko => (origin as ListKebutuhanNotifierProvider).idPosko;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
