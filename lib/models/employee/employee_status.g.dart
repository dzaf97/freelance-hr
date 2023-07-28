// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeStatus _$EmployeeStatusFromJson(Map<String, dynamic> json) =>
    EmployeeStatus(
      id: json['id'] as int,
      code: json['code'] as String,
      status: json['status'] as String,
      isActive: json['is_active'] as int,
      remindEndDate: json['remind_end_date'] as int,
      remindType: json['remind_type'],
      remindTimes: json['remind_times'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EmployeeStatusToJson(EmployeeStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'status': instance.status,
      'is_active': instance.isActive,
      'remind_end_date': instance.remindEndDate,
      'remind_type': instance.remindType,
      'remind_times': instance.remindTimes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
