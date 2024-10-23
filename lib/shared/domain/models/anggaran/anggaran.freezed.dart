// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anggaran.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Anggaran _$AnggaranFromJson(Map<String, dynamic> json) {
  return _Anggaran.fromJson(json);
}

/// @nodoc
mixin _$Anggaran {
  int? get idAnggaran => throw _privateConstructorUsedError;

  /// Serializes this Anggaran to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Anggaran
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnggaranCopyWith<Anggaran> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnggaranCopyWith<$Res> {
  factory $AnggaranCopyWith(Anggaran value, $Res Function(Anggaran) then) =
      _$AnggaranCopyWithImpl<$Res, Anggaran>;
  @useResult
  $Res call({int? idAnggaran});
}

/// @nodoc
class _$AnggaranCopyWithImpl<$Res, $Val extends Anggaran>
    implements $AnggaranCopyWith<$Res> {
  _$AnggaranCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Anggaran
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idAnggaran = freezed,
  }) {
    return _then(_value.copyWith(
      idAnggaran: freezed == idAnggaran
          ? _value.idAnggaran
          : idAnggaran // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnggaranImplCopyWith<$Res>
    implements $AnggaranCopyWith<$Res> {
  factory _$$AnggaranImplCopyWith(
          _$AnggaranImpl value, $Res Function(_$AnggaranImpl) then) =
      __$$AnggaranImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idAnggaran});
}

/// @nodoc
class __$$AnggaranImplCopyWithImpl<$Res>
    extends _$AnggaranCopyWithImpl<$Res, _$AnggaranImpl>
    implements _$$AnggaranImplCopyWith<$Res> {
  __$$AnggaranImplCopyWithImpl(
      _$AnggaranImpl _value, $Res Function(_$AnggaranImpl) _then)
      : super(_value, _then);

  /// Create a copy of Anggaran
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idAnggaran = freezed,
  }) {
    return _then(_$AnggaranImpl(
      idAnggaran: freezed == idAnggaran
          ? _value.idAnggaran
          : idAnggaran // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnggaranImpl implements _Anggaran {
  const _$AnggaranImpl({this.idAnggaran});

  factory _$AnggaranImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnggaranImplFromJson(json);

  @override
  final int? idAnggaran;

  @override
  String toString() {
    return 'Anggaran(idAnggaran: $idAnggaran)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnggaranImpl &&
            (identical(other.idAnggaran, idAnggaran) ||
                other.idAnggaran == idAnggaran));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idAnggaran);

  /// Create a copy of Anggaran
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnggaranImplCopyWith<_$AnggaranImpl> get copyWith =>
      __$$AnggaranImplCopyWithImpl<_$AnggaranImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnggaranImplToJson(
      this,
    );
  }
}

abstract class _Anggaran implements Anggaran {
  const factory _Anggaran({final int? idAnggaran}) = _$AnggaranImpl;

  factory _Anggaran.fromJson(Map<String, dynamic> json) =
      _$AnggaranImpl.fromJson;

  @override
  int? get idAnggaran;

  /// Create a copy of Anggaran
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnggaranImplCopyWith<_$AnggaranImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
