// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengungsi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pengungsi _$PengungsiFromJson(Map<String, dynamic> json) {
  return _Pengungsi.fromJson(json);
}

/// @nodoc
mixin _$Pengungsi {
  int? get idPengungsi => throw _privateConstructorUsedError;
  int? get idPenduduk => throw _privateConstructorUsedError;
  int? get idPosko => throw _privateConstructorUsedError;
  String? get kondisiKhusus => throw _privateConstructorUsedError;
  int? get lastUpdatedBy => throw _privateConstructorUsedError;
  DateTime? get lastUpdatedDate => throw _privateConstructorUsedError;
  Penduduk? get penduduk => throw _privateConstructorUsedError;
  Posko? get posko => throw _privateConstructorUsedError;

  /// Serializes this Pengungsi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PengungsiCopyWith<Pengungsi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PengungsiCopyWith<$Res> {
  factory $PengungsiCopyWith(Pengungsi value, $Res Function(Pengungsi) then) =
      _$PengungsiCopyWithImpl<$Res, Pengungsi>;
  @useResult
  $Res call(
      {int? idPengungsi,
      int? idPenduduk,
      int? idPosko,
      String? kondisiKhusus,
      int? lastUpdatedBy,
      DateTime? lastUpdatedDate,
      Penduduk? penduduk,
      Posko? posko});

  $PendudukCopyWith<$Res>? get penduduk;
  $PoskoCopyWith<$Res>? get posko;
}

/// @nodoc
class _$PengungsiCopyWithImpl<$Res, $Val extends Pengungsi>
    implements $PengungsiCopyWith<$Res> {
  _$PengungsiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPengungsi = freezed,
    Object? idPenduduk = freezed,
    Object? idPosko = freezed,
    Object? kondisiKhusus = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? penduduk = freezed,
    Object? posko = freezed,
  }) {
    return _then(_value.copyWith(
      idPengungsi: freezed == idPengungsi
          ? _value.idPengungsi
          : idPengungsi // ignore: cast_nullable_to_non_nullable
              as int?,
      idPenduduk: freezed == idPenduduk
          ? _value.idPenduduk
          : idPenduduk // ignore: cast_nullable_to_non_nullable
              as int?,
      idPosko: freezed == idPosko
          ? _value.idPosko
          : idPosko // ignore: cast_nullable_to_non_nullable
              as int?,
      kondisiKhusus: freezed == kondisiKhusus
          ? _value.kondisiKhusus
          : kondisiKhusus // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      penduduk: freezed == penduduk
          ? _value.penduduk
          : penduduk // ignore: cast_nullable_to_non_nullable
              as Penduduk?,
      posko: freezed == posko
          ? _value.posko
          : posko // ignore: cast_nullable_to_non_nullable
              as Posko?,
    ) as $Val);
  }

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PendudukCopyWith<$Res>? get penduduk {
    if (_value.penduduk == null) {
      return null;
    }

    return $PendudukCopyWith<$Res>(_value.penduduk!, (value) {
      return _then(_value.copyWith(penduduk: value) as $Val);
    });
  }

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PoskoCopyWith<$Res>? get posko {
    if (_value.posko == null) {
      return null;
    }

    return $PoskoCopyWith<$Res>(_value.posko!, (value) {
      return _then(_value.copyWith(posko: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PengungsiImplCopyWith<$Res>
    implements $PengungsiCopyWith<$Res> {
  factory _$$PengungsiImplCopyWith(
          _$PengungsiImpl value, $Res Function(_$PengungsiImpl) then) =
      __$$PengungsiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idPengungsi,
      int? idPenduduk,
      int? idPosko,
      String? kondisiKhusus,
      int? lastUpdatedBy,
      DateTime? lastUpdatedDate,
      Penduduk? penduduk,
      Posko? posko});

  @override
  $PendudukCopyWith<$Res>? get penduduk;
  @override
  $PoskoCopyWith<$Res>? get posko;
}

/// @nodoc
class __$$PengungsiImplCopyWithImpl<$Res>
    extends _$PengungsiCopyWithImpl<$Res, _$PengungsiImpl>
    implements _$$PengungsiImplCopyWith<$Res> {
  __$$PengungsiImplCopyWithImpl(
      _$PengungsiImpl _value, $Res Function(_$PengungsiImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPengungsi = freezed,
    Object? idPenduduk = freezed,
    Object? idPosko = freezed,
    Object? kondisiKhusus = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? penduduk = freezed,
    Object? posko = freezed,
  }) {
    return _then(_$PengungsiImpl(
      idPengungsi: freezed == idPengungsi
          ? _value.idPengungsi
          : idPengungsi // ignore: cast_nullable_to_non_nullable
              as int?,
      idPenduduk: freezed == idPenduduk
          ? _value.idPenduduk
          : idPenduduk // ignore: cast_nullable_to_non_nullable
              as int?,
      idPosko: freezed == idPosko
          ? _value.idPosko
          : idPosko // ignore: cast_nullable_to_non_nullable
              as int?,
      kondisiKhusus: freezed == kondisiKhusus
          ? _value.kondisiKhusus
          : kondisiKhusus // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      penduduk: freezed == penduduk
          ? _value.penduduk
          : penduduk // ignore: cast_nullable_to_non_nullable
              as Penduduk?,
      posko: freezed == posko
          ? _value.posko
          : posko // ignore: cast_nullable_to_non_nullable
              as Posko?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PengungsiImpl implements _Pengungsi {
  const _$PengungsiImpl(
      {this.idPengungsi,
      this.idPenduduk,
      this.idPosko,
      this.kondisiKhusus,
      this.lastUpdatedBy,
      this.lastUpdatedDate,
      this.penduduk,
      this.posko});

  factory _$PengungsiImpl.fromJson(Map<String, dynamic> json) =>
      _$$PengungsiImplFromJson(json);

  @override
  final int? idPengungsi;
  @override
  final int? idPenduduk;
  @override
  final int? idPosko;
  @override
  final String? kondisiKhusus;
  @override
  final int? lastUpdatedBy;
  @override
  final DateTime? lastUpdatedDate;
  @override
  final Penduduk? penduduk;
  @override
  final Posko? posko;

  @override
  String toString() {
    return 'Pengungsi(idPengungsi: $idPengungsi, idPenduduk: $idPenduduk, idPosko: $idPosko, kondisiKhusus: $kondisiKhusus, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, penduduk: $penduduk, posko: $posko)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PengungsiImpl &&
            (identical(other.idPengungsi, idPengungsi) ||
                other.idPengungsi == idPengungsi) &&
            (identical(other.idPenduduk, idPenduduk) ||
                other.idPenduduk == idPenduduk) &&
            (identical(other.idPosko, idPosko) || other.idPosko == idPosko) &&
            (identical(other.kondisiKhusus, kondisiKhusus) ||
                other.kondisiKhusus == kondisiKhusus) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
            (identical(other.penduduk, penduduk) ||
                other.penduduk == penduduk) &&
            (identical(other.posko, posko) || other.posko == posko));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idPengungsi, idPenduduk, idPosko,
      kondisiKhusus, lastUpdatedBy, lastUpdatedDate, penduduk, posko);

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PengungsiImplCopyWith<_$PengungsiImpl> get copyWith =>
      __$$PengungsiImplCopyWithImpl<_$PengungsiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PengungsiImplToJson(
      this,
    );
  }
}

abstract class _Pengungsi implements Pengungsi {
  const factory _Pengungsi(
      {final int? idPengungsi,
      final int? idPenduduk,
      final int? idPosko,
      final String? kondisiKhusus,
      final int? lastUpdatedBy,
      final DateTime? lastUpdatedDate,
      final Penduduk? penduduk,
      final Posko? posko}) = _$PengungsiImpl;

  factory _Pengungsi.fromJson(Map<String, dynamic> json) =
      _$PengungsiImpl.fromJson;

  @override
  int? get idPengungsi;
  @override
  int? get idPenduduk;
  @override
  int? get idPosko;
  @override
  String? get kondisiKhusus;
  @override
  int? get lastUpdatedBy;
  @override
  DateTime? get lastUpdatedDate;
  @override
  Penduduk? get penduduk;
  @override
  Posko? get posko;

  /// Create a copy of Pengungsi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PengungsiImplCopyWith<_$PengungsiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
