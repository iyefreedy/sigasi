// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distribusi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Distribusi _$DistribusiFromJson(Map<String, dynamic> json) {
  return _Distribusi.fromJson(json);
}

/// @nodoc
mixin _$Distribusi {
  int? get idDistribusi => throw _privateConstructorUsedError;

  /// Serializes this Distribusi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Distribusi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistribusiCopyWith<Distribusi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistribusiCopyWith<$Res> {
  factory $DistribusiCopyWith(
          Distribusi value, $Res Function(Distribusi) then) =
      _$DistribusiCopyWithImpl<$Res, Distribusi>;
  @useResult
  $Res call({int? idDistribusi});
}

/// @nodoc
class _$DistribusiCopyWithImpl<$Res, $Val extends Distribusi>
    implements $DistribusiCopyWith<$Res> {
  _$DistribusiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Distribusi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDistribusi = freezed,
  }) {
    return _then(_value.copyWith(
      idDistribusi: freezed == idDistribusi
          ? _value.idDistribusi
          : idDistribusi // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistribusiImplCopyWith<$Res>
    implements $DistribusiCopyWith<$Res> {
  factory _$$DistribusiImplCopyWith(
          _$DistribusiImpl value, $Res Function(_$DistribusiImpl) then) =
      __$$DistribusiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idDistribusi});
}

/// @nodoc
class __$$DistribusiImplCopyWithImpl<$Res>
    extends _$DistribusiCopyWithImpl<$Res, _$DistribusiImpl>
    implements _$$DistribusiImplCopyWith<$Res> {
  __$$DistribusiImplCopyWithImpl(
      _$DistribusiImpl _value, $Res Function(_$DistribusiImpl) _then)
      : super(_value, _then);

  /// Create a copy of Distribusi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDistribusi = freezed,
  }) {
    return _then(_$DistribusiImpl(
      idDistribusi: freezed == idDistribusi
          ? _value.idDistribusi
          : idDistribusi // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistribusiImpl implements _Distribusi {
  const _$DistribusiImpl({this.idDistribusi});

  factory _$DistribusiImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistribusiImplFromJson(json);

  @override
  final int? idDistribusi;

  @override
  String toString() {
    return 'Distribusi(idDistribusi: $idDistribusi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistribusiImpl &&
            (identical(other.idDistribusi, idDistribusi) ||
                other.idDistribusi == idDistribusi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idDistribusi);

  /// Create a copy of Distribusi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistribusiImplCopyWith<_$DistribusiImpl> get copyWith =>
      __$$DistribusiImplCopyWithImpl<_$DistribusiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistribusiImplToJson(
      this,
    );
  }
}

abstract class _Distribusi implements Distribusi {
  const factory _Distribusi({final int? idDistribusi}) = _$DistribusiImpl;

  factory _Distribusi.fromJson(Map<String, dynamic> json) =
      _$DistribusiImpl.fromJson;

  @override
  int? get idDistribusi;

  /// Create a copy of Distribusi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistribusiImplCopyWith<_$DistribusiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
