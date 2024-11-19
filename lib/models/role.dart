import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  const Role({
    this.id,
    this.name,
  });

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
