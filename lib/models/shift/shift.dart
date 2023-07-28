import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/shift/shift_daily.dart';
part 'shift.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Shift {
  Shift({
    required this.id,
    required this.userId,
    this.shiftDailyId,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    this.shiftDaily,
  });

  int id;
  int userId;
  int? shiftDailyId;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;
  ShiftDaily? shiftDaily;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
