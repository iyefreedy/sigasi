// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kebutuhan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Kebutuhan _$KebutuhanFromJson(Map<String, dynamic> json) {
  return _Kebutuhan.fromJson(json);
}

/// @nodoc
mixin _$Kebutuhan {
  int? get idKebutuhan => throw _privateConstructorUsedError;
  int? get idBarang => throw _privateConstructorUsedError;
  int? get idPosko => throw _privateConstructorUsedError;
  int? get jumlahKebutuhan => throw _privateConstructorUsedError;
  int? get jumlahDiterima => throw _privateConstructorUsedError;
  int? get lastUpdatedBy => throw _privateConstructorUsedError;
  DateTime? get lastUpdatedDate => throw _privateConstructorUsedError;
  Posko? get posko => throw _privateConstructorUsedError;
  Barang? get barang => throw _privateConstructorUsedError;

  /// Serializes this Kebutuhan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Kebutuhan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KebutuhanCopyWith<Kebutuhan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KebutuhanCopyWith<$Res> {
  factory $KebutuhanCopyWith(Kebutuhan value, $Res Function(Kebutuhan) then) =
      _$KebutuhanCopyWithImpl<$Res, Kebutuhan>;
  @useResult
  $Res call(
      {int? idKebutuhan,
      int? idBarang,
      int? idPosko,
      int? jumlahKebutuhan,
      int? jumlahDiterima,
      int? lastUpdatedBy,
      DateTime? lastUpdatedDate,
      Posko? posko,
      Barang? barang});

  $PoskoCopyWith<$Res>? get posko;
  $BarangCopyWith<$Res>? get barang;
}

/// @nodoc
class _$KebutuhanCopyWithImpl<$Res, $Val extends Kebutuhan>
    implements $KebutuhanCopyWith<$Res> {
  _$KebutuhanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Kebutuhan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKebutuhan = freezed,
    Object? idBarang = freezed,
    Object? idPosko = freezed,
    Object? jumlahKebutuhan = freezed,
    Object? jumlahDiterima = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? posko = freezed,
    Object? barang = freezed,
  }) {
    return _then(_value.copyWith(
      idKebutuhan: freezed == idKebutuhan
          ? _value.idKebutuhan
          : idKebutuhan // ignore: cast_nullable_to_non_nullable
              as int?,
      idBarang: freezed == idBarang
          ? _value.idBarang
          : idBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      idPosko: freezed == idPosko
          ? _value.idPosko
          : idPosko // ignore: cast_nullable_to_non_nullable
              as int?,
      jumlahKebutuhan: freezed == jumlahKebutuhan
          ? _value.jumlahKebutuhan
          : jumlahKebutuhan // ignore: cast_nullable_to_non_nullable
              as int?,
      jumlahDiterima: freezed == jumlahDiterima
          ? _value.jumlahDiterima
          : jumlahDiterima // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      posko: freezed == posko
          ? _value.posko
          : posko // ignore: cast_nullable_to_non_nullable
              as Posko?,
      barang: freezed == barang
          ? _value.barang
          : barang // ignore: cast_nullable_to_non_nullable
              as Barang?,
    ) as $Val);
  }

  /// Create a copy of Kebutuhan
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

  /// Create a copy of Kebutuhan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BarangCopyWith<$Res>? get barang {
    if (_value.barang == null) {
      return null;
    }

    return $BarangCopyWith<$Res>(_value.barang!, (value) {
      return _then(_value.copyWith(barang: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KebutuhanImplCopyWith<$Res>
    implements $KebutuhanCopyWith<$Res> {
  factory _$$KebutuhanImplCopyWith(
          _$KebutuhanImpl value, $Res Function(_$KebutuhanImpl) then) =
      __$$KebutuhanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idKebutuhan,
      int? idBarang,
      int? idPosko,
      int? jumlahKebutuhan,
      int? jumlahDiterima,
      int? lastUpdatedBy,
      DateTime? lastUpdatedDate,
      Posko? posko,
      Barang? barang});

  @override
  $PoskoCopyWith<$Res>? get posko;
  @override
  $BarangCopyWith<$Res>? get barang;
}

/// @nodoc
class __$$KebutuhanImplCopyWithImpl<$Res>
    extends _$KebutuhanCopyWithImpl<$Res, _$KebutuhanImpl>
    implements _$$KebutuhanImplCopyWith<$Res> {
  __$$KebutuhanImplCopyWithImpl(
      _$KebutuhanImpl _value, $Res Function(_$KebutuhanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Kebutuhan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKebutuhan = freezed,
    Object? idBarang = freezed,
    Object? idPosko = freezed,
    Object? jumlahKebutuhan = freezed,
    Object? jumlahDiterima = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? posko = freezed,
    Object? barang = freezed,
  }) {
    return _then(_$KebutuhanImpl(
      idKebutuhan: freezed == idKebutuhan
          ? _value.idKebutuhan
          : idKebutuhan // ignore: cast_nullable_to_non_nullable
              as int?,
      idBarang: freezed == idBarang
          ? _value.idBarang
          : idBarang // ignore: cast_nullable_to_non_nullable
              as int?,
      idPosko: freezed == idPosko
          ? _value.idPosko
          : idPosko // ignore: cast_nullable_to_non_nullable
              as int?,
      jumlahKebutuhan: freezed == jumlahKebutuhan
          ? _value.jumlahKebutuhan
          : jumlahKebutuhan // ignore: cast_nullable_to_non_nullable
              as int?,
      jumlahDiterima: freezed == jumlahDiterima
          ? _value.jumlahDiterima
          : jumlahDiterima // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      posko: freezed == posko
          ? _value.posko
          : posko // ignore: cast_nullable_to_non_nullable
              as Posko?,
      barang: freezed == barang
          ? _value.barang
          : barang // ignore: cast_nullable_to_non_nullable
              as Barang?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KebutuhanImpl implements _Kebutuhan {
  const _$KebutuhanImpl(
      {this.idKebutuhan,
      this.idBarang,
      this.idPosko,
      this.jumlahKebutuhan,
      this.jumlahDiterima,
      this.lastUpdatedBy,
      this.lastUpdatedDate,
      this.posko,
      this.barang});

  factory _$KebutuhanImpl.fromJson(Map<String, dynamic> json) =>
      _$$KebutuhanImplFromJson(json);

  @override
  final int? idKebutuhan;
  @override
  final int? idBarang;
  @override
  final int? idPosko;
  @override
  final int? jumlahKebutuhan;
  @override
  final int? jumlahDiterima;
  @override
  final int? lastUpdatedBy;
  @override
  final DateTime? lastUpdatedDate;
  @override
  final Posko? posko;
  @override
  final Barang? barang;

  @override
  String toString() {
    return 'Kebutuhan(idKebutuhan: $idKebutuhan, idBarang: $idBarang, idPosko: $idPosko, jumlahKebutuhan: $jumlahKebutuhan, jumlahDiterima: $jumlahDiterima, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, posko: $posko, barang: $barang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KebutuhanImpl &&
            (identical(other.idKebutuhan, idKebutuhan) ||
                other.idKebutuhan == idKebutuhan) &&
            (identical(other.idBarang, idBarang) ||
                other.idBarang == idBarang) &&
            (identical(other.idPosko, idPosko) || other.idPosko == idPosko) &&
            (identical(other.jumlahKebutuhan, jumlahKebutuhan) ||
                other.jumlahKebutuhan == jumlahKebutuhan) &&
            (identical(other.jumlahDiterima, jumlahDiterima) ||
                other.jumlahDiterima == jumlahDiterima) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
            (identical(other.posko, posko) || other.posko == posko) &&
            (identical(other.barang, barang) || other.barang == barang));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idKebutuhan,
      idBarang,
      idPosko,
      jumlahKebutuhan,
      jumlahDiterima,
      lastUpdatedBy,
      lastUpdatedDate,
      posko,
      barang);

  /// Create a copy of Kebutuhan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KebutuhanImplCopyWith<_$KebutuhanImpl> get copyWith =>
      __$$KebutuhanImplCopyWithImpl<_$KebutuhanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KebutuhanImplToJson(
      this,
    );
  }
}

abstract class _Kebutuhan implements Kebutuhan {
  const factory _Kebutuhan(
      {final int? idKebutuhan,
      final int? idBarang,
      final int? idPosko,
      final int? jumlahKebutuhan,
      final int? jumlahDiterima,
      final int? lastUpdatedBy,
      final DateTime? lastUpdatedDate,
      final Posko? posko,
      final Barang? barang}) = _$KebutuhanImpl;

  factory _Kebutuhan.fromJson(Map<String, dynamic> json) =
      _$KebutuhanImpl.fromJson;

  @override
  int? get idKebutuhan;
  @override
  int? get idBarang;
  @override
  int? get idPosko;
  @override
  int? get jumlahKebutuhan;
  @override
  int? get jumlahDiterima;
  @override
  int? get lastUpdatedBy;
  @override
  DateTime? get lastUpdatedDate;
  @override
  Posko? get posko;
  @override
  Barang? get barang;

  /// Create a copy of Kebutuhan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KebutuhanImplCopyWith<_$KebutuhanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
