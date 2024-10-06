// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barang.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Barang _$BarangFromJson(Map<String, dynamic> json) {
  return _Barang.fromJson(json);
}

/// @nodoc
mixin _$Barang {
  int? get idBarang => throw _privateConstructorUsedError;
  int? get idJenisBarang => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  double? get hargaSatuan => throw _privateConstructorUsedError;
  DateTime? get lastUpdatedDate => throw _privateConstructorUsedError;

  /// Serializes this Barang to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Barang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BarangCopyWith<Barang> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarangCopyWith<$Res> {
  factory $BarangCopyWith(Barang value, $Res Function(Barang) then) =
      _$BarangCopyWithImpl<$Res, Barang>;
  @useResult
  $Res call(
      {int? idBarang,
      int? idJenisBarang,
      String? nama,
      double? hargaSatuan,
      DateTime? lastUpdatedDate});
}

/// @nodoc
class _$BarangCopyWithImpl<$Res, $Val extends Barang>
    implements $BarangCopyWith<$Res> {
  _$BarangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Barang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBarang = freezed,
    Object? idJenisBarang = freezed,
    Object? nama = freezed,
    Object? hargaSatuan = freezed,
    Object? lastUpdatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      idBarang: freezed == idBarang
          ? _value.idBarang
          : idBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      idJenisBarang: freezed == idJenisBarang
          ? _value.idJenisBarang
          : idJenisBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      hargaSatuan: freezed == hargaSatuan
          ? _value.hargaSatuan
          : hargaSatuan // ignore: cast_nullable_to_non_nullable
              as double?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarangImplCopyWith<$Res> implements $BarangCopyWith<$Res> {
  factory _$$BarangImplCopyWith(
          _$BarangImpl value, $Res Function(_$BarangImpl) then) =
      __$$BarangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idBarang,
      int? idJenisBarang,
      String? nama,
      double? hargaSatuan,
      DateTime? lastUpdatedDate});
}

/// @nodoc
class __$$BarangImplCopyWithImpl<$Res>
    extends _$BarangCopyWithImpl<$Res, _$BarangImpl>
    implements _$$BarangImplCopyWith<$Res> {
  __$$BarangImplCopyWithImpl(
      _$BarangImpl _value, $Res Function(_$BarangImpl) _then)
      : super(_value, _then);

  /// Create a copy of Barang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBarang = freezed,
    Object? idJenisBarang = freezed,
    Object? nama = freezed,
    Object? hargaSatuan = freezed,
    Object? lastUpdatedDate = freezed,
  }) {
    return _then(_$BarangImpl(
      idBarang: freezed == idBarang
          ? _value.idBarang
          : idBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      idJenisBarang: freezed == idJenisBarang
          ? _value.idJenisBarang
          : idJenisBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      hargaSatuan: freezed == hargaSatuan
          ? _value.hargaSatuan
          : hargaSatuan // ignore: cast_nullable_to_non_nullable
              as double?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarangImpl implements _Barang {
  const _$BarangImpl(
      {this.idBarang,
      this.idJenisBarang,
      this.nama,
      this.hargaSatuan,
      this.lastUpdatedDate});

  factory _$BarangImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarangImplFromJson(json);

  @override
  final int? idBarang;
  @override
  final int? idJenisBarang;
  @override
  final String? nama;
  @override
  final double? hargaSatuan;
  @override
  final DateTime? lastUpdatedDate;

  @override
  String toString() {
    return 'Barang(idBarang: $idBarang, idJenisBarang: $idJenisBarang, nama: $nama, hargaSatuan: $hargaSatuan, lastUpdatedDate: $lastUpdatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarangImpl &&
            (identical(other.idBarang, idBarang) ||
                other.idBarang == idBarang) &&
            (identical(other.idJenisBarang, idJenisBarang) ||
                other.idJenisBarang == idJenisBarang) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.hargaSatuan, hargaSatuan) ||
                other.hargaSatuan == hargaSatuan) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, idBarang, idJenisBarang, nama, hargaSatuan, lastUpdatedDate);

  /// Create a copy of Barang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BarangImplCopyWith<_$BarangImpl> get copyWith =>
      __$$BarangImplCopyWithImpl<_$BarangImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarangImplToJson(
      this,
    );
  }
}

abstract class _Barang implements Barang {
  const factory _Barang(
      {final int? idBarang,
      final int? idJenisBarang,
      final String? nama,
      final double? hargaSatuan,
      final DateTime? lastUpdatedDate}) = _$BarangImpl;

  factory _Barang.fromJson(Map<String, dynamic> json) = _$BarangImpl.fromJson;

  @override
  int? get idBarang;
  @override
  int? get idJenisBarang;
  @override
  String? get nama;
  @override
  double? get hargaSatuan;
  @override
  DateTime? get lastUpdatedDate;

  /// Create a copy of Barang
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarangImplCopyWith<_$BarangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
