// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'population_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PopulationGroup _$PopulationGroupFromJson(Map<String, dynamic> json) {
  return _PopulationGroup.fromJson(json);
}

/// @nodoc
mixin _$PopulationGroup {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PopulationGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopulationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopulationGroupCopyWith<PopulationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopulationGroupCopyWith<$Res> {
  factory $PopulationGroupCopyWith(
          PopulationGroup value, $Res Function(PopulationGroup) then) =
      _$PopulationGroupCopyWithImpl<$Res, PopulationGroup>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PopulationGroupCopyWithImpl<$Res, $Val extends PopulationGroup>
    implements $PopulationGroupCopyWith<$Res> {
  _$PopulationGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopulationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopulationGroupImplCopyWith<$Res>
    implements $PopulationGroupCopyWith<$Res> {
  factory _$$PopulationGroupImplCopyWith(_$PopulationGroupImpl value,
          $Res Function(_$PopulationGroupImpl) then) =
      __$$PopulationGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PopulationGroupImplCopyWithImpl<$Res>
    extends _$PopulationGroupCopyWithImpl<$Res, _$PopulationGroupImpl>
    implements _$$PopulationGroupImplCopyWith<$Res> {
  __$$PopulationGroupImplCopyWithImpl(
      _$PopulationGroupImpl _value, $Res Function(_$PopulationGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopulationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PopulationGroupImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopulationGroupImpl implements _PopulationGroup {
  const _$PopulationGroupImpl(
      {this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.updatedAt});

  factory _$PopulationGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopulationGroupImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PopulationGroup(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopulationGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, createdAt, updatedAt);

  /// Create a copy of PopulationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopulationGroupImplCopyWith<_$PopulationGroupImpl> get copyWith =>
      __$$PopulationGroupImplCopyWithImpl<_$PopulationGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopulationGroupImplToJson(
      this,
    );
  }
}

abstract class _PopulationGroup implements PopulationGroup {
  const factory _PopulationGroup(
      {final int? id,
      required final String name,
      final String? description,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PopulationGroupImpl;

  factory _PopulationGroup.fromJson(Map<String, dynamic> json) =
      _$PopulationGroupImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of PopulationGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopulationGroupImplCopyWith<_$PopulationGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
