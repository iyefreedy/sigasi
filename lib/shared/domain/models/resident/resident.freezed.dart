// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resident _$ResidentFromJson(Map<String, dynamic> json) {
  return _Resident.fromJson(json);
}

/// @nodoc
mixin _$Resident {
  int? get id => throw _privateConstructorUsedError;
  int? get populationGroupId => throw _privateConstructorUsedError;
  int? get villageId => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Resident to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResidentCopyWith<Resident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentCopyWith<$Res> {
  factory $ResidentCopyWith(Resident value, $Res Function(Resident) then) =
      _$ResidentCopyWithImpl<$Res, Resident>;
  @useResult
  $Res call(
      {int? id,
      int? populationGroupId,
      int? villageId,
      String? identityNumber,
      String? name,
      String? address,
      DateTime? birthDate,
      Gender? gender,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ResidentCopyWithImpl<$Res, $Val extends Resident>
    implements $ResidentCopyWith<$Res> {
  _$ResidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? populationGroupId = freezed,
    Object? villageId = freezed,
    Object? identityNumber = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      populationGroupId: freezed == populationGroupId
          ? _value.populationGroupId
          : populationGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      villageId: freezed == villageId
          ? _value.villageId
          : villageId // ignore: cast_nullable_to_non_nullable
              as int?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidentImplCopyWith<$Res>
    implements $ResidentCopyWith<$Res> {
  factory _$$ResidentImplCopyWith(
          _$ResidentImpl value, $Res Function(_$ResidentImpl) then) =
      __$$ResidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? populationGroupId,
      int? villageId,
      String? identityNumber,
      String? name,
      String? address,
      DateTime? birthDate,
      Gender? gender,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ResidentImplCopyWithImpl<$Res>
    extends _$ResidentCopyWithImpl<$Res, _$ResidentImpl>
    implements _$$ResidentImplCopyWith<$Res> {
  __$$ResidentImplCopyWithImpl(
      _$ResidentImpl _value, $Res Function(_$ResidentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? populationGroupId = freezed,
    Object? villageId = freezed,
    Object? identityNumber = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ResidentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      populationGroupId: freezed == populationGroupId
          ? _value.populationGroupId
          : populationGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      villageId: freezed == villageId
          ? _value.villageId
          : villageId // ignore: cast_nullable_to_non_nullable
              as int?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResidentImpl implements _Resident {
  const _$ResidentImpl(
      {this.id,
      this.populationGroupId,
      this.villageId,
      this.identityNumber,
      this.name,
      this.address,
      this.birthDate,
      this.gender,
      this.createdAt,
      this.updatedAt});

  factory _$ResidentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentImplFromJson(json);

  @override
  final int? id;
  @override
  final int? populationGroupId;
  @override
  final int? villageId;
  @override
  final String? identityNumber;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final DateTime? birthDate;
  @override
  final Gender? gender;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Resident(id: $id, populationGroupId: $populationGroupId, villageId: $villageId, identityNumber: $identityNumber, name: $name, address: $address, birthDate: $birthDate, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.populationGroupId, populationGroupId) ||
                other.populationGroupId == populationGroupId) &&
            (identical(other.villageId, villageId) ||
                other.villageId == villageId) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, populationGroupId, villageId,
      identityNumber, name, address, birthDate, gender, createdAt, updatedAt);

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentImplCopyWith<_$ResidentImpl> get copyWith =>
      __$$ResidentImplCopyWithImpl<_$ResidentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentImplToJson(
      this,
    );
  }
}

abstract class _Resident implements Resident {
  const factory _Resident(
      {final int? id,
      final int? populationGroupId,
      final int? villageId,
      final String? identityNumber,
      final String? name,
      final String? address,
      final DateTime? birthDate,
      final Gender? gender,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ResidentImpl;

  factory _Resident.fromJson(Map<String, dynamic> json) =
      _$ResidentImpl.fromJson;

  @override
  int? get id;
  @override
  int? get populationGroupId;
  @override
  int? get villageId;
  @override
  String? get identityNumber;
  @override
  String? get name;
  @override
  String? get address;
  @override
  DateTime? get birthDate;
  @override
  Gender? get gender;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResidentImplCopyWith<_$ResidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
