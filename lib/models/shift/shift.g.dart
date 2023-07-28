// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      shiftDailyId: json['shift_daily_id'] as int?,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      shiftDaily: json['shift_daily'] == null
          ? null
          : ShiftDaily.fromJson(json['shift_daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'shift_daily_id': instance.shiftDailyId,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'shift_daily': instance.shiftDaily?.toJson(),
    };
