// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kelompok.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Kelompok _$KelompokFromJson(Map<String, dynamic> json) {
  return _Kelompok.fromJson(json);
}

/// @nodoc
mixin _$Kelompok {
  int? get idKelompok => throw _privateConstructorUsedError;
  String? get namaKelompok => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;

  /// Serializes this Kelompok to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Kelompok
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KelompokCopyWith<Kelompok> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KelompokCopyWith<$Res> {
  factory $KelompokCopyWith(Kelompok value, $Res Function(Kelompok) then) =
      _$KelompokCopyWithImpl<$Res, Kelompok>;
  @useResult
  $Res call({int? idKelompok, String? namaKelompok, String? keterangan});
}

/// @nodoc
class _$KelompokCopyWithImpl<$Res, $Val extends Kelompok>
    implements $KelompokCopyWith<$Res> {
  _$KelompokCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Kelompok
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKelompok = freezed,
    Object? namaKelompok = freezed,
    Object? keterangan = freezed,
  }) {
    return _then(_value.copyWith(
      idKelompok: freezed == idKelompok
          ? _value.idKelompok
          : idKelompok // ignore: cast_nullable_to_non_nullable
              as int?,
      namaKelompok: freezed == namaKelompok
          ? _value.namaKelompok
          : namaKelompok // ignore: cast_nullable_to_non_nullable
              as String?,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KelompokImplCopyWith<$Res>
    implements $KelompokCopyWith<$Res> {
  factory _$$KelompokImplCopyWith(
          _$KelompokImpl value, $Res Function(_$KelompokImpl) then) =
      __$$KelompokImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idKelompok, String? namaKelompok, String? keterangan});
}

/// @nodoc
class __$$KelompokImplCopyWithImpl<$Res>
    extends _$KelompokCopyWithImpl<$Res, _$KelompokImpl>
    implements _$$KelompokImplCopyWith<$Res> {
  __$$KelompokImplCopyWithImpl(
      _$KelompokImpl _value, $Res Function(_$KelompokImpl) _then)
      : super(_value, _then);

  /// Create a copy of Kelompok
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKelompok = freezed,
    Object? namaKelompok = freezed,
    Object? keterangan = freezed,
  }) {
    return _then(_$KelompokImpl(
      idKelompok: freezed == idKelompok
          ? _value.idKelompok
          : idKelompok // ignore: cast_nullable_to_non_nullable
              as int?,
      namaKelompok: freezed == namaKelompok
          ? _value.namaKelompok
          : namaKelompok // ignore: cast_nullable_to_non_nullable
              as String?,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KelompokImpl implements _Kelompok {
  const _$KelompokImpl({this.idKelompok, this.namaKelompok, this.keterangan});

  factory _$KelompokImpl.fromJson(Map<String, dynamic> json) =>
      _$$KelompokImplFromJson(json);

  @override
  final int? idKelompok;
  @override
  final String? namaKelompok;
  @override
  final String? keterangan;

  @override
  String toString() {
    return 'Kelompok(idKelompok: $idKelompok, namaKelompok: $namaKelompok, keterangan: $keterangan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KelompokImpl &&
            (identical(other.idKelompok, idKelompok) ||
                other.idKelompok == idKelompok) &&
            (identical(other.namaKelompok, namaKelompok) ||
                other.namaKelompok == namaKelompok) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idKelompok, namaKelompok, keterangan);

  /// Create a copy of Kelompok
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KelompokImplCopyWith<_$KelompokImpl> get copyWith =>
      __$$KelompokImplCopyWithImpl<_$KelompokImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KelompokImplToJson(
      this,
    );
  }
}

abstract class _Kelompok implements Kelompok {
  const factory _Kelompok(
      {final int? idKelompok,
      final String? namaKelompok,
      final String? keterangan}) = _$KelompokImpl;

  factory _Kelompok.fromJson(Map<String, dynamic> json) =
      _$KelompokImpl.fromJson;

  @override
  int? get idKelompok;
  @override
  String? get namaKelompok;
  @override
  String? get keterangan;

  /// Create a copy of Kelompok
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KelompokImplCopyWith<_$KelompokImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
