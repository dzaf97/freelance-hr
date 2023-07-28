// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftDaily _$ShiftDailyFromJson(Map<String, dynamic> json) => ShiftDaily(
      id: json['id'] as int,
      shiftName: json['shift_name'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      hours: json['hours'] as num?,
      color: json['color'] as String?,
      graceForLate: json['grace_for_late'] as int?,
      earlyIn: json['early_in'] as int?,
      lateIn: json['late_in'] as int?,
      earlyOut: json['early_out'] as int?,
      lateOut: json['late_out'] as int?,
      isWfh: json['is_wfh'] as int?,
      isFlexible: json['is_flexible'] as int?,
      overtimeTypeId: json['overtime_type_id'] as int?,
      overtimeStartTime: json['overtime_start_time'] as String?,
      overtimeEndTime: json['overtime_end_time'] as String?,
      requirePhoto: json['require_photo'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ShiftDailyToJson(ShiftDaily instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shift_name': instance.shiftName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'hours': instance.hours,
      'color': instance.color,
      'grace_for_late': instance.graceForLate,
      'early_in': instance.earlyIn,
      'late_in': instance.lateIn,
      'early_out': instance.earlyOut,
      'late_out': instance.lateOut,
      'is_wfh': instance.isWfh,
      'is_flexible': instance.isFlexible,
      'overtime_type_id': instance.overtimeTypeId,
      'overtime_start_time': instance.overtimeStartTime,
      'overtime_end_time': instance.overtimeEndTime,
      'require_photo': instance.requirePhoto,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
