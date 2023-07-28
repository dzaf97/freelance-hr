import 'package:json_annotation/json_annotation.dart';
part 'overtime_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OvertimeType {
  OvertimeType({
    required this.id,
    required this.type,
    required this.code,
    required this.applyBefore,
    required this.maxTime,
    required this.minTime,
    required this.overtimeRounding,
    required this.overtimeRoundLimit,
    required this.deductTime,
    required this.everyOvertimeAchieved,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String type;
  String code;
  int applyBefore;
  int maxTime;
  int minTime;
  int overtimeRounding;
  int overtimeRoundLimit;
  int deductTime;
  int everyOvertimeAchieved;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory OvertimeType.fromJson(Map<String, dynamic> json) =>
      _$OvertimeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeTypeToJson(this);
}
