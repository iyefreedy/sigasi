// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posko.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Posko _$PoskoFromJson(Map<String, dynamic> json) {
  return _Posko.fromJson(json);
}

/// @nodoc
mixin _$Posko {
  int? get idPosko => throw _privateConstructorUsedError;
  String? get ketua => throw _privateConstructorUsedError;
  String? get lokasi => throw _privateConstructorUsedError;
  String? get masalah => throw _privateConstructorUsedError;
  String? get solusiMasalah => throw _privateConstructorUsedError;

  /// Serializes this Posko to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Posko
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoskoCopyWith<Posko> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoskoCopyWith<$Res> {
  factory $PoskoCopyWith(Posko value, $Res Function(Posko) then) =
      _$PoskoCopyWithImpl<$Res, Posko>;
  @useResult
  $Res call(
      {int? idPosko,
      String? ketua,
      String? lokasi,
      String? masalah,
      String? solusiMasalah});
}

/// @nodoc
class _$PoskoCopyWithImpl<$Res, $Val extends Posko>
    implements $PoskoCopyWith<$Res> {
  _$PoskoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Posko
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPosko = freezed,
    Object? ketua = freezed,
    Object? lokasi = freezed,
    Object? masalah = freezed,
    Object? solusiMasalah = freezed,
  }) {
    return _then(_value.copyWith(
      idPosko: freezed == idPosko
          ? _value.idPosko
          : idPosko // ignore: cast_nullable_to_non_nullable
              as int?,
      ketua: freezed == ketua
          ? _value.ketua
          : ketua // ignore: cast_nullable_to_non_nullable
              as String?,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String?,
      masalah: freezed == masalah
          ? _value.masalah
          : masalah // ignore: cast_nullable_to_non_nullable
              as String?,
      solusiMasalah: freezed == solusiMasalah
          ? _value.solusiMasalah
          : solusiMasalah // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoskoImplCopyWith<$Res> implements $PoskoCopyWith<$Res> {
  factory _$$PoskoImplCopyWith(
          _$PoskoImpl value, $Res Function(_$PoskoImpl) then) =
      __$$PoskoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idPosko,
      String? ketua,
      String? lokasi,
      String? masalah,
      String? solusiMasalah});
}

/// @nodoc
class __$$PoskoImplCopyWithImpl<$Res>
    extends _$PoskoCopyWithImpl<$Res, _$PoskoImpl>
    implements _$$PoskoImplCopyWith<$Res> {
  __$$PoskoImplCopyWithImpl(
      _$PoskoImpl _value, $Res Function(_$PoskoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Posko
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPosko = freezed,
    Object? ketua = freezed,
    Object? lokasi = freezed,
    Object? masalah = freezed,
    Object? solusiMasalah = freezed,
  }) {
    return _then(_$PoskoImpl(
      idPosko: freezed == idPosko
          ? _value.idPosko
          : idPosko // ignore: cast_nullable_to_non_nullable
              as int?,
      ketua: freezed == ketua
          ? _value.ketua
          : ketua // ignore: cast_nullable_to_non_nullable
              as String?,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String?,
      masalah: freezed == masalah
          ? _value.masalah
          : masalah // ignore: cast_nullable_to_non_nullable
              as String?,
      solusiMasalah: freezed == solusiMasalah
          ? _value.solusiMasalah
          : solusiMasalah // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoskoImpl implements _Posko {
  const _$PoskoImpl(
      {this.idPosko,
      this.ketua,
      this.lokasi,
      this.masalah,
      this.solusiMasalah});

  factory _$PoskoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoskoImplFromJson(json);

  @override
  final int? idPosko;
  @override
  final String? ketua;
  @override
  final String? lokasi;
  @override
  final String? masalah;
  @override
  final String? solusiMasalah;

  @override
  String toString() {
    return 'Posko(idPosko: $idPosko, ketua: $ketua, lokasi: $lokasi, masalah: $masalah, solusiMasalah: $solusiMasalah)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoskoImpl &&
            (identical(other.idPosko, idPosko) || other.idPosko == idPosko) &&
            (identical(other.ketua, ketua) || other.ketua == ketua) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.masalah, masalah) || other.masalah == masalah) &&
            (identical(other.solusiMasalah, solusiMasalah) ||
                other.solusiMasalah == solusiMasalah));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idPosko, ketua, lokasi, masalah, solusiMasalah);

  /// Create a copy of Posko
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoskoImplCopyWith<_$PoskoImpl> get copyWith =>
      __$$PoskoImplCopyWithImpl<_$PoskoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoskoImplToJson(
      this,
    );
  }
}

abstract class _Posko implements Posko {
  const factory _Posko(
      {final int? idPosko,
      final String? ketua,
      final String? lokasi,
      final String? masalah,
      final String? solusiMasalah}) = _$PoskoImpl;

  factory _Posko.fromJson(Map<String, dynamic> json) = _$PoskoImpl.fromJson;

  @override
  int? get idPosko;
  @override
  String? get ketua;
  @override
  String? get lokasi;
  @override
  String? get masalah;
  @override
  String? get solusiMasalah;

  /// Create a copy of Posko
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoskoImplCopyWith<_$PoskoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
