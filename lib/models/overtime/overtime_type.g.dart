// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeType _$OvertimeTypeFromJson(Map<String, dynamic> json) => OvertimeType(
      id: json['id'] as int,
      type: json['type'] as String,
      code: json['code'] as String,
      applyBefore: json['apply_before'] as int,
      maxTime: json['max_time'] as int,
      minTime: json['min_time'] as int,
      overtimeRounding: json['overtime_rounding'] as int,
      overtimeRoundLimit: json['overtime_round_limit'] as int,
      deductTime: json['deduct_time'] as int,
      everyOvertimeAchieved: json['every_overtime_achieved'] as int,
      isActive: json['is_active'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OvertimeTypeToJson(OvertimeType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'code': instance.code,
      'apply_before': instance.applyBefore,
      'max_time': instance.maxTime,
      'min_time': instance.minTime,
      'overtime_rounding': instance.overtimeRounding,
      'overtime_round_limit': instance.overtimeRoundLimit,
      'deduct_time': instance.deductTime,
      'every_overtime_achieved': instance.everyOvertimeAchieved,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
