// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      shiftDailyId: json['shift_daily_id'] as int?,
      type: json['type'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      status: json['status'] as String,
      attachmentPathIn: json['attachment_path_in'] as String?,
      attachmentPathOut: json['attachment_path_out'] as String?,
      latLongIn: json['lat_long_in'] as String?,
      latLongOut: json['lat_long_out'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      shiftDaily: json['shift_daily'] == null
          ? null
          : ShiftDaily.fromJson(json['shift_daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'shift_daily_id': instance.shiftDailyId,
      'type': instance.type,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'attachment_path_in': instance.attachmentPathIn,
      'attachment_path_out': instance.attachmentPathOut,
      'lat_long_in': instance.latLongIn,
      'lat_long_out': instance.latLongOut,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'shift_daily': instance.shiftDaily?.toJson(),
    };
