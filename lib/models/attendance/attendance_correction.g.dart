// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_correction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceCorrection _$AttendanceCorrectionFromJson(
        Map<String, dynamic> json) =>
    AttendanceCorrection(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      requestorId: json['requestor_id'] as int,
      attendanceId: json['attendance_id'] as int,
      shiftDailyId: json['shift_daily_id'] as int,
      date: DateTime.parse(json['date'] as String),
      prevStartTime: json['prev_start_time'] as String?,
      prevEndTime: json['prev_end_time'] as String?,
      newStartTime: json['new_start_time'] as String,
      newEndTime: json['new_end_time'] as String,
      remarks: json['remarks'] as String,
      status: json['status'] as String,
      approverId: json['approver_id'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      shiftDaily:
          ShiftDaily.fromJson(json['shift_daily'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      attendance:
          Attendance.fromJson(json['attendance'] as Map<String, dynamic>),
      approver: json['approver'] == null
          ? null
          : User.fromJson(json['approver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttendanceCorrectionToJson(
        AttendanceCorrection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'requestor_id': instance.requestorId,
      'attendance_id': instance.attendanceId,
      'shift_daily_id': instance.shiftDailyId,
      'date': instance.date.toIso8601String(),
      'prev_start_time': instance.prevStartTime,
      'prev_end_time': instance.prevEndTime,
      'new_start_time': instance.newStartTime,
      'new_end_time': instance.newEndTime,
      'remarks': instance.remarks,
      'status': instance.status,
      'approver_id': instance.approverId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'shift_daily': instance.shiftDaily.toJson(),
      'user': instance.user.toJson(),
      'attendance': instance.attendance.toJson(),
      'approver': instance.approver?.toJson(),
    };
