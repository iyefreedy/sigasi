// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bantuan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bantuan _$BantuanFromJson(Map<String, dynamic> json) {
  return _Bantuan.fromJson(json);
}

/// @nodoc
mixin _$Bantuan {
  int? get idBantuan => throw _privateConstructorUsedError;
  int? get idDonatur => throw _privateConstructorUsedError;
  DateTime? get tanggalBantuan => throw _privateConstructorUsedError;
  int? get lastUpdatedBy => throw _privateConstructorUsedError;
  DateTime? get lastUpdatedDate => throw _privateConstructorUsedError;
  List<DetailBantuan>? get listDetailBantuan =>
      throw _privateConstructorUsedError;

  /// Serializes this Bantuan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bantuan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BantuanCopyWith<Bantuan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BantuanCopyWith<$Res> {
  factory $BantuanCopyWith(Bantuan value, $Res Function(Bantuan) then) =
      _$BantuanCopyWithImpl<$Res, Bantuan>;
  @useResult
  $Res call(
      {int? idBantuan,
      int? idDonatur,
      DateTime? tanggalBantuan,
      int? lastUpdatedBy,
      DateTime? lastUpdatedDate,
      List<DetailBantuan>? listDetailBantuan});
}

/// @nodoc
class _$BantuanCopyWithImpl<$Res, $Val extends Bantuan>
    implements $BantuanCopyWith<$Res> {
  _$BantuanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bantuan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBantuan = freezed,
    Object? idDonatur = freezed,
    Object? tanggalBantuan = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? listDetailBantuan = freezed,
  }) {
    return _then(_value.copyWith(
      idBantuan: freezed == idBantuan
          ? _value.idBantuan
          : idBantuan // ignore: cast_nullable_to_non_nullable
              as int?,
      idDonatur: freezed == idDonatur
          ? _value.idDonatur
          : idDonatur // ignore: cast_nullable_to_non_nullable
              as int?,
      tanggalBantuan: freezed == tanggalBantuan
          ? _value.tanggalBantuan
          : tanggalBantuan // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      listDetailBantuan: freezed == listDetailBantuan
          ? _value.listDetailBantuan
          : listDetailBantuan // ignore: cast_nullable_to_non_nullable
              as List<DetailBantuan>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BantuanImplCopyWith<$Res> implements $BantuanCopyWith<$Res> {
  factory _$$BantuanImplCopyWith(
          _$BantuanImpl value, $Res Function(_$BantuanImpl) then) =
      __$$BantuanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idBantuan,
      int? idDonatur,
      DateTime? tanggalBantuan,
      int? lastUpdatedBy,
      DateTime? lastUpdatedDate,
      List<DetailBantuan>? listDetailBantuan});
}

/// @nodoc
class __$$BantuanImplCopyWithImpl<$Res>
    extends _$BantuanCopyWithImpl<$Res, _$BantuanImpl>
    implements _$$BantuanImplCopyWith<$Res> {
  __$$BantuanImplCopyWithImpl(
      _$BantuanImpl _value, $Res Function(_$BantuanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bantuan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBantuan = freezed,
    Object? idDonatur = freezed,
    Object? tanggalBantuan = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? listDetailBantuan = freezed,
  }) {
    return _then(_$BantuanImpl(
      idBantuan: freezed == idBantuan
          ? _value.idBantuan
          : idBantuan // ignore: cast_nullable_to_non_nullable
              as int?,
      idDonatur: freezed == idDonatur
          ? _value.idDonatur
          : idDonatur // ignore: cast_nullable_to_non_nullable
              as int?,
      tanggalBantuan: freezed == tanggalBantuan
          ? _value.tanggalBantuan
          : tanggalBantuan // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      listDetailBantuan: freezed == listDetailBantuan
          ? _value._listDetailBantuan
          : listDetailBantuan // ignore: cast_nullable_to_non_nullable
              as List<DetailBantuan>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BantuanImpl implements _Bantuan {
  const _$BantuanImpl(
      {this.idBantuan,
      this.idDonatur,
      this.tanggalBantuan,
      this.lastUpdatedBy,
      this.lastUpdatedDate,
      final List<DetailBantuan>? listDetailBantuan})
      : _listDetailBantuan = listDetailBantuan;

  factory _$BantuanImpl.fromJson(Map<String, dynamic> json) =>
      _$$BantuanImplFromJson(json);

  @override
  final int? idBantuan;
  @override
  final int? idDonatur;
  @override
  final DateTime? tanggalBantuan;
  @override
  final int? lastUpdatedBy;
  @override
  final DateTime? lastUpdatedDate;
  final List<DetailBantuan>? _listDetailBantuan;
  @override
  List<DetailBantuan>? get listDetailBantuan {
    final value = _listDetailBantuan;
    if (value == null) return null;
    if (_listDetailBantuan is EqualUnmodifiableListView)
      return _listDetailBantuan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Bantuan(idBantuan: $idBantuan, idDonatur: $idDonatur, tanggalBantuan: $tanggalBantuan, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, listDetailBantuan: $listDetailBantuan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BantuanImpl &&
            (identical(other.idBantuan, idBantuan) ||
                other.idBantuan == idBantuan) &&
            (identical(other.idDonatur, idDonatur) ||
                other.idDonatur == idDonatur) &&
            (identical(other.tanggalBantuan, tanggalBantuan) ||
                other.tanggalBantuan == tanggalBantuan) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
            const DeepCollectionEquality()
                .equals(other._listDetailBantuan, _listDetailBantuan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idBantuan,
      idDonatur,
      tanggalBantuan,
      lastUpdatedBy,
      lastUpdatedDate,
      const DeepCollectionEquality().hash(_listDetailBantuan));

  /// Create a copy of Bantuan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BantuanImplCopyWith<_$BantuanImpl> get copyWith =>
      __$$BantuanImplCopyWithImpl<_$BantuanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BantuanImplToJson(
      this,
    );
  }
}

abstract class _Bantuan implements Bantuan {
  const factory _Bantuan(
      {final int? idBantuan,
      final int? idDonatur,
      final DateTime? tanggalBantuan,
      final int? lastUpdatedBy,
      final DateTime? lastUpdatedDate,
      final List<DetailBantuan>? listDetailBantuan}) = _$BantuanImpl;

  factory _Bantuan.fromJson(Map<String, dynamic> json) = _$BantuanImpl.fromJson;

  @override
  int? get idBantuan;
  @override
  int? get idDonatur;
  @override
  DateTime? get tanggalBantuan;
  @override
  int? get lastUpdatedBy;
  @override
  DateTime? get lastUpdatedDate;
  @override
  List<DetailBantuan>? get listDetailBantuan;

  /// Create a copy of Bantuan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BantuanImplCopyWith<_$BantuanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
