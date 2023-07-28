// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_pattern.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftPattern _$ShiftPatternFromJson(Map<String, dynamic> json) => ShiftPattern(
      id: json['id'] as int,
      patternName: json['pattern_name'] as String,
      code: json['code'] as String,
      overtimeBasedOn: json['overtime_based_on'] as String,
      mondayShiftDailyId: json['monday_shift_daily_id'] as int?,
      tuesdayShiftDailyId: json['tuesday_shift_daily_id'] as int?,
      wednesdayShiftDailyId: json['wednesday_shift_daily_id'] as int?,
      thursdayShiftDailyId: json['thursday_shift_daily_id'] as int?,
      fridayShiftDailyId: json['friday_shift_daily_id'] as int?,
      saturdayShiftDailyId: json['saturday_shift_daily_id'] as int?,
      sundayShiftDailyId: json['sunday_shift_daily_id'] as int?,
      totalHours: json['total_hours'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ShiftPatternToJson(ShiftPattern instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pattern_name': instance.patternName,
      'code': instance.code,
      'overtime_based_on': instance.overtimeBasedOn,
      'monday_shift_daily_id': instance.mondayShiftDailyId,
      'tuesday_shift_daily_id': instance.tuesdayShiftDailyId,
      'wednesday_shift_daily_id': instance.wednesdayShiftDailyId,
      'thursday_shift_daily_id': instance.thursdayShiftDailyId,
      'friday_shift_daily_id': instance.fridayShiftDailyId,
      'saturday_shift_daily_id': instance.saturdayShiftDailyId,
      'sunday_shift_daily_id': instance.sundayShiftDailyId,
      'total_hours': instance.totalHours,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
