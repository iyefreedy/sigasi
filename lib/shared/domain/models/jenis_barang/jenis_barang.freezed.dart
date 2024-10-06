// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jenis_barang.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JenisBarang _$JenisBarangFromJson(Map<String, dynamic> json) {
  return _JenisBarang.fromJson(json);
}

/// @nodoc
mixin _$JenisBarang {
  int? get idJenisBarang => throw _privateConstructorUsedError;
  String? get jenisBarang => throw _privateConstructorUsedError;
  DateTime? get lastUpdatedDate => throw _privateConstructorUsedError;

  /// Serializes this JenisBarang to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JenisBarang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JenisBarangCopyWith<JenisBarang> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JenisBarangCopyWith<$Res> {
  factory $JenisBarangCopyWith(
          JenisBarang value, $Res Function(JenisBarang) then) =
      _$JenisBarangCopyWithImpl<$Res, JenisBarang>;
  @useResult
  $Res call(
      {int? idJenisBarang, String? jenisBarang, DateTime? lastUpdatedDate});
}

/// @nodoc
class _$JenisBarangCopyWithImpl<$Res, $Val extends JenisBarang>
    implements $JenisBarangCopyWith<$Res> {
  _$JenisBarangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JenisBarang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idJenisBarang = freezed,
    Object? jenisBarang = freezed,
    Object? lastUpdatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      idJenisBarang: freezed == idJenisBarang
          ? _value.idJenisBarang
          : idJenisBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      jenisBarang: freezed == jenisBarang
          ? _value.jenisBarang
          : jenisBarang // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JenisBarangImplCopyWith<$Res>
    implements $JenisBarangCopyWith<$Res> {
  factory _$$JenisBarangImplCopyWith(
          _$JenisBarangImpl value, $Res Function(_$JenisBarangImpl) then) =
      __$$JenisBarangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idJenisBarang, String? jenisBarang, DateTime? lastUpdatedDate});
}

/// @nodoc
class __$$JenisBarangImplCopyWithImpl<$Res>
    extends _$JenisBarangCopyWithImpl<$Res, _$JenisBarangImpl>
    implements _$$JenisBarangImplCopyWith<$Res> {
  __$$JenisBarangImplCopyWithImpl(
      _$JenisBarangImpl _value, $Res Function(_$JenisBarangImpl) _then)
      : super(_value, _then);

  /// Create a copy of JenisBarang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idJenisBarang = freezed,
    Object? jenisBarang = freezed,
    Object? lastUpdatedDate = freezed,
  }) {
    return _then(_$JenisBarangImpl(
      idJenisBarang: freezed == idJenisBarang
          ? _value.idJenisBarang
          : idJenisBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      jenisBarang: freezed == jenisBarang
          ? _value.jenisBarang
          : jenisBarang // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JenisBarangImpl implements _JenisBarang {
  const _$JenisBarangImpl(
      {this.idJenisBarang, this.jenisBarang, this.lastUpdatedDate});

  factory _$JenisBarangImpl.fromJson(Map<String, dynamic> json) =>
      _$$JenisBarangImplFromJson(json);

  @override
  final int? idJenisBarang;
  @override
  final String? jenisBarang;
  @override
  final DateTime? lastUpdatedDate;

  @override
  String toString() {
    return 'JenisBarang(idJenisBarang: $idJenisBarang, jenisBarang: $jenisBarang, lastUpdatedDate: $lastUpdatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JenisBarangImpl &&
            (identical(other.idJenisBarang, idJenisBarang) ||
                other.idJenisBarang == idJenisBarang) &&
            (identical(other.jenisBarang, jenisBarang) ||
                other.jenisBarang == jenisBarang) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idJenisBarang, jenisBarang, lastUpdatedDate);

  /// Create a copy of JenisBarang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JenisBarangImplCopyWith<_$JenisBarangImpl> get copyWith =>
      __$$JenisBarangImplCopyWithImpl<_$JenisBarangImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JenisBarangImplToJson(
      this,
    );
  }
}

abstract class _JenisBarang implements JenisBarang {
  const factory _JenisBarang(
      {final int? idJenisBarang,
      final String? jenisBarang,
      final DateTime? lastUpdatedDate}) = _$JenisBarangImpl;

  factory _JenisBarang.fromJson(Map<String, dynamic> json) =
      _$JenisBarangImpl.fromJson;

  @override
  int? get idJenisBarang;
  @override
  String? get jenisBarang;
  @override
  DateTime? get lastUpdatedDate;

  /// Create a copy of JenisBarang
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JenisBarangImplCopyWith<_$JenisBarangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
