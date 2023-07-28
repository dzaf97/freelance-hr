import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/attendance/attendance.dart';
import 'package:myezhr/models/shift/shift_daily.dart';
import 'package:myezhr/models/user/user.dart';
part 'attendance_correction.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AttendanceCorrection {
  AttendanceCorrection({
    required this.id,
    required this.userId,
    required this.requestorId,
    required this.attendanceId,
    required this.shiftDailyId,
    required this.date,
    this.prevStartTime,
    this.prevEndTime,
    required this.newStartTime,
    required this.newEndTime,
    required this.remarks,
    required this.status,
    this.approverId,
    required this.createdAt,
    required this.updatedAt,
    required this.shiftDaily,
    required this.user,
    required this.attendance,
    this.approver,
  });

  int id;
  int userId;
  int requestorId;
  int attendanceId;
  int shiftDailyId;
  DateTime date;
  String? prevStartTime;
  String? prevEndTime;
  String newStartTime;
  String newEndTime;
  String remarks;
  String status;
  int? approverId;
  DateTime createdAt;
  DateTime updatedAt;
  ShiftDaily shiftDaily;
  User user;
  Attendance attendance;
  User? approver;

  factory AttendanceCorrection.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCorrectionFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceCorrectionToJson(this);
}
