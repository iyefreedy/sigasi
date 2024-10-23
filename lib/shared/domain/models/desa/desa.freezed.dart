// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'desa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Desa _$DesaFromJson(Map<String, dynamic> json) {
  return _Desa.fromJson(json);
}

/// @nodoc
mixin _$Desa {
  int? get idKelurahan => throw _privateConstructorUsedError;
  int? get idKecamatan => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;

  /// Serializes this Desa to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Desa
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DesaCopyWith<Desa> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesaCopyWith<$Res> {
  factory $DesaCopyWith(Desa value, $Res Function(Desa) then) =
      _$DesaCopyWithImpl<$Res, Desa>;
  @useResult
  $Res call({int? idKelurahan, int? idKecamatan, String? nama});
}

/// @nodoc
class _$DesaCopyWithImpl<$Res, $Val extends Desa>
    implements $DesaCopyWith<$Res> {
  _$DesaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Desa
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKelurahan = freezed,
    Object? idKecamatan = freezed,
    Object? nama = freezed,
  }) {
    return _then(_value.copyWith(
      idKelurahan: freezed == idKelurahan
          ? _value.idKelurahan
          : idKelurahan // ignore: cast_nullable_to_non_nullable
              as int?,
      idKecamatan: freezed == idKecamatan
          ? _value.idKecamatan
          : idKecamatan // ignore: cast_nullable_to_non_nullable
              as int?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DesaImplCopyWith<$Res> implements $DesaCopyWith<$Res> {
  factory _$$DesaImplCopyWith(
          _$DesaImpl value, $Res Function(_$DesaImpl) then) =
      __$$DesaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idKelurahan, int? idKecamatan, String? nama});
}

/// @nodoc
class __$$DesaImplCopyWithImpl<$Res>
    extends _$DesaCopyWithImpl<$Res, _$DesaImpl>
    implements _$$DesaImplCopyWith<$Res> {
  __$$DesaImplCopyWithImpl(_$DesaImpl _value, $Res Function(_$DesaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Desa
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKelurahan = freezed,
    Object? idKecamatan = freezed,
    Object? nama = freezed,
  }) {
    return _then(_$DesaImpl(
      idKelurahan: freezed == idKelurahan
          ? _value.idKelurahan
          : idKelurahan // ignore: cast_nullable_to_non_nullable
              as int?,
      idKecamatan: freezed == idKecamatan
          ? _value.idKecamatan
          : idKecamatan // ignore: cast_nullable_to_non_nullable
              as int?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DesaImpl implements _Desa {
  const _$DesaImpl({this.idKelurahan, this.idKecamatan, this.nama});

  factory _$DesaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DesaImplFromJson(json);

  @override
  final int? idKelurahan;
  @override
  final int? idKecamatan;
  @override
  final String? nama;

  @override
  String toString() {
    return 'Desa(idKelurahan: $idKelurahan, idKecamatan: $idKecamatan, nama: $nama)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesaImpl &&
            (identical(other.idKelurahan, idKelurahan) ||
                other.idKelurahan == idKelurahan) &&
            (identical(other.idKecamatan, idKecamatan) ||
                other.idKecamatan == idKecamatan) &&
            (identical(other.nama, nama) || other.nama == nama));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idKelurahan, idKecamatan, nama);

  /// Create a copy of Desa
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DesaImplCopyWith<_$DesaImpl> get copyWith =>
      __$$DesaImplCopyWithImpl<_$DesaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DesaImplToJson(
      this,
    );
  }
}

abstract class _Desa implements Desa {
  const factory _Desa(
      {final int? idKelurahan,
      final int? idKecamatan,
      final String? nama}) = _$DesaImpl;

  factory _Desa.fromJson(Map<String, dynamic> json) = _$DesaImpl.fromJson;

  @override
  int? get idKelurahan;
  @override
  int? get idKecamatan;
  @override
  String? get nama;

  /// Create a copy of Desa
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DesaImplCopyWith<_$DesaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
