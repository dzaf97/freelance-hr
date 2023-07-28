import 'package:json_annotation/json_annotation.dart';
part 'employee_status.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class EmployeeStatus {
  EmployeeStatus({
    required this.id,
    required this.code,
    required this.status,
    required this.isActive,
    required this.remindEndDate,
    required this.remindType,
    required this.remindTimes,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String code;
  String status;
  int isActive;
  int remindEndDate;
  dynamic remindType;
  dynamic remindTimes;
  DateTime createdAt;
  DateTime updatedAt;

  factory EmployeeStatus.fromJson(Map<String, dynamic> json) =>
      _$EmployeeStatusFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeStatusToJson(this);
}
