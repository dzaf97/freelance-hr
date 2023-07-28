import 'package:json_annotation/json_annotation.dart';
part 'shift_pattern.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ShiftPattern {
  ShiftPattern({
    required this.id,
    required this.patternName,
    required this.code,
    required this.overtimeBasedOn,
    this.mondayShiftDailyId,
    this.tuesdayShiftDailyId,
    this.wednesdayShiftDailyId,
    this.thursdayShiftDailyId,
    this.fridayShiftDailyId,
    this.saturdayShiftDailyId,
    this.sundayShiftDailyId,
    this.totalHours,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String patternName;
  String code;
  String overtimeBasedOn;
  int? mondayShiftDailyId;
  int? tuesdayShiftDailyId;
  int? wednesdayShiftDailyId;
  int? thursdayShiftDailyId;
  int? fridayShiftDailyId;
  int? saturdayShiftDailyId;
  int? sundayShiftDailyId;
  dynamic totalHours;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ShiftPattern.fromJson(Map<String, dynamic> json) =>
      _$ShiftPatternFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftPatternToJson(this);
}
