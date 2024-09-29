import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident.freezed.dart';
part 'resident.g.dart';

enum Gender {
  @JsonValue('MALE')
  male('Laki-Laki'),
  @JsonValue('FEMALE')
  female('Perempuan');

  const Gender(this.label);
  final String label;
}

@freezed
class Resident with _$Resident {
  const factory Resident({
    int? id,
    int? populationGroupId,
    int? villageId,
    String? identityNumber,
    String? name,
    String? address,
    DateTime? birthDate,
    Gender? gender,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Resident;

  factory Resident.fromJson(Map<String, Object?> json) =>
      _$ResidentFromJson(json);
}
