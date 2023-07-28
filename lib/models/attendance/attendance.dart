import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/shift/shift_daily.dart';
part 'attendance.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Attendance {
  Attendance({
    required this.id,
    required this.userId,
    this.shiftDailyId,
    this.type,
    this.startTime,
    this.endTime,
    required this.status,
    this.attachmentPathIn,
    this.attachmentPathOut,
    this.latLongIn,
    this.latLongOut,
    this.createdAt,
    this.updatedAt,
    this.shiftDaily,
  });

  int id;
  int userId;
  int? shiftDailyId;
  String? type;
  DateTime? startTime;
  DateTime? endTime;
  String status;
  String? attachmentPathIn;
  String? attachmentPathOut;
  String? latLongIn;
  String? latLongOut;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShiftDaily? shiftDaily;

  factory Attendance.fromJson(Map<String, dynamic> json) => _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}
