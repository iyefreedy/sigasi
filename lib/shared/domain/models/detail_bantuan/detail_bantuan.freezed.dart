// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_bantuan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailBantuan _$DetailBantuanFromJson(Map<String, dynamic> json) {
  return _DetailBantuan.fromJson(json);
}

/// @nodoc
mixin _$DetailBantuan {
  int? get idBantuanDtl => throw _privateConstructorUsedError;
  int? get idBarang => throw _privateConstructorUsedError;
  int? get idBantuan => throw _privateConstructorUsedError;
  int? get jumlah => throw _privateConstructorUsedError;

  /// Serializes this DetailBantuan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailBantuan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailBantuanCopyWith<DetailBantuan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailBantuanCopyWith<$Res> {
  factory $DetailBantuanCopyWith(
          DetailBantuan value, $Res Function(DetailBantuan) then) =
      _$DetailBantuanCopyWithImpl<$Res, DetailBantuan>;
  @useResult
  $Res call({int? idBantuanDtl, int? idBarang, int? idBantuan, int? jumlah});
}

/// @nodoc
class _$DetailBantuanCopyWithImpl<$Res, $Val extends DetailBantuan>
    implements $DetailBantuanCopyWith<$Res> {
  _$DetailBantuanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailBantuan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBantuanDtl = freezed,
    Object? idBarang = freezed,
    Object? idBantuan = freezed,
    Object? jumlah = freezed,
  }) {
    return _then(_value.copyWith(
      idBantuanDtl: freezed == idBantuanDtl
          ? _value.idBantuanDtl
          : idBantuanDtl // ignore: cast_nullable_to_non_nullable
              as int?,
      idBarang: freezed == idBarang
          ? _value.idBarang
          : idBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      idBantuan: freezed == idBantuan
          ? _value.idBantuan
          : idBantuan // ignore: cast_nullable_to_non_nullable
              as int?,
      jumlah: freezed == jumlah
          ? _value.jumlah
          : jumlah // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailBantuanImplCopyWith<$Res>
    implements $DetailBantuanCopyWith<$Res> {
  factory _$$DetailBantuanImplCopyWith(
          _$DetailBantuanImpl value, $Res Function(_$DetailBantuanImpl) then) =
      __$$DetailBantuanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idBantuanDtl, int? idBarang, int? idBantuan, int? jumlah});
}

/// @nodoc
class __$$DetailBantuanImplCopyWithImpl<$Res>
    extends _$DetailBantuanCopyWithImpl<$Res, _$DetailBantuanImpl>
    implements _$$DetailBantuanImplCopyWith<$Res> {
  __$$DetailBantuanImplCopyWithImpl(
      _$DetailBantuanImpl _value, $Res Function(_$DetailBantuanImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailBantuan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBantuanDtl = freezed,
    Object? idBarang = freezed,
    Object? idBantuan = freezed,
    Object? jumlah = freezed,
  }) {
    return _then(_$DetailBantuanImpl(
      idBantuanDtl: freezed == idBantuanDtl
          ? _value.idBantuanDtl
          : idBantuanDtl // ignore: cast_nullable_to_non_nullable
              as int?,
      idBarang: freezed == idBarang
          ? _value.idBarang
          : idBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      idBantuan: freezed == idBantuan
          ? _value.idBantuan
          : idBantuan // ignore: cast_nullable_to_non_nullable
              as int?,
      jumlah: freezed == jumlah
          ? _value.jumlah
          : jumlah // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailBantuanImpl implements _DetailBantuan {
  const _$DetailBantuanImpl(
      {this.idBantuanDtl, this.idBarang, this.idBantuan, this.jumlah});

  factory _$DetailBantuanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailBantuanImplFromJson(json);

  @override
  final int? idBantuanDtl;
  @override
  final int? idBarang;
  @override
  final int? idBantuan;
  @override
  final int? jumlah;

  @override
  String toString() {
    return 'DetailBantuan(idBantuanDtl: $idBantuanDtl, idBarang: $idBarang, idBantuan: $idBantuan, jumlah: $jumlah)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailBantuanImpl &&
            (identical(other.idBantuanDtl, idBantuanDtl) ||
                other.idBantuanDtl == idBantuanDtl) &&
            (identical(other.idBarang, idBarang) ||
                other.idBarang == idBarang) &&
            (identical(other.idBantuan, idBantuan) ||
                other.idBantuan == idBantuan) &&
            (identical(other.jumlah, jumlah) || other.jumlah == jumlah));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idBantuanDtl, idBarang, idBantuan, jumlah);

  /// Create a copy of DetailBantuan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailBantuanImplCopyWith<_$DetailBantuanImpl> get copyWith =>
      __$$DetailBantuanImplCopyWithImpl<_$DetailBantuanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailBantuanImplToJson(
      this,
    );
  }
}

abstract class _DetailBantuan implements DetailBantuan {
  const factory _DetailBantuan(
      {final int? idBantuanDtl,
      final int? idBarang,
      final int? idBantuan,
      final int? jumlah}) = _$DetailBantuanImpl;

  factory _DetailBantuan.fromJson(Map<String, dynamic> json) =
      _$DetailBantuanImpl.fromJson;

  @override
  int? get idBantuanDtl;
  @override
  int? get idBarang;
  @override
  int? get idBantuan;
  @override
  int? get jumlah;

  /// Create a copy of DetailBantuan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailBantuanImplCopyWith<_$DetailBantuanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
